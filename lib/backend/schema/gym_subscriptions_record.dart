import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GymSubscriptionsRecord extends FirestoreRecord {
  GymSubscriptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "membership_type" field.
  String? _membershipType;

  /// e.g., Standard, Premium, VIP
  String get membershipType => _membershipType ?? '';
  bool hasMembershipType() => _membershipType != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "qr_code" field.
  String? _qrCode;
  String get qrCode => _qrCode ?? '';
  bool hasQrCode() => _qrCode != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "facilityID" field.
  DocumentReference? _facilityID;
  DocumentReference? get facilityID => _facilityID;
  bool hasFacilityID() => _facilityID != null;

  // "package_ref" field.
  DocumentReference? _packageRef;
  DocumentReference? get packageRef => _packageRef;
  bool hasPackageRef() => _packageRef != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _membershipType = snapshotData['membership_type'] as String?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _isActive = snapshotData['is_active'] as bool?;
    _qrCode = snapshotData['qr_code'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _facilityID = snapshotData['facilityID'] as DocumentReference?;
    _packageRef = snapshotData['package_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gym_subscriptions');

  static Stream<GymSubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GymSubscriptionsRecord.fromSnapshot(s));

  static Future<GymSubscriptionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GymSubscriptionsRecord.fromSnapshot(s));

  static GymSubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GymSubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GymSubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GymSubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GymSubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GymSubscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGymSubscriptionsRecordData({
  DocumentReference? userId,
  String? membershipType,
  DateTime? startDate,
  DateTime? endDate,
  bool? isActive,
  String? qrCode,
  DateTime? createdAt,
  DocumentReference? facilityID,
  DocumentReference? packageRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'membership_type': membershipType,
      'start_date': startDate,
      'end_date': endDate,
      'is_active': isActive,
      'qr_code': qrCode,
      'created_at': createdAt,
      'facilityID': facilityID,
      'package_ref': packageRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class GymSubscriptionsRecordDocumentEquality
    implements Equality<GymSubscriptionsRecord> {
  const GymSubscriptionsRecordDocumentEquality();

  @override
  bool equals(GymSubscriptionsRecord? e1, GymSubscriptionsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.membershipType == e2?.membershipType &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.isActive == e2?.isActive &&
        e1?.qrCode == e2?.qrCode &&
        e1?.createdAt == e2?.createdAt &&
        e1?.facilityID == e2?.facilityID &&
        e1?.packageRef == e2?.packageRef;
  }

  @override
  int hash(GymSubscriptionsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.membershipType,
        e?.startDate,
        e?.endDate,
        e?.isActive,
        e?.qrCode,
        e?.createdAt,
        e?.facilityID,
        e?.packageRef
      ]);

  @override
  bool isValidKey(Object? o) => o is GymSubscriptionsRecord;
}
