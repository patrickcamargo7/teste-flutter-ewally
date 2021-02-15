import 'package:teste_ewally/shared/models/account/balance_model.dart';

abstract class AccountRepositoryContract {
  Future<BalanceModel> fetchBalance();
}
