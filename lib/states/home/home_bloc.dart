import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razertest/data/repositories/user_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static const int contactsPerPage = 20;

  final UserRepository _userRepository;

  HomeBloc(this._userRepository) : super(HomeState.initial()) {
    on<HomeLoadStarted>(_onLoadStarted);
  }

  void _onLoadStarted(
      HomeLoadStarted event, Emitter<HomeState> emit) async {
    try {
      emit(state.asLoading());

      final contacts = await _userRepository.getAllContacts();

      final canLoadMore = contacts.length >= contactsPerPage;

      emit(state.asLoadSuccess(contacts, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
