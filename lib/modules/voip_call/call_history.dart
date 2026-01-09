import 'dart:convert';

import 'package:project_k/modules/voip_call/call_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallHistoryService {
  static const _key = 'call_history_v2';

  static Future<List<CallModel>> getCalls() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_key) ?? [];
    return data.map((e) => CallModel.fromJson(jsonDecode(e))).toList();
  }

  static Future<void> addCall(CallModel call) async {
    final prefs = await SharedPreferences.getInstance();
    final calls = await getCalls();
    calls.insert(0, call);
    await prefs.setStringList(
      _key,
      calls.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }

  static Future<List<CallModel>> filter({CallStatus? status}) async {
    final calls = await getCalls();
    if (status == null) return calls;
    return calls.where((c) => c.status == status).toList();
  }
}
