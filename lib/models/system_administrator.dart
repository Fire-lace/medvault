class SystemAdministrator {
  final String adminID;
  final String username;
  final String role;

  SystemAdministrator({
    required this.adminID,
    required this.username,
    required this.role,
  });

  void manageUsers() {}
  void viewAuditLogs() {}
  void configureSystem() {}
}
