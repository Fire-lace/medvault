class MedicalRecord {
  final String recordID;
  final String patientID;
  final String type;
  final DateTime dateAdded;
  final String storageRef;
  final String encryptionKeyRef;

  MedicalRecord({
    required this.recordID,
    required this.patientID,
    required this.type,
    required this.dateAdded,
    required this.storageRef,
    required this.encryptionKeyRef,
  });

  void upload() {}
  void view() {}
  void delete() {}
  void encrypt(String data) {}
}
