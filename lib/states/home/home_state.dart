import 'package:razertest/data/source/github/models/contact_response.dart';

enum HomeStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

class HomeState {
  final HomeStateStatus status;
  final List<ContactResponse> contacts;
  final int selectedIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  const HomeState._({
    this.status = HomeStateStatus.initial,
    this.contacts = const [],
    this.selectedIndex = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const HomeState.initial() : this._();

  HomeState asLoading() {
    return copyWith(
      status: HomeStateStatus.loading,
    );
  }

  HomeState asLoadSuccess(List<ContactResponse> contacts,
      {bool canLoadMore = true}) {
    return copyWith(
      status: HomeStateStatus.loadSuccess,
      contacts: contacts,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  HomeState asLoadFailure(Exception e) {
    return copyWith(
      status: HomeStateStatus.loadFailure,
      error: e,
    );
  }

  HomeState copyWith({
    HomeStateStatus? status,
    List<ContactResponse>? contacts,
    int? selectedIndex,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return HomeState._(
      status: status ?? this.status,
      contacts: contacts ?? this.contacts,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
