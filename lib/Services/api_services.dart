import 'dart:convert';
import 'package:http/http.dart' as http;


final String _url = "http://127.0.0.1:8000/api/";

class CallApi {

Future<http.Response> postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

 Future<http.Response> getData(apiUrl, String token) async {
    var fullUrl = _url + apiUrl;
    return await http.get(
      Uri.parse(fullUrl),
      headers: _setHeadersWithToken(token),
    );
  }

  Map<String, String> _setHeaders() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Map<String, String> _setHeadersWithToken(String token) {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}