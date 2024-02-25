import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_base/common/common.dart';
import 'package:flutter_bloc_base/features/home/home.dart';
import 'package:flutter_bloc_base/features/user/user.dart';
import 'package:flutter_bloc_base/features/tabs/tabs.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => TabsBloc(),
      ),
    ], child: const TabsView());
  }
}

class TabsView extends StatefulWidget {
  static final tabPages = [
    TabPageModel(
      key: GlobalKey<NavigatorState>(),
      page: const HomePage(),
    ),
    TabPageModel(
      key: GlobalKey<NavigatorState>(),
      page: const ProfilePage(),
    ),
  ];
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsBloc, TabsState>(builder: (context, state) {
      return AppScaffold(
        body: _buildMainBody(state.currentTab.index),
      );
    });
  }

  Widget _buildMainBody(int currentTabIndex) {
    return IndexedStack(
      index: currentTabIndex,
      children: TabsView.tabPages.map((tabPage) {
        return Navigator(
          key: tabPage.key,
          onGenerateRoute: (settings) {
            return MaterialPageRoute<void>(
              builder: (_) {
                return tabPage.page;
              },
              settings: settings,
            );
          },
        );
      }).toList(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:flutter_bloc_base/features/tabs/models/ui/ui.dart';
// import 'package:flutter_bloc_base/features/tabs/tabs.dart';

// class TabsPage extends StatefulWidget {
//   const TabsPage({Key? key}) : super(key: key);

//   @override
//   State<TabsPage> createState() => _TabsPageState();
// }

// class _TabsPageState extends State<TabsPage> {
//   @override
//   Widget build(BuildContext context) {
//     JsonWidgetRegistry.instance.registerFunction(
//         'getMediaQueryHeightWithFactor', ({args, required registry}) {
//       final factorString = args?[0] as String? ?? '';
//       final factor = double.tryParse(factorString) ?? 0.0;
//       final returnResult = MediaQuery.of(context).size.height * factor;
//       return returnResult;
//     });

//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           lazy: false,
//           create: (_) {
//             final bloc = TabsBloc();

//             // AGMO loongyeat: Inject TabsBloc to enable SDUI-related
//             // navigation without context (with the right Navigator).
//             GetIt.instance.registerSingletonAsync(() async {
//               return bloc;
//             });

//             return bloc;
//           },
//         ),
//       ],
//       child: const TabsView(),
//     );
//   }
// }

// class TabsView extends StatefulWidget {
//   const TabsView({Key? key}) : super(key: key);

//   static final tabPages = [
//     TabPageModel(
//       key: GlobalKey<NavigatorState>(),
//       page: const ShoppingPage(),
//     ),
//     TabPageModel(
//       key: GlobalKey<NavigatorState>(),
//       page: const ProfilePage(),
//     ),
//   ];

//   @override
//   State<TabsView> createState() => _TabsViewState();
// }

// class _TabsViewState extends State<TabsView> {
//   int _loadingCount = 0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocListener(
//       listeners: [
//         BlocListener<TabsBloc, TabsState>(listener: _tabsBlocListener),
//       ],
//       child: BlocBuilder<TabsBloc, TabsState>(
//         builder: (context, state) {
//           final currentTabIndex = state.currentTab.index;
//           final currentTabPage = TabsView.tabPages[currentTabIndex];

//           return Scaffold(
//             resizeToAvoidBottomInset: state.resizeToAvoidBottomInset,
//             bottomNavigationBar: _buildBottomNavigationBar(context),
//             body: PopScope(
//               onPopInvoked: (pop) async {
//                 if (currentTabPage.key.currentState?.canPop() ?? false) {
//                   await currentTabPage.key.currentState!.maybePop();
//                 }
//               },
//               child: _buildMainBody(currentTabIndex),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildBottomNavigationBar(BuildContext context) {
//     return Material(
//       elevation: 8,
//       child: BlocBuilder<ShowHideTabBloc, ShowHideTabState>(
//         builder: (context, state) {
//           return ExpandedSection(
//             expand: state.showTab,
//             child: BlocBuilder<TabsBloc, TabsState>(
//               builder: (context, state) {
//                 return BottomNavigationBar(
//                   currentIndex: state.currentTab.index,
//                   type: BottomNavigationBarType.fixed,
//                   selectedItemColor: AppColors.color736e6e,
//                   unselectedItemColor: AppColors.color736e6e,
//                   backgroundColor: AppColors.colorf9f4ed,
//                   items: [
//                     BottomNavigationBarItem(
//                       icon: _TabPageImage(Assets.homeTabIcon.path),
//                       label: context.l10n.home,
//                     ),
//                     BottomNavigationBarItem(
//                       icon: _TabPageImage(
//                         Assets.profileTabIcon.path,
//                         color: AppColors.color736e6e,
//                       ),
//                       label: context.l10n.profile,
//                     ),
//                     BottomNavigationBarItem(
//                       icon: _TabPageImage(
//                         Assets.favouriteTabIcon.path,
//                         color: AppColors.color736e6e,
//                       ),
//                       label: context.l10n.favourite,
//                     ),
//                     BottomNavigationBarItem(
//                       icon: RubberBand(
//                         key: _shakeKey,
//                         child: BlocBuilder<MyCartBloc, MyCartState>(
//                           builder: (context, state) {
//                             final isAuthenticated = context
//                                 .watch<AuthenticationBloc>()
//                                 .state
//                                 .isAuthenticated;
//                             final badgeCount = isAuthenticated
//                                 ? (state.newItems ?? []).length
//                                 : 0;

//                             return AppBadge(
//                               badgeCount: badgeCount,
//                               backgroundColor: AppColors.color736e6e,
//                               child: _TabPageImage(
//                                 Assets.myCartTabIcon.path,
//                                 color: AppColors.color736e6e,
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       label: context.l10n.myCart,
//                     ),
//                   ],
//                   onTap: (index) => _onTabSelected(context, index),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }



//   void _onTabSelected(BuildContext context, int index) {
//     final tab = Tabs.values[index];

//     final currentTab = context.read<TabsBloc>().state.currentTab;
//     if (!isAuthenticated && !tab.isAccessibleIfNotAuthenticated) {
//       final currentTabContext =
//           TabsView.tabPages[currentTab.index].key.currentContext;
//       GeneralHelper.showLoginOrSignUpDialog(currentTabContext ?? context);
//       return;
//     }

//     if (currentTab != tab &&
//         tab != Tabs.cart &&
//         !context.read<AutoshipBloc>().state.isCurrentAutoshipSameAsSaved) {
//       GeneralHelper.showSaveERAutoshipDialog(context);
//     }
//     context.read<TabsBloc>().add(NavigateToTab(Tabs.values[index]));
//     Smartlook.instance.trackNavigationExit(currentTab.name);
//     AnalyticsHelper.logScreen(tab.name);
//     Smartlook.instance.trackNavigationEnter(tab.name);
//   }

//   void _tabsBlocListener(BuildContext context, TabsState state) {
//     if (!state.shouldPopToRoot) {
//       return;
//     }

//     TabsView.tabPages[state.currentTab.index].key.currentState
//         ?.popUntil((route) => route.isFirst);
//   }

//   void _authenticationBlocListener(
//     BuildContext context,
//     AuthenticationState state,
//   ) {
//     // AGMO loongyeat: Add any Blocs that require
//     // refreshing on authentication state changes
//     // here.
//     if (isAuthenticated) {
//       context.read<ProfileBloc>().add(FetchProfileEvent());
//       context
//           .read<MyCartBloc>()
//           .add(const FetchCartItemsEvent(didReAuthenticate: true));
//       context
//           .read<AutoshipBloc>()
//           .add(const FetchAutoshipEvent(shouldShowError: false));
//       context
//           .read<AutoshipRequirementBloc>()
//           .add(FetchAutoshipRequirementEvent());
//       context.read<MyAddressesBloc>().add(FetchMyAddressesEvent());
//     }

//     context
//         .read<FavouritesBloc>()
//         .add(const FetchFavouritesEvent(didReAuthenticate: true));
//     context.read<EnrolmentSessionBloc>().add(EndEnrolmentSessionEvent());
//   }

//   void _myCartBlocListener(BuildContext context, MyCartState state) {
//     if (state is MyCartLoading) {
//       _showLoading();
//       return;
//     } else if (state is! MyCartFailed) {
//       context.read<PromotionBloc>().add(
//             FetchCartPromotionsEvent(
//               cartItemList: context.read<MyCartBloc>().state.newItems,
//             ),
//           );
//     }

//     _dismissLoading();

//     if (state is MyCartAdded) {
//       _onMyCartAdded(context, state);
//       return;
//     }
//     if (state is MyCartEdited) {
//       _onMyCartEdited(context, state);
//       return;
//     }

//     if (state is MyCartFailed) {
//       _onMyCartFailed(context, state);
//       return;
//     }
//   }

//   void _addMoreItemListener(BuildContext context, AddMoreItemState state) {
//     if (state is AddMoreItemLoading) {
//       _showLoading();
//       return;
//     } else if (state is! AddMoreItemFailed) {
//       final selectedProducts =
//           context.tryRead<ChooseYourStarterKitBloc>()?.state.selectedProducts;
//       final selectedProductsList = selectedProducts != null
//           ? [selectedProducts, ...?state.addMoreItemList]
//           : null;
//       context.read<PromotionBloc>().add(
//             FetchEnrolmentItemPromotionsEvent(
//               enrolmentItemList: selectedProductsList,
//               isAutoship: state.isAutoship,
//               starterKitPV: selectedProducts?.pointValue,
//             ),
//           );
//     }

//     _dismissLoading();

//     if (state is AddMoreItemFailed) {
//       GeneralHelper.showErrorDialog(context, error: state.errorDescription);
//       return;
//     }

//     if (state is ItemAdded) {
//       GeneralHelper.showAddedToCheckout(context);
//       return;
//     }
//   }

//   void _autoshipBlocListener(BuildContext context, AutoshipState state) {
//     if (state is AutoshipLoading) {
//       _showLoading();
//       return;
//     } else if (state is! AutoshipFailed) {
//       context.read<PromotionBloc>().add(
//             FetchAutoshipPromotionsEvent(
//               autoshipItemList:
//                   context.read<AutoshipBloc>().state.currentAutoship?.items,
//               enrolmentFlow: context
//                   .read<EnrolmentSessionBloc>()
//                   .state
//                   .isEnrolmentInProgress,
//             ),
//           );
//     }

//     _dismissLoading();

//     if (state is AutoshipAdded) {
//       _onAutoshipAdded(context, state);
//       return;
//     }

//     if (state is AutoshipFailed) {
//       _onAutoshipFailed(context, state);
//       return;
//     }

//     if (state is AutoshipSaved) {
//       _onAutoshipSaved(context, state);
//       return;
//     }
//   }

//   void _onAutoshipAdded(BuildContext context, AutoshipAdded state) {
//     if (!state.shouldShowToast) {
//       return;
//     }

//     GeneralHelper.showAddedToAutoship(context);
//   }

//   void _onAutoshipFailed(BuildContext context, AutoshipFailed state) {
//     if (!state.shouldShowError) {
//       return;
//     }

//     final errors = state.validationErrors?.totalPV;

//     switch (state.failureReason) {
//       case AutoshipFailureReasons.unauthenticated:
//         final currentTab = context.read<TabsBloc>().state.currentTab;
//         final currentTabContext =
//             TabsView.tabPages[currentTab.index].key.currentContext;
//         GeneralHelper.showLoginOrSignUpDialog(currentTabContext ?? context);
//         break;
//       case AutoshipFailureReasons.validationOrInternalError:
//         GeneralHelper.showErrorDialog(
//           context,
//           error: errors != null
//               ? errors.join('\n')
//               : context.l10n.autoshipGenericError,
//         );
//         break;
//       case AutoshipFailureReasons.didNotExceedMinimumPv:
//         final minimumPv = state.minimumPv;
//         showDialog<void>(
//           context: context,
//           builder: (dialogContext) {
//             return AppDialog(
//               title: context.l10n.uhOh,
//               child: Text(
//                 minimumPv != null
//                     ? context.l10n.yourAutoshipMustBeMinimumPvOrGreater(
//                         minimumPv.toStringAsFixed(0),
//                       )
//                     : '',
//               ),
//             );
//           },
//         );
//         break;
//       case AutoshipFailureReasons.itemNotAvailable:
//         final unavailableItems = state.unavailableItems ?? [];
//         final unavailableItemNames = unavailableItems
//             .mapNotNull((e) => e.name != null ? ' - ${e.name}' : null);

//         if (unavailableItemNames.length == 1) {
//           GeneralHelper.showItemUnavailableToast(context);
//           return;
//         }

//         GeneralHelper.showErrorDialog(
//           context,
//           error: unavailableItemNames.length == 1
//               ? context.l10n.itemUnavailable
//               : context.l10n.cannotSaveAutoshipDueToUnavailableItemsValidation(
//                   unavailableItemNames.join('\n'),
//                 ),
//         );
//         break;
//       case AutoshipFailureReasons.notEnrolled:
//         final currentTab = context.read<TabsBloc>().state.currentTab;
//         final currentTabContext =
//             TabsView.tabPages[currentTab.index].key.currentContext;
//         widget.performEnrolmentCheck(currentTabContext ?? context);
//         break;
//     }
//   }

//   void _onAutoshipSaved(BuildContext context, AutoshipSaved state) {
//     final isAutoshipSavedDuringEnrolment =
//         state.saveType == AutoshipSaveType.autoshipWithEnrolmentSaved &&
//             !context.read<EnrolmentSessionBloc>().state.isEnrolmentInProgress;

//     if (state.saveType == AutoshipSaveType.processingDateSaved ||
//         isAutoshipSavedDuringEnrolment ||
//         state.saveType == AutoshipSaveType.autoshipSavedAfterAgreement) {
//       return;
//     }

//     final currentTab = context.read<TabsBloc>().state.currentTab;
//     final currentTabContext =
//         TabsView.tabPages[currentTab.index].key.currentContext;

//     GeneralHelper.hideBottomNavbar();
//     Navigator.of(currentTabContext ?? context).push<void>(
//       MaterialPageRoute(
//         builder: (context) {
//           return SuccessfulPage(
//             type: state.hasPayment
//                 ? SuccessfulType.autoshipUpdated
//                 : SuccessfulType.autoshipUpdatedWithoutPayment,
//           );
//         },
//       ),
//     ).then((_) => GeneralHelper.showBottomNavbar());
//   }

//   void _onMyCartAdded(BuildContext context, MyCartAdded state) {
//     GeneralHelper.showAddedToCart(context);
//     _shakeKey.currentState?.forward();
//   }

//   void _onMyCartEdited(BuildContext context, MyCartEdited state) {
//     if (!state.shouldShowToastOnIncreasedQuantity) {
//       return;
//     }

//     final editedIndex = state.editedIndex;

//     if (editedIndex == null) {
//       return;
//     }

//     final oldQuantity = state.oldItems?[editedIndex].quantity;
//     final newQuantity = state.newItems?[editedIndex].quantity;

//     if (oldQuantity == null || newQuantity == null) {
//       return;
//     }

//     if (newQuantity > oldQuantity) {
//       _shakeKey.currentState?.forward();
//       GeneralHelper.showAddedToCart(context);
//     }
//   }

//   void _onMyCartFailed(BuildContext context, MyCartFailed state) {
//     switch (state.error) {
//       case MyCartEditingErrors.itemNotAvailable:
//         GeneralHelper.showItemUnavailableToast(context);
//         break;
//       case MyCartEditingErrors.indexError:
//       case MyCartEditingErrors.invalidData:
//         GeneralHelper.showErrorDialog(context);
//         break;
//       case MyCartEditingErrors.unauthenticated:
//         final currentTab = context.read<TabsBloc>().state.currentTab;
//         final currentTabContext =
//             TabsView.tabPages[currentTab.index].key.currentContext;
//         GeneralHelper.showLoginOrSignUpDialog(currentTabContext ?? context);
//         break;
//       case MyCartEditingErrors.notEnrolled:
//         final currentTab = context.read<TabsBloc>().state.currentTab;
//         final currentTabContext =
//             TabsView.tabPages[currentTab.index].key.currentContext;
//         widget.performEnrolmentCheck(currentTabContext ?? context);
//         break;
//     }
//   }

//   void _profileBlocListener(BuildContext context, ProfileState state) {
//     if (state is ProfileLoading) {
//       _showLoading();
//       return;
//     }

//     _dismissLoading();

//     if (state is ProfileFetched) {
//       _onProfileFetched(context, state);
//       return;
//     }
//   }

//   void _deactivateUserListener(
//       BuildContext context, DeactivateUserState state) {
//     if (state is DeactivateUserLoading) {
//       EasyLoading.show();
//       _showLoading();
//       return;
//     }

//     EasyLoading.dismiss();

//     if (state is DeactivateUserSuccess) {
//       GeneralHelper.showErrorDialog(
//         context,
//         error:
//             context.l10n.yourAccountHasBeenDeletedPleaseContactCustomerSupport,
//       );
//       return;
//     }
//   }

//   void _onProfileFetched(BuildContext context, ProfileFetched state) {
//     AnalyticsHelper.logInSetUserProperties(state.profile.memberId.toString());
//     if (context.read<EnrolmentSessionBloc>().state.isEnrolmentInProgress) {
//       return;
//     }

//     final currentTab = context.read<TabsBloc>().state.currentTab;
//     final currentTabContext =
//         TabsView.tabPages[currentTab.index].key.currentContext;

//     widget.performEnrolmentCheck(currentTabContext ?? context);
//   }

//   void _favouritesBlocListener(BuildContext context, FavouritesState state) {
//     if (state is FavouritesLoading) {
//       _showLoading();
//       return;
//     }

//     _dismissLoading();
//   }

//   void _showLoading() {
//     _loadingCount++;
//     EasyLoading.show();
//   }

//   // Dismisses the loading indicator if and only if there is only
//   // one future remaining.
//   void _dismissLoading() {
//     if (_loadingCount > 0) _loadingCount--;
//     if (_loadingCount == 0) EasyLoading.dismiss();
//   }
// }

// class _TabPageImage extends StatelessWidget {
//   const _TabPageImage(
//     this.assetPath, {
//     Key? key,
//     this.color,
//   }) : super(key: key);

//   final String assetPath;
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Image.asset(assetPath, color: color),
//     );
//   }
// }
