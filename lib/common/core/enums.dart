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
