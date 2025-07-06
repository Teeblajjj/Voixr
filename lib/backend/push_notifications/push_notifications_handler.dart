import 'dart:async';

import 'serialization_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
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
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'TexttoSpeech': (data) async => ParameterData(
        allParams: {
          'voicename': getParameter<String>(data, 'voicename'),
          'usecase': getParameter<String>(data, 'usecase'),
          'id': getParameter<String>(data, 'id'),
        },
      ),
  'home': ParameterData.none(),
  'voices': ParameterData.none(),
  'RecordAudio': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
          'usecase': getParameter<String>(data, 'usecase'),
          'id': getParameter<String>(data, 'id'),
        },
      ),
  'notification': ParameterData.none(),
  'Onboarding': ParameterData.none(),
  'CreateAccount': ParameterData.none(),
  'Signin': ParameterData.none(),
  'Profile0': ParameterData.none(),
  'voicesRecorder': ParameterData.none(),
  'voicesTextspch': ParameterData.none(),
  'Podcaststudio': ParameterData.none(),
  'transcribe': ParameterData.none(),
  'LIBRARYPAGE': ParameterData.none(),
  'Discover': ParameterData.none(),
  'single': (data) async => ParameterData(
        allParams: {
          'docref': getParameter<DocumentReference>(data, 'docref'),
        },
      ),
  'PAYVO1': (data) async => ParameterData(
        allParams: {
          'voicref': getParameter<DocumentReference>(data, 'voicref'),
        },
      ),
  'CHOOSETYPE': ParameterData.none(),
  'podplaynew': (data) async => ParameterData(
        allParams: {
          'voicref': getParameter<DocumentReference>(data, 'voicref'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
