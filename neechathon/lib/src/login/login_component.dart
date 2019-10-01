import 'dart:convert';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart';
import '../services/login_service.dart';
import '../models/user.dart';

@Component(
  selector: 'login',
  directives: [coreDirectives, formDirectives, routerDirectives],
  templateUrl: 'login_component.html',
)
class LoginComponent {
  User user =  User(1, "", "", "", "", "", "");
  bool submitted = false;
  String out;
  bool valid = false;

  final LoginService _loginService;

  LoginComponent(this._loginService);


  Map<String, bool> setCssValidityClass(NgControl control) {
    final validityClass = control.valid == true ? 'is-valid' : 'is-invalid';
    return {validityClass: true};
  }

  Future<void> onSubmit() async {
    submitted = true;
    out = await _loginService.create(user);
    if (out == 'Login successful'){
      valid = true;
      String token = await _loginService.getToken(user.email);
      if(token != 'ERROR')
        window.localStorage['id'] = token;
    }else
      valid = false;
  }

}
