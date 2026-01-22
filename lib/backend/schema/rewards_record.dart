import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RewardsRecord extends FirestoreRecord {
  RewardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "benefits" field.
  List<String>? _benefits;
  List<String> get benefits => _benefits ?? const [];
  bool hasBenefits() => _benefits != null;

  // "terms" field.
  String? _terms;
  String get terms => _terms ?? '';
  bool hasTerms() => _terms != null;

  // "discount_label" field.
  String? _discountLabel;
  String get discountLabel => _discountLabel ?? '';
  bool hasDiscountLabel() => _discountLabel != null;

  // "status" field.
  String? _status;

  /// "active", "expired", etc.
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "expires_at" field.
  DateTime? _expiresAt;
  DateTime? get expiresAt => _expiresAt;
  bool hasExpiresAt() => _expiresAt != null;

  // "redeemable" field.
  bool? _redeemable;
  bool get redeemable => _redeemable ?? false;
  bool hasRedeemable() => _redeemable != null;

  // "target_role" field.
  int? _targetRole;
  int get targetRole => _targetRole ?? 0;
  bool hasTargetRole() => _targetRole != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "facility_id" field.
  DocumentReference? _facilityId;
  DocumentReference? get facilityId => _facilityId;
  bool hasFacilityId() => _facilityId != null;

  // "facilityStringID" field.
  String? _facilityStringID;
  String get facilityStringID => _facilityStringID ?? '';
  bool hasFacilityStringID() => _facilityStringID != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _benefits = getDataList(snapshotData['benefits']);
    _terms = snapshotData['terms'] as String?;
    _discountLabel = snapshotData['discount_label'] as String?;
    _status = snapshotData['status'] as String?;
    _expiresAt = snapshotData['expires_at'] as DateTime?;
    _redeemable = snapshotData['redeemable'] as bool?;
    _targetRole = castToType<int>(snapshotData['target_role']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _facilityId = snapshotData['facility_id'] as DocumentReference?;
    _facilityStringID = snapshotData['facilityStringID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rewards');

  static Stream<RewardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RewardsRecord.fromSnapshot(s));

  static Future<RewardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RewardsRecord.fromSnapshot(s));

  static RewardsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RewardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RewardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RewardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RewardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RewardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRewardsRecordData({
  String? title,
  String? description,
  String? terms,
  String? discountLabel,
  String? status,
  DateTime? expiresAt,
  bool? redeemable,
  int? targetRole,
  DateTime? createdAt,
  String? image,
  DocumentReference? facilityId,
  String? facilityStringID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'terms': terms,
      'discount_label': discountLabel,
      'status': status,
      'expires_at': expiresAt,
      'redeemable': redeemable,
      'target_role': targetRole,
      'created_at': createdAt,
      'image': image,
      'facility_id': facilityId,
      'facilityStringID': facilityStringID,
    }.withoutNulls,
  );

  return firestoreData;
}

class RewardsRecordDocumentEquality implements Equality<RewardsRecord> {
  const RewardsRecordDocumentEquality();

  @override
  bool equals(RewardsRecord? e1, RewardsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.benefits, e2?.benefits) &&
        e1?.terms == e2?.terms &&
        e1?.discountLabel == e2?.discountLabel &&
        e1?.status == e2?.status &&
        e1?.expiresAt == e2?.expiresAt &&
        e1?.redeemable == e2?.redeemable &&
        e1?.targetRole == e2?.targetRole &&
        e1?.createdAt == e2?.createdAt &&
        e1?.image == e2?.image &&
        e1?.facilityId == e2?.facilityId &&
        e1?.facilityStringID == e2?.facilityStringID;
  }

  @override
  int hash(RewardsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.benefits,
        e?.terms,
        e?.discountLabel,
        e?.status,
        e?.expiresAt,
        e?.redeemable,
        e?.targetRole,
        e?.createdAt,
        e?.image,
        e?.facilityId,
        e?.facilityStringID
      ]);

  @override
  bool isValidKey(Object? o) => o is RewardsRecord;
}
