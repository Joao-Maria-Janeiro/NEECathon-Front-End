import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart';
import '../models/user.dart';
import '../services/user_service.dart';

@Component(
  selector: 'create-user',
  directives: [coreDirectives, formDirectives, routerDirectives],
  templateUrl: 'create_user_component.html',
)
class CreateUserComponent {
  User model =  User(1, "", "", "", "", "", "");
  bool submitted = false;
  String out;
  bool success = false;

  final UserService _userService;

  CreateUserComponent(this._userService);



  Map<String, bool> setCssValidityClass(NgControl control) {
    final validityClass = control.valid == true ? 'is-valid' : 'is-invalid';
    return {validityClass: true};
  }

  //void onSubmit() => submitted = true;
  Future<void> onSubmit() async {
    submitted = true;
    out = await _userService.create(model);
    if(out != 'ERROR'){
      success = true;
    }
  }

}
