import 'package:teste_ewally/shared/models/b2b/base_statement_model.dart';

abstract class B2bRepositoryContract {
  Future<BaseStatementModel> fetchStatement(
    String initialDate,
    String finalDate,
  );
}
