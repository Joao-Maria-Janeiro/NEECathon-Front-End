import '../models/transaction.dart';
import 'package:http/http.dart';
import 'dart:convert';

class TransactionService {

  final Client _http;
  TransactionService(this._http);

  var headers = {'Content-Type': 'application/json'};
  Future<String> create(Transaction transaction, String token) async {
    try {
      headers['Authorization'] = 'Bearer ' + token;
      final reponse = await _http.post("http://localhost:1995/" + "transactions/create/", headers: headers, body: json.encode(transaction.toJson()));
      return(reponse.body);
    }catch (e){
      return "No internet connection";
    }
  }
}
