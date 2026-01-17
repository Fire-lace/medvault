class AuditLog {
  final String logID;
  final DateTime timestamp;
  final String actionType;
  final String userID;
  final String details;

  AuditLog({
    required this.logID,
    required this.timestamp,
    required this.actionType,
    required this.userID,
    required this.details,
  });

  void logEvent() {}
}
