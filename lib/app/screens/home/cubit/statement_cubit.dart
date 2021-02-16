import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste_ewally/shared/constants/app.dart';
import 'package:teste_ewally/shared/models/b2b/base_statement_model.dart';
import 'package:teste_ewally/shared/repositories/contracts/b2b_repository_contract.dart';

part 'statement_state.dart';

class StatementCubit extends Cubit<StatementState> {
  final B2bRepositoryContract _b2bRepository;

  StatementCubit(this._b2bRepository) : super(StatementInitial());

  Future<void> filterStatement({
    @required DateTime initialDate,
    @required DateTime finalDate,
  }) async {
    try {
      emit(StatementLoadingState());

      final baseStatement = await this._b2bRepository.fetchStatement(
            DateFormat(apiDateFormat).format(initialDate),
            DateFormat(apiDateFormat).format(finalDate),
          );

      emit(StatementSuccessState(
        baseStatementModel: baseStatement,
        initialDate: initialDate,
        finalDate: finalDate,
      ));
    } catch (e) {
      emit(StatementErrorState());
    }
  }
}
