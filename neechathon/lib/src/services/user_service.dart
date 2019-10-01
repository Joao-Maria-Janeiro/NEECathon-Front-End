import '../models/user.dart';
import 'package:http/http.dart';
import 'dart:convert';

class UserService {

  final Client _http;
  UserService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  Future<String> create(User user) async {
    print(json.encode(user.toJson()));
    try {
      final reponse = await _http.post("http://localhost:1995/" + "users/create/", headers: _headers, body: json.encode(user.toJson()));
      return(reponse.toString());
    }catch (e){
      //throw _handleError;
      return "No internet connection";
    }
  }

  Exception _handleError(dynamic e){
    print(e);
    return Exception("There was an error creating the user: $e");
  }



}
