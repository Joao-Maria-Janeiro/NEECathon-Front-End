import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:neechathon/src/models/team.dart';
import 'package:neechathon/src/models/transaction.dart';
import 'package:neechathon/src/services/team_service.dart';
import 'package:neechathon/src/services/transaction_service.dart';

@Component(
  selector: 'create-transaction',
  directives: [coreDirectives, formDirectives, routerDirectives],
  templateUrl: 'create_transaction_component.html',
)
class CreateTransactionComponent implements OnInit {
  Transaction transaction = new Transaction(0, "", 0, "");
  bool submitted = false;
  bool success = false;
  String out;

  List<Team> teams;
  TeamService _teamService;

  final TransactionService _transactionService;

  CreateTransactionComponent(this._transactionService, this._teamService);

  @override
  Future<void> ngOnInit() async {
    teams = await _teamService.getAllTeams();
  }

  Future<void> onSubmit() async {
    submitted = true;
    out = await _transactionService.create(transaction, window.localStorage['id']);
    if(out == 'ERROR'){
      out = 'No internet connection available';
      success = false;
    }
    if(out == 'Transaction successful'){
      success = true;
    }else{
      success = false;
    }
  }

}
