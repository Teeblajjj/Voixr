import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;

import '/index.dart';
import 'package:utility_functions_library_8g4bud/index.dart'
    as $utility_functions_library_8g4bud;

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) {
  $utility_functions_library_8g4bud.initializeRoutes(
    homePageWidgetName: 'utility_functions_library_8g4bud.HomePage',
    homePageWidgetPath: 'homePage',
  );

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: appStateNotifier,
    navigatorKey: appNavigatorKey,
    errorBuilder: (context, state) => _RouteErrorBuilder(
      state: state,
      child: appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
    ),
    routes: [
      FFRoute(
        name: '_initialize',
        path: '/',
        builder: (context, _) =>
            appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
        routes: [
          FFRoute(
            name: TexttoSpeechWidget.routeName,
            path: TexttoSpeechWidget.routePath,
            requireAuth: true,
            builder: (context, params) => TexttoSpeechWidget(
              voicename: params.getParam(
                'voicename',
                ParamType.String,
              ),
              usecase: params.getParam(
                'usecase',
                ParamType.String,
              ),
              id: params.getParam(
                'id',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: HomeWidget.routeName,
            path: HomeWidget.routePath,
            requireAuth: true,
            builder: (context, params) =>
                params.isEmpty ? NavBarPage(initialPage: 'home') : HomeWidget(),
          ),
          FFRoute(
            name: VoicesWidget.routeName,
            path: VoicesWidget.routePath,
            requireAuth: true,
            builder: (context, params) => VoicesWidget(),
          ),
          FFRoute(
            name: RecordAudioWidget.routeName,
            path: RecordAudioWidget.routePath,
            requireAuth: true,
            builder: (context, params) => RecordAudioWidget(
              name: params.getParam(
                'name',
                ParamType.String,
              ),
              usecase: params.getParam(
                'usecase',
                ParamType.String,
              ),
              id: params.getParam(
                'id',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: NotificationWidget.routeName,
            path: NotificationWidget.routePath,
            requireAuth: true,
            builder: (context, params) => NotificationWidget(),
          ),
          FFRoute(
            name: OnboardingWidget.routeName,
            path: OnboardingWidget.routePath,
            builder: (context, params) => OnboardingWidget(),
          ),
          FFRoute(
            name: CreateAccountWidget.routeName,
            path: CreateAccountWidget.routePath,
            builder: (context, params) => CreateAccountWidget(),
          ),
          FFRoute(
            name: SigninWidget.routeName,
            path: SigninWidget.routePath,
            builder: (context, params) => SigninWidget(),
          ),
          FFRoute(
            name: Profile0Widget.routeName,
            path: Profile0Widget.routePath,
            requireAuth: true,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Profile0')
                : Profile0Widget(),
          ),
          FFRoute(
            name: VoicesRecorderWidget.routeName,
            path: VoicesRecorderWidget.routePath,
            requireAuth: true,
            builder: (context, params) => VoicesRecorderWidget(),
          ),
          FFRoute(
            name: VoicesTextspchWidget.routeName,
            path: VoicesTextspchWidget.routePath,
            requireAuth: true,
            builder: (context, params) => VoicesTextspchWidget(),
          ),
          FFRoute(
            name: PodcaststudioWidget.routeName,
            path: PodcaststudioWidget.routePath,
            requireAuth: true,
            builder: (context, params) => PodcaststudioWidget(),
          ),
          FFRoute(
            name: TranscribeWidget.routeName,
            path: TranscribeWidget.routePath,
            requireAuth: true,
            builder: (context, params) => TranscribeWidget(),
          ),
          FFRoute(
            name: LibrarypageWidget.routeName,
            path: LibrarypageWidget.routePath,
            requireAuth: true,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'LIBRARYPAGE')
                : LibrarypageWidget(),
          ),
          FFRoute(
            name: DiscoverWidget.routeName,
            path: DiscoverWidget.routePath,
            requireAuth: true,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Discover')
                : DiscoverWidget(),
          ),
          FFRoute(
            name: SingleWidget.routeName,
            path: SingleWidget.routePath,
            requireAuth: true,
            builder: (context, params) => SingleWidget(
              docref: params.getParam(
                'docref',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['Transcriptions'],
              ),
            ),
          ),
          FFRoute(
            name: Payvo1Widget.routeName,
            path: Payvo1Widget.routePath,
            requireAuth: true,
            builder: (context, params) => Payvo1Widget(
              voicref: params.getParam(
                'voicref',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['SpeechData'],
              ),
            ),
          ),
          FFRoute(
            name: ChoosetypeWidget.routeName,
            path: ChoosetypeWidget.routePath,
            requireAuth: true,
            builder: (context, params) => ChoosetypeWidget(),
          ),
          FFRoute(
            name: PodplaynewWidget.routeName,
            path: PodplaynewWidget.routePath,
            requireAuth: true,
            builder: (context, params) => PodplaynewWidget(
              voicref: params.getParam(
                'voicref',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['Podcasts'],
              ),
            ),
          ),
          FFRoute(
            name: $utility_functions_library_8g4bud.HomePageWidget.routeName,
            path: $utility_functions_library_8g4bud.HomePageWidget.routePath,
            requireAuth: true,
            builder: (context, params) =>
                $utility_functions_library_8g4bud.HomePageWidget(),
          )
        ].map((r) => r.toRoute(appStateNotifier)).toList(),
      ),
    ].map((r) => r.toRoute(appStateNotifier)).toList(),
    observers: [routeObserver],
  );
}

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: Center(
                    child: Image.asset(
                      'assets/images/VOIXR.png',
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();

    // Handle erroneous links from Firebase Dynamic Links.

    String? location;

    /*
    Handle `links` routes that have dynamic-link entangled with deep-link 
    */
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.queryParameters.containsKey('deep_link_id')) {
      final deepLinkId = widget.state.uri.queryParameters['deep_link_id'];
      if (deepLinkId != null) {
        final deepLinkUri = Uri.parse(deepLinkId);
        final link = deepLinkUri.toString();
        final host = deepLinkUri.host;
        location = link.split(host).last;
      }
    }

    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      location = '/';
    }

    if (location != null) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => context.go(location!));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
