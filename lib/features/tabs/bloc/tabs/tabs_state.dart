part of 'tabs_bloc.dart';

class TabsState {
  const TabsState({
    this.currentTab = Tabs.home,
    this.shouldPopToRoot = false,
    this.resizeToAvoidBottomInset = true,
  });

  final Tabs currentTab;
  final bool shouldPopToRoot;
  final bool resizeToAvoidBottomInset;

  TabsState copyWith({
    Tabs? currentTab,
    bool? shouldPopToRoot,
    bool? resizeToAvoidBottomInset,
  }) {
    return TabsState(
      currentTab: currentTab ?? this.currentTab,
      shouldPopToRoot: shouldPopToRoot ?? this.shouldPopToRoot,
      resizeToAvoidBottomInset:
          resizeToAvoidBottomInset ?? this.resizeToAvoidBottomInset,
    );
  }
}
