enum Tabs {
  home(isAccessibleIfNotAuthenticated: true),
  profile(isAccessibleIfNotAuthenticated: false),
  favourite(isAccessibleIfNotAuthenticated: true),
  cart(isAccessibleIfNotAuthenticated: false);

  const Tabs({
    required this.isAccessibleIfNotAuthenticated,
  });

  final bool isAccessibleIfNotAuthenticated;
}

/// Shared Preferences Key
enum SharedPreferenceKeys {
  credentials,
  searchHistory,
  favourites,
  myCart,
  autoshipRequirementsLastUpdated,
  needUpdate,
  needForceUpdate,
  updateTitle,
  updateMessage,
  createAccountTimeframe,
  reviewDialogShownVersion,
  enrolWithAutoshipDate,
  creditCardFormDataLastUpdated,
  graphQlAccessToken;

  const SharedPreferenceKeys();
}
