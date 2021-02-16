part of 'balance_cubit.dart';

abstract class BalanceState extends Equatable {
  const BalanceState();

  @override
  List<Object> get props => [];
}

class BalanceInitial extends BalanceState {}

class BalanceLoadingState extends BalanceState {}

class BalanceSuccessState extends BalanceState {
  final BalanceModel balanceModel;

  BalanceSuccessState({
    this.balanceModel,
  });
}

class BalanceErrorState extends BalanceState {}
