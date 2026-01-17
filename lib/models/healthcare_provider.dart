class HealthcareProvider {
  final String providerID;
  final String name;
  final String specialty;

  HealthcareProvider({
    required this.providerID,
    required this.name,
    required this.specialty,
  });

  void scanQR(String linkID) {}
  void viewRecord(String linkID) {}
}
