part of 'statement_cubit.dart';

abstract class StatementState extends Equatable {
  const StatementState();

  @override
  List<Object> get props => [];
}

class StatementInitial extends StatementState {}

class StatementLoadingState extends StatementState {}

class StatementSuccessState extends StatementState {
  final DateTime initialDate;
  final DateTime finalDate;

  final BaseStatementModel baseStatementModel;

  StatementSuccessState({
    this.baseStatementModel,
    this.initialDate,
    this.finalDate,
  });
}

class StatementErrorState extends StatementState {}
