import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prohealth/src/models/infoapi_model.dart';

class DatasProvider {

  String _apiKey = "n3YGOIXeWGMUwO9HPfNJME18xZUgC4UiC11LhRL5uuE";
  String _url = "APIProHealth.test";
  String _language = 'es-Es';


  Future<List<Data>> getCitasMedicas() async {

    final url = Uri.https(_url, '/medicaldates', {

      'api_key' : _apiKey,
      'language' : _language

    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    print(decodedData);

    return [];

  }

}