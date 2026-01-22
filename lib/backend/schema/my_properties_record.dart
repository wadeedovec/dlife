import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyPropertiesRecord extends FirestoreRecord {
  MyPropertiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "project_id" field.
  DocumentReference? _projectId;
  DocumentReference? get projectId => _projectId;
  bool hasProjectId() => _projectId != null;

  // "block_id" field.
  DocumentReference? _blockId;
  DocumentReference? get blockId => _blockId;
  bool hasBlockId() => _blockId != null;

  // "property_id" field.
  DocumentReference? _propertyId;
  DocumentReference? get propertyId => _propertyId;
  bool hasPropertyId() => _propertyId != null;

  // "property_name" field.
  String? _propertyName;
  String get propertyName => _propertyName ?? '';
  bool hasPropertyName() => _propertyName != null;

  // "document_url" field.
  String? _documentUrl;
  String get documentUrl => _documentUrl ?? '';
  bool hasDocumentUrl() => _documentUrl != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "submitted_at" field.
  DateTime? _submittedAt;
  DateTime? get submittedAt => _submittedAt;
  bool hasSubmittedAt() => _submittedAt != null;

  // "verified_at" field.
  DateTime? _verifiedAt;
  DateTime? get verifiedAt => _verifiedAt;
  bool hasVerifiedAt() => _verifiedAt != null;

  // "verified_by" field.
  DocumentReference? _verifiedBy;
  DocumentReference? get verifiedBy => _verifiedBy;
  bool hasVerifiedBy() => _verifiedBy != null;

  // "rejection_reason" field.
  String? _rejectionReason;
  String get rejectionReason => _rejectionReason ?? '';
  bool hasRejectionReason() => _rejectionReason != null;

  // "my_property_id" field.
  String? _myPropertyId;
  String get myPropertyId => _myPropertyId ?? '';
  bool hasMyPropertyId() => _myPropertyId != null;

  // "relation" field.
  String? _relation;

  /// "owner" or "tenant"
  String get relation => _relation ?? '';
  bool hasRelation() => _relation != null;

  // "rent_amount" field.
  double? _rentAmount;
  double get rentAmount => _rentAmount ?? 0.0;
  bool hasRentAmount() => _rentAmount != null;

  // "lease_start_date" field.
  DateTime? _leaseStartDate;
  DateTime? get leaseStartDate => _leaseStartDate;
  bool hasLeaseStartDate() => _leaseStartDate != null;

  // "lease_end_date" field.
  DateTime? _leaseEndDate;
  DateTime? get leaseEndDate => _leaseEndDate;
  bool hasLeaseEndDate() => _leaseEndDate != null;

  // "lease_document_url" field.
  String? _leaseDocumentUrl;
  String get leaseDocumentUrl => _leaseDocumentUrl ?? '';
  bool hasLeaseDocumentUrl() => _leaseDocumentUrl != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _projectId = snapshotData['project_id'] as DocumentReference?;
    _blockId = snapshotData['block_id'] as DocumentReference?;
    _propertyId = snapshotData['property_id'] as DocumentReference?;
    _propertyName = snapshotData['property_name'] as String?;
    _documentUrl = snapshotData['document_url'] as String?;
    _status = snapshotData['status'] as String?;
    _submittedAt = snapshotData['submitted_at'] as DateTime?;
    _verifiedAt = snapshotData['verified_at'] as DateTime?;
    _verifiedBy = snapshotData['verified_by'] as DocumentReference?;
    _rejectionReason = snapshotData['rejection_reason'] as String?;
    _myPropertyId = snapshotData['my_property_id'] as String?;
    _relation = snapshotData['relation'] as String?;
    _rentAmount = castToType<double>(snapshotData['rent_amount']);
    _leaseStartDate = snapshotData['lease_start_date'] as DateTime?;
    _leaseEndDate = snapshotData['lease_end_date'] as DateTime?;
    _leaseDocumentUrl = snapshotData['lease_document_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('my_properties');

  static Stream<MyPropertiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyPropertiesRecord.fromSnapshot(s));

  static Future<MyPropertiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyPropertiesRecord.fromSnapshot(s));

  static MyPropertiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyPropertiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyPropertiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyPropertiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyPropertiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyPropertiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyPropertiesRecordData({
  DocumentReference? userId,
  DocumentReference? projectId,
  DocumentReference? blockId,
  DocumentReference? propertyId,
  String? propertyName,
  String? documentUrl,
  String? status,
  DateTime? submittedAt,
  DateTime? verifiedAt,
  DocumentReference? verifiedBy,
  String? rejectionReason,
  String? myPropertyId,
  String? relation,
  double? rentAmount,
  DateTime? leaseStartDate,
  DateTime? leaseEndDate,
  String? leaseDocumentUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'project_id': projectId,
      'block_id': blockId,
      'property_id': propertyId,
      'property_name': propertyName,
      'document_url': documentUrl,
      'status': status,
      'submitted_at': submittedAt,
      'verified_at': verifiedAt,
      'verified_by': verifiedBy,
      'rejection_reason': rejectionReason,
      'my_property_id': myPropertyId,
      'relation': relation,
      'rent_amount': rentAmount,
      'lease_start_date': leaseStartDate,
      'lease_end_date': leaseEndDate,
      'lease_document_url': leaseDocumentUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyPropertiesRecordDocumentEquality
    implements Equality<MyPropertiesRecord> {
  const MyPropertiesRecordDocumentEquality();

  @override
  bool equals(MyPropertiesRecord? e1, MyPropertiesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.projectId == e2?.projectId &&
        e1?.blockId == e2?.blockId &&
        e1?.propertyId == e2?.propertyId &&
        e1?.propertyName == e2?.propertyName &&
        e1?.documentUrl == e2?.documentUrl &&
        e1?.status == e2?.status &&
        e1?.submittedAt == e2?.submittedAt &&
        e1?.verifiedAt == e2?.verifiedAt &&
        e1?.verifiedBy == e2?.verifiedBy &&
        e1?.rejectionReason == e2?.rejectionReason &&
        e1?.myPropertyId == e2?.myPropertyId &&
        e1?.relation == e2?.relation &&
        e1?.rentAmount == e2?.rentAmount &&
        e1?.leaseStartDate == e2?.leaseStartDate &&
        e1?.leaseEndDate == e2?.leaseEndDate &&
        e1?.leaseDocumentUrl == e2?.leaseDocumentUrl;
  }

  @override
  int hash(MyPropertiesRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.projectId,
        e?.blockId,
        e?.propertyId,
        e?.propertyName,
        e?.documentUrl,
        e?.status,
        e?.submittedAt,
        e?.verifiedAt,
        e?.verifiedBy,
        e?.rejectionReason,
        e?.myPropertyId,
        e?.relation,
        e?.rentAmount,
        e?.leaseStartDate,
        e?.leaseEndDate,
        e?.leaseDocumentUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is MyPropertiesRecord;
}
