import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/repositories/user_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static const int contactsPerPage = 20;

  final UserRepository _userRepository;

  HomeBloc(this._userRepository) : super(HomeState.initial()) {
    on<HomeLoadStarted>(_onLoadStarted);
    // on<HomeLoadMoreStarted>(_onLoadMoreStarted);
    on<HomeSelectChanged>(_onSelectChanged);
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

  // void _onLoadMoreStarted(
  //     HomeLoadMoreStarted event, Emitter<HomeState> emit) async {
  //   try {
  //     emit(state.asLoadingMore());
  //
  //     final contacts = await _userRepository.getContact(
  //       page: state.page + 1,
  //       limit: contactsPerPage,
  //     );
  //
  //     final canLoadMore = contacts.length >= contactsPerPage;
  //
  //     emit(state.asLoadMoreSuccess(contacts, canLoadMore: canLoadMore));
  //   } on Exception catch (e) {
  //     emit(state.asLoadMoreFailure(e));
  //   }
  // }

  void _onSelectChanged(
      HomeSelectChanged event, Emitter<HomeState> emit) async {
    final contactIndex = state.contacts
        .indexWhere((contact) => contact.id == event.id);

    print(event.id);
    print(state.contacts[0].id);
    print(contactIndex);

    if (contactIndex < 0 || contactIndex >= state.contacts.length) return;

    emit(state.copyWith(selectedIndex: contactIndex));
  }
}
