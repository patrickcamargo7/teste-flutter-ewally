import 'package:dio/dio.dart';
import 'package:teste_ewally/shared/models/auth/authorization_model.dart';
import 'package:teste_ewally/shared/models/auth/auth_data_model.dart';
import 'package:teste_ewally/shared/repositories/contracts/auth_repository_contract.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repository.g.dart';

@RestApi()
abstract class AuthRepository implements AuthRepositoryContract {
  factory AuthRepository(Dio dio, {String baseUrl}) = _AuthRepository;

  @POST('/user/login')
  Future<AuthorizationModel> authenticate(@Body() AuthDataModel authDataModel);
}
