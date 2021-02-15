import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:teste_ewally/shared/models/account/balance_model.dart';
import 'package:teste_ewally/shared/repositories/contracts/account_repository_contract.dart';

part 'account_repository.g.dart';

@RestApi()
abstract class AccountRepository implements AccountRepositoryContract {
  factory AccountRepository(Dio dio, {String baseUrl}) = _AccountRepository;

  @GET('/account/balance')
  Future<BalanceModel> fetchBalance();
}
