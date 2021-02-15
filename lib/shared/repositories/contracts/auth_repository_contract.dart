import 'package:teste_ewally/shared/models/auth/auth_data_model.dart';
import 'package:teste_ewally/shared/models/auth/authorization_model.dart';

abstract class AuthRepositoryContract {
  Future<AuthorizationModel> authenticate(AuthDataModel authDataModel);
}
