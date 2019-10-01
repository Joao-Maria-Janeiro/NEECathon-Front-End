import 'package:angular_router/angular_router.dart';

const nameParam = 'name';

class RoutePaths {
  static final create_user = RoutePath(path: 'user/create');
  static final create_team = RoutePath(path: 'team/create');
  static final login = RoutePath(path: 'user/login');
  static final create_transaction = RoutePath(path: 'transaction/create');
  static final teams = RoutePath(path: 'teams/');
  static final team_details = RoutePath(path: '${teams.path}/:$nameParam');
}

String getName(Map<String, String> parameters) {
  final name = parameters[nameParam];
  return name == null ? null : name;
}
