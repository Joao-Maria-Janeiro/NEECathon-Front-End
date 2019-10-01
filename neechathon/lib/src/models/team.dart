import 'project.dart';
import 'user.dart';

class Team {
  final int id;
  User user1, user2, user3, user4;
  Project project;
  String name;
  Team(this.id, this.user1, this.user2, this.user3, this.user4, this.name, this.project);

  Map toJson() {
    var dict = {
      'username1': user1.name,
      'password1': user1.password,
      'email1': user1.email,
      'linkedIn1': user1.linkedIn,
      'gitHub1': user1.gitHub
    };
    if(user2 != null){
      dict['username2'] = user2.name;
      dict['password2'] = user2.password;
      dict['email2'] = user2.email;
      dict['linkedIn2'] = user2.linkedIn;
      dict['gitHub2'] = user2.gitHub;
    }
    if(user3 != null){
      dict['username3'] = user3.name;
      dict['password3'] = user3.password;
      dict['email3'] = user3.email;
      dict['linkedIn3'] = user3.linkedIn;
      dict['gitHub3'] = user3.gitHub;
    }
    if(user4 != null){
      dict['username4'] = user4.name;
      dict['password4'] = user4.password;
      dict['email4'] = user4.email;
      dict['linkedIn4'] = user4.linkedIn;
      dict['gitHub4'] = user4.gitHub;
    }
    dict['name'] = name;
    dict['title'] = project.title;
    dict['description'] = project.description;
    dict['gitHubURL'] = project.gitHub;
    return dict;
  }

  // TODO finish this up
  // factory Team.fromJson(Map<String, dynamic> team) =>
  //     Team(_toInt(team['id']), new User(team['usernam1']));

  factory Team.fromJson(Map<String, dynamic> team){
    Team teamz = new Team(0, null, null, null, null, "", null);

    User user1 = new User(0, team['username1'], team['password1'], team['email1'], team['linkedIn1'], team['gitHub1'], "");
    teamz.user1 = user1;

    if(team['username2'] != null){
      User user2 = new User(1, team['username2'], team['password2'], team['email2'], team['linkedIn2'], team['gitHub2'], "");
      teamz.user2 = user2;
    }

    if(team['username3'] != null){
      User user3 = new User(2, team['username3'], team['password3'], team['email3'], team['linkedIn3'], team['gitHub3'], "");
      teamz.user3 = user3;
    }
    if(team['username4'] != null){
      User user4 = new User(3, team['username4'], team['password4'], team['email4'], team['linkedIn4'], team['gitHub4'], "");
      teamz.user4 = user4;
    }
    teamz.name = team['name'];
    teamz.project = new Project(0, team['project_name'], "description", "gitHub", "teamName");

    return teamz;
  }

}
