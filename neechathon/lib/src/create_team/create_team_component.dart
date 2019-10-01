import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:neechathon/src/models/project.dart';
import 'package:neechathon/src/models/team.dart';
import 'package:neechathon/src/services/team_service.dart';
import '../models/user.dart';
import 'dart:html';

@Component(
  selector: 'create-team',
  directives: [coreDirectives, formDirectives, routerDirectives],
  templateUrl: 'create_team_component.html',
)
class CreateTeamComponent {
  List<String> options = [
    "2",
    "3",
    "4"
  ];

  Project project = Project(1, "", "", "", "");
  User user1 =  User(1, "", "", "", "", "", "");
  User user2 =  User(2, "", "", "", "", "", "");
  User user3 =  User(3, "", "", "", "", "", "");
  User user4 =  User(4, "", "", "", "", "", "");
  String exceedeNumberOfUsers = "";

  TeamService _teamService;
  CreateTeamComponent(this._teamService);

  String numberOfMembersText = "0";
  int numberOfMembers = 0;
   void onKey(dynamic event) {
    numberOfMembersText = event.target.value;
    numberOfMembers = int.parse(numberOfMembersText);
    if(numberOfMembers > 4){
      exceedeNumberOfUsers = "The team can have a maximum of 4 members";
    }else if(numberOfMembers < 2){
      exceedeNumberOfUsers = "The team must have at least 2 members";
    }else{
      exceedeNumberOfUsers = "";
    }
  }

  bool submitted = false;
  String out;

  bool valid = false;

  void applyChange(String val) {
    numberOfMembers = int.parse(val);
  }


  Map<String, bool> setCssValidityClass(NgControl control) {
    final validityClass = control.valid == true ? 'is-valid' : 'is-invalid';
    return {validityClass: true};
  }

  Future<void> onSubmit() async {
    submitted = true;

    if(numberOfMembers < 3){
      user3 = null;
    }
    if(numberOfMembers < 4){
      user4 = null;
    }
    Team team = new Team(1, user1, user2, user3, user4, user1.teamName, project);
    out = await _teamService.create(team);
    if (out == "All users, project and team were created successfully!!"){
      valid = true;
    }else{
      valid = false;
    }
  }

}
