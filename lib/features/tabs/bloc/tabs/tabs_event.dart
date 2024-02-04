part of 'tabs_bloc.dart';

abstract class TabsEvent extends Equatable {
  const TabsEvent();

  @override
  List<Object> get props => [];
}

class NavigateToTab extends TabsEvent {
  const NavigateToTab(this.tab);

  final Tabs tab;

  @override
  List<Object> get props => [tab];
}

class NavigateToTabRoot extends NavigateToTab {
  const NavigateToTabRoot(super.tab);
}

class NavigateToTabRootOfCurrentTab extends TabsEvent {}

class ResizeToAvoidBottomInset extends TabsEvent {
  const ResizeToAvoidBottomInset({required this.resizeToAvoidBottomInset});

  final bool resizeToAvoidBottomInset;
}
