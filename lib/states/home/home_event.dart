abstract class HomeEvent {
  const HomeEvent();
}

class HomeLoadStarted extends HomeEvent {
  final bool loadAll;

  const HomeLoadStarted({this.loadAll = false});
}

class HomeLoadMoreStarted extends HomeEvent {}
