import 'package:flutter/material.dart';


class AddPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AddPage> {
  
   String _medicamento;

   List<String> _medicamentos = ['Presentación', 'Pastilla', 'Capsula', 'Gota', 'Inyecciòn'];

   String _opcionSeleccionada = 'Presentación';

   List<String> _especialidades = ['Cantidad', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  String _optSeleccionada = 'Cantidad';

  List<String> _frecuencia = ['Frecuencia', 'Mensualmente', '15 días', 'Semanalmente', '24 horas', '12 horas', '8 horas', '6 horas'];

   String _optionSeleccionada = 'Frecuencia';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Medicamento'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearAdd(),
          Divider(),
          _crearPresentacion(),
          Divider(),
          _crearCantidad(),
          Divider(),
          _crearFrecuencia(),
          Divider(),
           Center(
            child: RaisedButton(
              child: Text('Agregar Medicamento'),
              color: Colors.lightBlue,
              textColor: Colors.white,
              shape: StadiumBorder(),
              onPressed: ()=> _mostrarAlerta(context),
            ),
          )
        ],
      ),
    );
  }

  _crearAdd() {

    //var color;
    return TextField(
    // autofocus: true,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      hintText: 'Nombre del medicamento',
      labelText: 'Nombre',
      suffixIcon: Icon (Icons.add),
      icon: Icon(Icons.add_box)
    ),
    onChanged: (valor) {
      setState(() {
      
      _medicamento = valor;
        
      });
    },
  );
  
  }

  List<DropdownMenuItem<String>> getOpciones() {
          
              List<DropdownMenuItem<String>> lista = new List();
          
              _medicamentos.forEach( (medicamento) {
          
                lista.add(DropdownMenuItem(
                  child: Text(medicamento),
                  value: medicamento,
                ));
          
              });
          
              return lista;
          
            }

  Widget _crearPresentacion() {
          
    return Row(
      children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0,),
      Expanded(
        child: DropdownButton(
        value: _opcionSeleccionada,
        items: getOpciones(),
        onChanged: (opt) {
          setState(() {
           _opcionSeleccionada = opt; 
          });
        },

    ),
      )
      ],
    ); 
              
  }

  List<DropdownMenuItem<String>> getOpts() {
          
              List<DropdownMenuItem<String>> lista = new List();
          
              _especialidades.forEach( (especialidad) {
          
                lista.add(DropdownMenuItem(
                  child: Text(especialidad),
                  value: especialidad,
                ));
          
              });
          
              return lista;
          
            }
          
  Widget  _crearCantidad() {
      return Row(
      children: <Widget>[
      Icon(Icons.add_circle_outline),
      SizedBox(width: 30.0,),
      Expanded(
        child: DropdownButton(
        value: _optSeleccionada,
        items: getOpts(),
        onChanged: (opt) {
          setState(() {
           _optSeleccionada = opt; 
          });
        },

    ),
      )
      ],
    ); 
  }

  List<DropdownMenuItem<String>> getOps() {
          
              List<DropdownMenuItem<String>> lista = new List();
          
              _frecuencia.forEach( (frecuencia) {
          
                lista.add(DropdownMenuItem(
                  child: Text(frecuencia),
                  value: frecuencia,
                ));
          
              });
          
              return lista;
          
            }
          
  Widget  _crearFrecuencia() {
      return Row(
      children: <Widget>[
      Icon(Icons.timer),
      SizedBox(width: 30.0,),
      Expanded(
        child: DropdownButton(
        value: _optionSeleccionada,
        items: getOps(),
        onChanged: (opt) {
          setState(() {
           _optionSeleccionada = opt; 
          });
        },

    ),
      )
      ],
    ); 
  }

void _mostrarAlerta(BuildContext context) {

    showDialog(

      context: context,
      barrierDismissible: true,
      builder: (context) {

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("¡Medicamento Agregado!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Su medicamento ha sido agregado correctamente"),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: ()=> Navigator.of(context).pop(),
            )
          ],
        );

      }

    );

  }


}