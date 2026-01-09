import 'package:flutter/material.dart';
import 'package:project_k/modules/voip_call/call_history.dart';
import 'package:project_k/modules/voip_call/call_model.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  CallStatus? filter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call History'),
        actions: [
          PopupMenuButton<CallStatus?>(
            onSelected: (value) => setState(() => filter = value),
            itemBuilder: (context) => [
              PopupMenuItem(value: null, child: Text('All')),
              PopupMenuItem(value: CallStatus.missed, child: Text('Missed')),
              PopupMenuItem(
                  value: CallStatus.answered, child: Text('Answered')),
              PopupMenuItem(value: CallStatus.ended, child: Text('Ended')),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<CallModel>>(
        future: CallHistoryService.filter(status: filter),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final call = snapshot.data![index];
              return ListTile(
                leading: Icon(
                  call.isIncoming ? Icons.call_received : Icons.call_made,
                ),
                title: Text(call.name),
                subtitle: Text(
                  '${call.status.name.toUpperCase()} · ${call.timestamp}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
