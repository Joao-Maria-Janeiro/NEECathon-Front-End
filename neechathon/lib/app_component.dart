import 'package:angular/angular.dart';
import 'package:neechathon/src/create_team/create_team_component.dart';
import 'package:neechathon/src/create_transaction/create_transaction_component.dart';
import 'package:neechathon/src/services/login_service.dart';
import 'package:neechathon/src/route_paths.dart';
import 'package:neechathon/src/routes.dart';
import 'package:neechathon/src/services/team_service.dart';
import 'package:neechathon/src/services/transaction_service.dart';
import 'package:neechathon/src/services/user_service.dart';
import 'package:angular_router/angular_router.dart';
import 'package:neechathon/src/teams/get_teams_component.dart';


@Component(
  selector: 'app-component',
  templateUrl: 'app_component.html',
  providers: [ClassProvider(UserService), ClassProvider(TeamService), ClassProvider(LoginService), ClassProvider(TransactionService), ClassProvider(GetTeamsComponent)],
  exports: [RoutePaths, Routes],
  directives: [routerDirectives, CreateTeamComponent, CreateTransactionComponent],
)
class AppComponent {
  final title = 'Hello';
}
