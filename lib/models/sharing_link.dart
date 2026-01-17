class SharingLink {
  final String linkID;
  final String generatedByPatientID;
  final String recordID;
  final DateTime expiryDate;
  final String qrCodeImage;
  bool isExpired;

  SharingLink({
    required this.linkID,
    required this.generatedByPatientID,
    required this.recordID,
    required this.expiryDate,
    required this.qrCodeImage,
    this.isExpired = false,
  });

  void generate(String recordID) {}
  bool validate() => !isExpired && DateTime.now().isBefore(expiryDate);
  void expire() {
    isExpired = true;
  }
}
