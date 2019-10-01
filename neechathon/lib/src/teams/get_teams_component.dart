import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:neechathon/src/models/team.dart';
import 'package:neechathon/src/services/team_service.dart';
import 'package:neechathon/src/team_details/team_details_component.dart';
import '../route_paths.dart';



@Component(
  selector: 'get-teams',
  directives: [coreDirectives, formDirectives, routerDirectives, TeamDetailsComponent],
  templateUrl: 'get_teams_component.html',
)
class GetTeamsComponent implements OnInit {
  List<Team> teams;
  TeamService _teamService;
  GetTeamsComponent(this._teamService);


  @override
  Future<void> ngOnInit() async {
    teams = await _teamService.getAllTeams();
  }

  String teamUrl(String name) => RoutePaths.team_details.toUrl(parameters: {nameParam: '$name'});

}
