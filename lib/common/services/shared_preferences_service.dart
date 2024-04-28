import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc_base/common/common.dart';

class SharedPreferencesService {
  SharedPreferencesService(this.prefs);

  final SharedPreferences prefs;

  Future<bool> clearCredentials() {
    return prefs.remove(SharedPreferenceKeys.credentials.toString());
  }

  String? getAccessToken() {
    // TODO DEVELOPER: Get Access Token IMPL
    return null;
  }

  String? getRefreshToken() {
    // TODO DEVELOPER: Get Refresh Token IMPL

    return null;
  }

  Future<bool> loggedOut() async {
    return clearCredentials();
  }

  bool getIsUserLoggedIn() {
    return false;
  }

  Future<bool> _setString(String key, String value) async {
    return prefs.setString(
      key,
      '#$value',
    );
  }

  String? _getString(String key) {
    final value = prefs.getString(key);

    return value?.substring(1);
  }

  bool? getNeedUpdate() {
    return prefs.getBool(SharedPreferenceKeys.needUpdate.toString());
  }

  bool? getNeedForceUpdate() {
    return prefs.getBool(SharedPreferenceKeys.needForceUpdate.toString());
  }

  String? getUpdateDialogTitle() {
    return prefs.getString(SharedPreferenceKeys.updateTitle.toString());
  }

  String? getUpdateDialogMessage() {
    return prefs.getString(SharedPreferenceKeys.updateMessage.toString());
  }

  Future<void> setUpdateApplicationDetails({
    required bool needUpdate,
    required bool needForceUpdate,
    required String title,
    required String message,
  }) async {
    await prefs.setBool(SharedPreferenceKeys.needUpdate.toString(), needUpdate);
    await prefs.setBool(
      SharedPreferenceKeys.needForceUpdate.toString(),
      needForceUpdate,
    );
    await prefs.setString(SharedPreferenceKeys.updateTitle.toString(), title);
    await prefs.setString(
      SharedPreferenceKeys.updateMessage.toString(),
      message,
    );
  }

  DateTime? getCreateAccountTimeframe() {
    final timeframeString =
        prefs.getString(SharedPreferenceKeys.createAccountTimeframe.toString());
    return timeframeString == null
        ? DateTime.now()
        : DateTime.parse(timeframeString);
  }

  Future<void> setCreateAccountTimeframe({required DateTime timeframe}) async {
    await prefs.setString(
      SharedPreferenceKeys.createAccountTimeframe.toString(),
      timeframe.toString(),
    );
  }

  String? _getReviewDialogVersion() {
    final reviewDialogVersion = prefs.getString(
      SharedPreferenceKeys.reviewDialogShownVersion.toString(),
    );

    return reviewDialogVersion;
  }

  Future<void> setReviewDialogVersion() async {
    final info = await PackageInfo.fromPlatform();
    final localAppVersionName = info.version;
    await prefs.setString(
      SharedPreferenceKeys.reviewDialogShownVersion.toString(),
      localAppVersionName,
    );
  }

  Future<bool> shouldShowReviewDialog() async {
    final info = await PackageInfo.fromPlatform();
    final localAppVersionName = info.version;
    final reviewVersion = _getReviewDialogVersion();

    return !(reviewVersion!.isVersionGreaterThan(localAppVersionName) ||
        reviewVersion == localAppVersionName);
  }

  DateTime? getEnrolWithAutoshipDate() {
    final enrolWithErAutoshipDate =
        prefs.getString(SharedPreferenceKeys.enrolWithAutoshipDate.toString());

    return enrolWithErAutoshipDate == null
        ? null
        : DateTime.parse(enrolWithErAutoshipDate);
  }

  Future<void> setEnrolWithAutoshipDate({
    required DateTime enrolWithErAutoshipDate,
  }) async {
    await prefs.setString(
      SharedPreferenceKeys.enrolWithAutoshipDate.toString(),
      enrolWithErAutoshipDate.toString(),
    );
  }
}
