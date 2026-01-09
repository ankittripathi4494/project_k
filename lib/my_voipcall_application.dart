import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_k/global/helpers/secure_session_helper.dart';
import 'package:project_k/main.dart';
import 'package:project_k/modules/voip_call/call_history.dart';

import 'modules/voip_call/call_model.dart';
import 'modules/voip_call/screens/home_screen.dart';

class MyVoipCallApplication extends StatelessWidget {
  const MyVoipCallApplication({super.key});

  @override
  Widget build(BuildContext context) {
    setupCallKitListeners();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,

          home: HomeScreen(),
        );
      },
    );
  }
}

void setupCallKitListeners() {
  FlutterCallkitIncoming.onEvent.listen((event) async {
    if (event == null) return;

    final callId = event.body?['id'];

    switch (event.event) {
      case Event.actionCallIncoming:
        _updateStatus(callId, CallStatus.ringing);
        // Start ringing UI / audio here
        break;

      case Event.actionCallAccept:
      case Event.actionCallStart:
        _updateStatus(callId, CallStatus.answered);
        // Start audio / WebRTC here
        break;

      case Event.actionCallDecline:
        _updateStatus(callId, CallStatus.missed);
        // Stop audio / WebRTC if needed
        break;

      case Event.actionCallEnded:
      case Event.actionCallTimeout:
        _updateStatus(callId, CallStatus.ended);
        // Stop audio / WebRTC here
        break;

      case Event.actionCallConnected:
        // Call is connected, you may update UI or start features
        break;

      case Event.actionDidUpdateDevicePushTokenVoip:
        // Handle updated VoIP token
        break;

      case Event.actionCallToggleHold:
        // Handle hold/unhold
        break;

      case Event.actionCallToggleMute:
        // Handle mute/unmute
        break;

      case Event.actionCallToggleDmtf:
        // Handle DTMF tones
        break;

      case Event.actionCallToggleGroup:
        // Handle group call toggle
        break;

      case Event.actionCallToggleAudioSession:
        // Handle audio session changes
        break;

      case Event.actionCallCallback:
        // Handle callback request
        break;

      case Event.actionCallCustom:
        // Handle custom call actions
        break;

      default:
        print('Unhandled CallKit event: ${event.event}');
    }
  });
}



Future<void> _updateStatus(String id, CallStatus status) async {
  final calls = await CallHistoryService.getCalls();
  final index = calls.indexWhere((c) => c.id == id);
  if (index == -1) return;

  calls[index] = CallModel(
    id: calls[index].id,
    name: calls[index].name,
    timestamp: calls[index].timestamp,
    isIncoming: calls[index].isIncoming,
    status: status,
  );

  await SecureSessionHelper().setData(
    'call_history_v2',
    calls.map((e) => convert.jsonEncode(e.toJson())).toList().toString(),
  );
}
