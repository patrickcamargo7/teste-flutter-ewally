import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:teste_ewally/shared/models/b2b/base_statement_model.dart';
import 'package:teste_ewally/shared/repositories/contracts/b2b_repository_contract.dart';

part 'b2b_repository.g.dart';

@RestApi()
abstract class B2bRepository implements B2bRepositoryContract {
  factory B2bRepository(Dio dio, {String baseUrl}) = _B2bRepository;

  @GET('/b2b/statement')
  Future<BaseStatementModel> fetchStatement(
    @Query("initialDate") String initialDate,
    @Query("finalDate") String finalDate,
  );
}
