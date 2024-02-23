<!-- ![logo](android/app/src/main/ic_launcher-playstore.png) -->

# FlutterBlocBase

An app for FlutterBlocBase.

# FlutterBlocBase



## Code Structure

This project uses Flutter `3.16.5`.

_Note: If you're working on multiple projects with different Flutter versions,
checkout [fvm](https://fvm.app/).
To use it on your workspace, run `fvm use 3.16.5` in the project's root directory.
To make sure that your IDE uses your selected Flutter SDK version, see
the [IDE](https://fvm.app/docs/getting_started/configuration/#ide) section on their Getting Started
guide._

### Running the application

To run the desire flavor either use the launch configuration in VSCode/Android Studio or use the
following commands in your terminal:

```shell
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

### Working on a new screen

1. To create a new class, create an empty dart file and you may use the below commands then enter to
   create a new class:

- Stateful: `stful`
- Stateless: `stless`

2. Name the created class accordingly to the file name with CamelCase format. <br>
3. Import `'package:flutter/material.dart'` for both state widget. <br>
4. Add class name into constant file under `AnalyticsScreenName` class:
   ```dart
   class AnalyticsScreenName {
     // ...
      static const className = 'class_name';
   }
   ```
5. Create a constant at top of class setting its screen name. E.g.: <br>
   ```dart
   const _screenName = AnalyticsScreenName.className;
   ```
6. Override initState and dispose method to log the class screen.
   ```dart
   @override
   void initState() {
     super.initState();
     
     AnalyticsHelper.logScreen(_screenName);
     Smartlook.instance.trackNavigationEnter(_screenName);
   }
   
   @override
   void dispose() {
     Smartlook.instance.trackNavigationExit(_screenName);
     super.dispose();
   }
   ```
7. Return AppScaffold widget for a whole new page under build method.
   ```dart
   @override
   Widget build(BuildContext context) {
     return AppScaffold(
        appBar: AppBarView(), 
        body: MyBodyWidget(), // all widgets are to be in this body section
     );
   }
   ```
8. Some common used handler and widgets can be found under this folder:
   ```
   ├── lib
   │   ├── common
   │   │   ├── core
   │   │   │  ├── analytics_helper.dart
                  
   │   │   │  ├── app_config.dart
   │   │   │  ├── constants.dart
   │   │   │  ├── enums.dart
   │   │   │  ├── extensions.dart
   │   │   │  └── general_helper.dart
   ```

### Working with Translations

This project relies
on [flutter_localizations](https://api.flutter.dev/flutter/flutter_localizations) and follows
the [official internationalization guide for Flutter](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
.

#### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.
   ```json
   {
      "@@locale": "en", 
      "counterAppBarTitle": "Counter" 
   }
   ```
2. Then add a new key/value

```json
{
  "@@locale": "en",
  "counterappBarTitle": "Counter",
  "helloWorld": "Hello World"
}
```

3. Use the new string

```dart
import 'package:flutter_bloc_base/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

4. If there's any arguments needed to add in between any string, may use the placeholder field:

```json
{
  "@@locale": "en",
  "counterAppBarTitle": "Counter",
  "helloWorld": "Hello World",
  "youHavePressedTimes": "You have pressed {count} times. ",
  "@youHavePressedTimes": {
    "placeholders": {
      "count": {
        "type": "String"
      }
    }
  }
}
```

5. Use the string with placeholder

```dart
import 'package:flutter_bloc_base/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.youHavePressedTimes('5'));
}
```

_Note: Adding a new string will need to run `flutter gen-l10n` to generate your localised strings_

#### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include
the new locale.

```xml
<!--..-->
<key>CFBundleLocalizations</key><array>
<string>en</string>
<string>es</string>
</array><!--..-->
```

#### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```text
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file.

`app_en.arb`

```json
{
  "@@locale": "en",
  "counterAppBarTitle": "Counter"
}
```

`app_es.arb`

```json
{
  "@@locale": "es",
  "counterAppBarTitle": "Contador"
}
```

### Working with Assets

Included in this project is an asset generation tool used to enforce (if required) asset naming and
sizing. To run,

```shell
./generate_asset_metadata.sh
```

This generated an `assets.g.dart` file in the `common/` folder. You can then access your asset path
in code using `Assets.fileName.path`.

### Maintain versioning

1. There's 2 flavor app versioning, production and staging.
2. The current versions can be viewed in `pubspec.yaml`.

```yaml
# Production
# version: 1.0.3+15
# Staging
version: 1.0.4+68
```

_Note: versions are to be updated every release_

## Key Functionality

### Login

## Data flow

### Working with API calls

1. New APIs are to be added into `api_service.dart` file with a new method created for it to be
   called.
2. Before working on the method, a request payload model and a response payload model will need to
   be created. <br>
   Models are to be created under the folder `models` either by self create or existing. <br>

   #### `fromJson` constructors and `toJson` methods:
   This app uses [freezed_annotation](https://github.com/rrousselGit/freezed#readme) to
   generate `fromJson` constructors and `toJson` methods. To generate the `.freezed.dart`
   and `.g.dart` files, run:
   ```shell
   # Run once
   $ flutter pub run build_runner run --delete-conflicting-outputs
   ```
   after setting up your `freezed` annotated class, run:
   ```shell
   # Watch the directory for file changes
   $ flutter pub run build_runner watch --delete-conflicting-outputs
   ```
   and save your file. <br><br>
3. Some common used models are created under the directory:
   ```
   ├── lib
   │   ├── common
   │   │   ├── models
   │   │   │  ├── api_boolean_result_model.dart
   │   │   │  └── api_string_result_model.dart
   ```
4. An API call can be made under the newly created method by you in `api_service.dart`.
   ```dart
   Future<ResponseModel?> newApiMethod(RequestModel body) async {
     try {
       final url = '${ApiDefaults.baseUrl}/<API_PATH>';
       final response = await callApi<Json>(HttpRequestMethod.REQUEST_METHOD, url, body: body.toJson);
       final responseModel = ResponseModel.fromJson(response);
       
       // continue to work on the response
       // ...
     } catch (e) {}
   }
   ```
   This API can be accessed using service locator GetIt:
   ```dart
   final apiService = GetIt.instance<ApiService>();
   final response = apiService.newApiMethod(requestBody);
   ```
5. Note: if a certain field has a specific format such as **Datetime**, go to `lib/common/core/field_converter.dart`, then add replicate and refactor code below to process the field's value:
    ```dart
    // lib/common/core/field_converter.dart
    import 'package:freezed_annotation/freezed_annotation.dart';

    class DateTimeUtc implements JsonConverter<DateTime?, String> {
      const DateTimeUtc();

      @override
      String toJson(DateTime? value) {
        return value?.toIso8601String() ?? "";
      }

      @override
      DateTime? fromJson(String jsonString) {
        DateTime.parse(jsonString);
        return DateTime.tryParse(jsonString);
      }
    }
    ```
    Then:
    ```dart
    class ExampleModel with _$ExampleModel {
      @JsonSerializable(fieldRename: FieldRename.snake) 
      const factory ExampleModel({
    //...
        @DateTimeUtc() DateTime? createdAt,
      }) = _ExampleModel;

      factory ExampleModel.fromJson(Map<String, dynamic> json) =>
          _$ExampleModelFromJson(json);
    }
    ```


### Working with Shared Preferences

Some of the values such as favourite items and cart items are stored in the shared preference, in
order to perform this action, shared preference is initialised `app_config.dart` and used in
`shared_preferences_service.dart`. Shared preferences keys are stored in `enums.dart`.

```dart
// initialise shared preference service
final prefs = await SharedPreferences.getInstance();

// remove shared preference value with key
prefs.remove(<SharedPreferenceKey>.toString());

// get shared preference value with key
prefs.get(<SharedPreferenceKey>.toString());

// set shared preference value with key
prefs.setString(<SharedPreferenceKey>.toString());
```

## State Management

BLoC (Business Logic Component) architecture is used in this project, where it uses state management
pattern to separate the presentation layer from business logic layer. It is separated to 3 different
categories Event, State and BloC.

1. **Events** - actions that UI sends in order to mutate the page state.
2. **State** - condition the page might be. (E.g. FetchAutoshipLoading, FetchAutoshipSuccess and
   FetchAutoshipFailed)
3. **BloC** - action handlers and state mutators where APIs are called in this project.

## Styling

-- Not supported at the moment --

## Testing

-- To be implemented --

## Build Process

### Build the project for app release

To build, make sure the flavor is also specific:

```shell
$ flutter build <BUILD_TYPE> --flavor <BUILD_FLAVOR> --target lib/main_<BUILD_FLAVOR>.dart --no-tree-shake-icons
```

where `BUILD_TYPE` refers to either on of:

- `apk` - app file type for Android devices
- `appbundle` - bundle for submitting to PlayStore
- `ipa` - file type for iOS devices

_Note: `--no-tree-shake-icons` option is required to allow builds with SDUI as Flutter is no longer
able to selectively choose which app icons to be included in the build based on what is used in
code._

## Environment Variables

### There's 3 type of flavors in this project:

1. **development**
    - Target: Mobile App Developer
    <!-- - API Endpoint: https://my-api-dev.apacdev.FlutterBlocBase.com -->
2. **staging**
    - Target: FlutterBlocBase Internal
    <!-- - API Endpoint: https://my-api-dev.apacdev.FlutterBlocBase.com -->
3. **production**
    - Target: FlutterBlocBase End Users
    <!-- - API Endpoint: https://my-api.apac.FlutterBlocBase.com -->

### The main files for starting these flavors are separated as below:

- main_development.dart
- main_staging.dart
- main_production.dart

### How do you programmatically check the environment?

You may use `AppConfig.environment` to check for current environment, it will return enum
type `Environments`.

## Points of contact

**Project Owner:**<br> 
Andy Hwang Sau Yee(hwang12616@gmail.com)<br>