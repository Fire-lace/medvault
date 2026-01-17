class Patient {
  final String patientID;
  final String email;
  final String name;
  final String passwordHash;
  final String patientKey; // AES key reference

  Patient({
    required this.patientID,
    required this.email,
    required this.name,
    required this.passwordHash,
    required this.patientKey,
  });

  void register() {}
  void login() {}
  void manageProfile() {}
}
