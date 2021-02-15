import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teste_ewally/shared/repositories/contracts/account_repository_contract.dart';
import 'package:teste_ewally/shared/repositories/contracts/b2b_repository_contract.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final B2bRepositoryContract _b2bRepository;
  final AccountRepositoryContract _accountRepository;

  HomeScreenCubit(this._b2bRepository, this._accountRepository)
      : super(HomeScreenInitial());
}
