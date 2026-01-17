import '../models/sharing_link.dart';

/// Represents Secure Sharing Module (Cloud Function)
class SharingService {
  /// Generate a sharing link for a medical record
  Future<SharingLink> generateLink({
    required String recordID,
    required String patientID,
    required DateTime expiryDate,
  }) async {
    return SharingLink(
      linkID: 'generated_link_id',
      generatedByPatientID: patientID,
      recordID: recordID,
      expiryDate: expiryDate,
      qrCodeImage: 'qr_image_data',
      isExpired: false,
    );
  }

  /// Validate link ID and expiration
  Future<bool> validateLink(SharingLink link) async {
    if (link.isExpired) return false;
    if (DateTime.now().isAfter(link.expiryDate)) return false;
    return true;
  }

  /// Mark link as expired
  Future<void> expireLink(SharingLink link) async {
    link.isExpired = true;
  }
}


