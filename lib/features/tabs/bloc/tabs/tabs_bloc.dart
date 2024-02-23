import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesplit/common/core/core.dart';
// import 'package:young_living/common/common.dart';

part 'tabs_event.dart';
part 'tabs_state.dart';

class TabsBloc extends Bloc<TabsEvent, TabsState> {
  TabsBloc() : super(const TabsState()) {
    on<NavigateToTab>((event, emit) {
      emit(_mapNavigateToTabEventToState(event));
    });

    on<NavigateToTabRoot>((event, emit) {
      emit(_mapNavigateToTabRootEventToState(event));
    });

    on<NavigateToTabRootOfCurrentTab>((event, emit) {
      emit(_mapNavigateToTabRootOfCurrentTab(event));
    });

    on<ResizeToAvoidBottomInset>((event, emit) {
      emit(_mapResizeToAvoidBottomInsetToState(event));
    });
  }

  TabsState _mapNavigateToTabEventToState(NavigateToTab event) {
    // ARTISAN Andy: Pop to root page if the current tab is the
    // tab we are switching to, i.e.
    //
    // Navigation stack:
    // Tab 0:
    // 1. Page 1
    // 2. Page 2 <--- If we navigate to Tab 0 from here,
    //                pop the stack until page 1.
    // Tab 1:
    // 1. Page 1
    // 2. ...
    return state.copyWith(
      currentTab: event.tab,
      shouldPopToRoot: state.currentTab == event.tab,
    );
  }

  TabsState _mapNavigateToTabRootEventToState(NavigateToTabRoot event) {
    return state.copyWith(currentTab: event.tab, shouldPopToRoot: true);
  }

  TabsState _mapNavigateToTabRootOfCurrentTab(
    NavigateToTabRootOfCurrentTab event,
  ) {
    return state.copyWith(currentTab: state.currentTab, shouldPopToRoot: true);
  }

  TabsState _mapResizeToAvoidBottomInsetToState(
    ResizeToAvoidBottomInset event,
  ) {
    return state.copyWith(
      resizeToAvoidBottomInset: event.resizeToAvoidBottomInset,
      shouldPopToRoot: false,
    );
  }
}
