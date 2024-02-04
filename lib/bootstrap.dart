import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('OnEvent: (${event.runtimeType})');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log(
      // ignore: avoid_dynamic_calls
      'OnChange: (${transition.currentState.runtimeType}'
      ' -> '

      // ignore: avoid_dynamic_calls
      '${transition.nextState.runtimeType})',
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log(
      // ignore: avoid_dynamic_calls
      'OnChange: (${change.currentState.runtimeType}'
      ' -> '

      // ignore: avoid_dynamic_calls
      '${change.nextState.runtimeType})',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('OnError: (${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(() async {
    Bloc.observer = AppBlocObserver();
    await SentryFlutter.init(
      (options) async {
        options.dsn =
            'https://6778b2c96a84b179bcd277c477e2dcc4@o4506208253378560.ingest.sentry.io/4506208254492672';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
      },
      appRunner: () async {
        runApp(await builder());
      },
    );
  }, (error, stackTrace) async {
    log(error.toString(), stackTrace: stackTrace);

    if (kReleaseMode) {
      await Sentry.captureException(
        error,
        stackTrace: stackTrace,
      );
    }
  });
}
