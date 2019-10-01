import '../models/team.dart';
import 'package:http/http.dart';
import 'dart:convert';

class TeamService {

  List<Map<String, String>> teams;
  final Client _http;
  TeamService(this._http);

  static final _headers = {'Content-Type': 'application/json'};
  Future<String> create(Team team) async {
    try {
      final reponse = await _http.post("http://localhost:1995/" + "api/create/", headers: _headers, body: json.encode(team.toJson()));
      return(reponse.body);
    }catch (e){
      return "No internet connection";
      //throw _handleError;
    }
  }

  // TODO finish this up
  Future<List<Team>> getAllTeams() async {
    try {
      final response = await _http.get("http://localhost:1995/" + "teams/simple/", headers: _headers);
      final teams = (_extractData(response) as List)
        .map((value) => Team.fromJson(value))
        .toList();
      return teams;
    }catch (e){
      return null;
      // return "No internet connection";
      //throw _handleError;
    }
  }

  Future<Team> getTeam(String teamName) async {
    try {
      final response = await _http.get("http://localhost:1995/" + "teams/" + teamName, headers: _headers);
      // Change this fromJson to a more complex one for the team details
      return Team.fromJson(json.decode(response.body));
    }catch (e){
      return null;
      // return "No internet connection";
      //throw _handleError;
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body);

  Exception _handleError(dynamic e){
    print(e);
    return Exception("There was an error: $e");
  }



}
