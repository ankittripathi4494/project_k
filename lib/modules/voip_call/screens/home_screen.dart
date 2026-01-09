import 'package:flutter/material.dart';
import 'package:project_k/modules/voip_call/call_service.dart';
import 'package:project_k/modules/voip_call/screens/history_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('VoIP App')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => CallService.incomingCall('John Doe'),
            child: Text('Simulate Incoming Call'),
          ),
          ElevatedButton(
            onPressed: () => CallService.outgoingCall('Jane Smith'),
            child: Text('Make Call'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HistoryScreen()),
            ),
            child: Text('Call History'),
          ),
        ],
      ),
    );
  }
}
