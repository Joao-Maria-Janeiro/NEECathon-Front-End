import '../models/team.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../models/user.dart';

class LoginService {

  final Client _http;
  LoginService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  Future<String> create(User user) async {
    try {
      final response = await _http.post("http://localhost:1995/" + "login", headers: _headers, body: json.encode(user.toJsonLogin()));
      print(response.statusCode);
      if(response.statusCode == 200)
        return 'Login successful';
      else
        return 'The email and password do not match';
    }catch (e){
      throw _handleError;
    }
  }

  Future<String> getToken(String email) async {
    try{
      final response = await _http.post("http://localhost:1995/" + "users/getToken", headers: _headers, body: json.encode({'email': email}));
      return response.body;
    }catch (e){
      print(e);
      return 'ERROR';
    }
  }

  Exception _handleError(dynamic e){
    print(e);
    return Exception("There was an error logging in: $e");
  }



}
