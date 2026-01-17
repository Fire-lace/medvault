class SystemService {
  final String serviceID;
  final String name;
  final String status;

  SystemService({
    required this.serviceID,
    required this.name,
    required this.status,
  });

  void checkStatus() {}
  void authenticateUser() {}
  void storeFile() {}
}
