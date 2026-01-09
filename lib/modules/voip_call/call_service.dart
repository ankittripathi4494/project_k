import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';

import 'package:uuid/uuid.dart';

import 'call_history.dart';
import 'call_model.dart';

class CallService {
  static Future<void> incomingCall(String name) async {
    final id = const Uuid().v4();

    await FlutterCallkitIncoming.showCallkitIncoming(
      CallKitParams(
        id: id,
        nameCaller: name,
        appName: 'VoIP App',
        type: 0,
      ),
    );

    await CallHistoryService.addCall(
      CallModel(
        id: id,
        name: name,
        timestamp: DateTime.now(),
        isIncoming: true,
        status: CallStatus.ringing,
      ),
    );
  }

  static Future<void> outgoingCall(String name) async {
    final id = const Uuid().v4();

    await FlutterCallkitIncoming.startCall(
      CallKitParams(
        id: id,
        nameCaller: name,
        appName: 'VoIP App',
        type: 0,
      ),
    );

    await CallHistoryService.addCall(
      CallModel(
        id: id,
        name: name,
        timestamp: DateTime.now(),
        isIncoming: false,
        status: CallStatus.answered,
      ),
    );
  }
}
