abstract class HomeEvent {
  const HomeEvent();
}

class HomeLoadStarted extends HomeEvent {
  final bool loadAll;

  const HomeLoadStarted({this.loadAll = false});
}

class HomeLoadMoreStarted extends HomeEvent {}

class HomeSelectChanged extends HomeEvent {
  final String id;

  const HomeSelectChanged({required this.id});
}
