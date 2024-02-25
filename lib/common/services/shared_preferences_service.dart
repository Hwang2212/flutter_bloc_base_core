import 'dart:convert';

import 'package:get_it/get_it.dart';
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
    // return getCredentials()?.accessToken;
  }

  String? getRefreshToken() {
    // return getCredentials()?.refreshToken;
  }

  Future<bool> loggedOut() async {
    return clearCredentials();
  }

  bool getIsUserLoggedIn() {
    return false;
  }

  Future<bool> _setString(String key, String value) async {
    /// AGMO loongyeat:
    /// Note: Due to limitations in Android's SharedPreferences,
    /// values cannot start with any one of the following:
    ///
    /// 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu'
    /// 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBCaWdJbnRlZ2Vy'
    /// 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBEb3VibGUu'
    ///
    /// Because of this, let's just append '#' in front
    /// of our values and remove it when fetching.
    return prefs.setString(
      key,
      '#$value',
    );
  }

  String? _getString(String key) {
    final value = prefs.getString(key);

    /// AGMO loonyeat: Remove '#' character at the start.
    /// See `_setString` for more details.
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
