import 'package:angular_router/angular_router.dart';
import 'package:neechathon/src/route_paths.dart';
import 'create_user/create_user_component.template.dart' as create_user_template;
import 'create_team/create_team_component.template.dart' as create_team_template;
import 'login/login_component.template.dart' as login_template;
import 'create_transaction/create_transaction_component.template.dart' as create_transaction_template;
import 'teams/get_teams_component.template.dart' as teams_template;
import 'team_details/team_details_component.template.dart' as team_template;

class Routes {
  static final create_user = RouteDefinition(
    routePath: RoutePaths.create_user,
    component: create_user_template.CreateUserComponentNgFactory,
  );
  static final create_team = RouteDefinition(
    routePath: RoutePaths.create_team,
    component: create_team_template.CreateTeamComponentNgFactory,
  );
  static final login = RouteDefinition(
    routePath: RoutePaths.login,
    component: login_template.LoginComponentNgFactory,
  );
  static final create_transaction =  RouteDefinition(
    routePath: RoutePaths.create_transaction,
    component: create_transaction_template.CreateTransactionComponentNgFactory,
  );
  static final get_all_teams = RouteDefinition(
    routePath: RoutePaths.teams,
    component: teams_template.GetTeamsComponentNgFactory,
  );
  static final team_details = RouteDefinition (
    routePath: RoutePaths.team_details,
    component: team_template.TeamDetailsComponentNgFactory,
  );
  static final all = <RouteDefinition>[
    create_team,
    create_user,
    login,
    create_transaction,
    get_all_teams,
    team_details,
  ];
}
