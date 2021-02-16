import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teste_ewally/shared/models/account/balance_model.dart';
import 'package:teste_ewally/shared/repositories/contracts/account_repository_contract.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  final AccountRepositoryContract _accountRepository;

  BalanceCubit(this._accountRepository) : super(BalanceInitial());

  Future<void> fetchBalance() async {
    try {
      emit(BalanceLoadingState());

      final balance = await this._accountRepository.fetchBalance();

      emit(BalanceSuccessState(balanceModel: balance));
    } catch (e) {
      emit(BalanceErrorState());
    }
  }
}
