class CallModel {
  final String id;
  final String name;
  final DateTime timestamp;
  final bool isIncoming;
  final CallStatus status;

  CallModel({
    required this.id,
    required this.name,
    required this.timestamp,
    required this.isIncoming,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'timestamp': timestamp.toIso8601String(),
        'isIncoming': isIncoming,
        'status': status.name,
      };

  factory CallModel.fromJson(Map<String, dynamic> json) => CallModel(
        id: json['id'],
        name: json['name'],
        timestamp: DateTime.parse(json['timestamp']),
        isIncoming: json['isIncoming'],
        status: CallStatus.values.firstWhere(
          (e) => e.name == json['status'],
        ),
      );
}

enum CallStatus {
  ringing,
  answered,
  ended,
  missed,
}
