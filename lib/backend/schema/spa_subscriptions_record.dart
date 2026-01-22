import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpaSubscriptionsRecord extends FirestoreRecord {
  SpaSubscriptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "spa_package_id" field.
  DocumentReference? _spaPackageId;
  DocumentReference? get spaPackageId => _spaPackageId;
  bool hasSpaPackageId() => _spaPackageId != null;

  // "appointment_date" field.
  DateTime? _appointmentDate;
  DateTime? get appointmentDate => _appointmentDate;
  bool hasAppointmentDate() => _appointmentDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "price_paid" field.
  double? _pricePaid;
  double get pricePaid => _pricePaid ?? 0.0;
  bool hasPricePaid() => _pricePaid != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "appointment_time" field.
  String? _appointmentTime;
  String get appointmentTime => _appointmentTime ?? '';
  bool hasAppointmentTime() => _appointmentTime != null;

  // "facility_id" field.
  DocumentReference? _facilityId;
  DocumentReference? get facilityId => _facilityId;
  bool hasFacilityId() => _facilityId != null;

  // "type" field.
  String? _type;

  /// package or service
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "spa_service_id" field.
  DocumentReference? _spaServiceId;
  DocumentReference? get spaServiceId => _spaServiceId;
  bool hasSpaServiceId() => _spaServiceId != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _spaPackageId = snapshotData['spa_package_id'] as DocumentReference?;
    _appointmentDate = snapshotData['appointment_date'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _pricePaid = castToType<double>(snapshotData['price_paid']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _notes = snapshotData['notes'] as String?;
    _appointmentTime = snapshotData['appointment_time'] as String?;
    _facilityId = snapshotData['facility_id'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _spaServiceId = snapshotData['spa_service_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('spa_subscriptions');

  static Stream<SpaSubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpaSubscriptionsRecord.fromSnapshot(s));

  static Future<SpaSubscriptionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SpaSubscriptionsRecord.fromSnapshot(s));

  static SpaSubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpaSubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpaSubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpaSubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpaSubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpaSubscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpaSubscriptionsRecordData({
  DocumentReference? userId,
  DocumentReference? spaPackageId,
  DateTime? appointmentDate,
  String? status,
  double? pricePaid,
  DateTime? createdAt,
  String? notes,
  String? appointmentTime,
  DocumentReference? facilityId,
  String? type,
  DocumentReference? spaServiceId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'spa_package_id': spaPackageId,
      'appointment_date': appointmentDate,
      'status': status,
      'price_paid': pricePaid,
      'created_at': createdAt,
      'notes': notes,
      'appointment_time': appointmentTime,
      'facility_id': facilityId,
      'type': type,
      'spa_service_id': spaServiceId,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpaSubscriptionsRecordDocumentEquality
    implements Equality<SpaSubscriptionsRecord> {
  const SpaSubscriptionsRecordDocumentEquality();

  @override
  bool equals(SpaSubscriptionsRecord? e1, SpaSubscriptionsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.spaPackageId == e2?.spaPackageId &&
        e1?.appointmentDate == e2?.appointmentDate &&
        e1?.status == e2?.status &&
        e1?.pricePaid == e2?.pricePaid &&
        e1?.createdAt == e2?.createdAt &&
        e1?.notes == e2?.notes &&
        e1?.appointmentTime == e2?.appointmentTime &&
        e1?.facilityId == e2?.facilityId &&
        e1?.type == e2?.type &&
        e1?.spaServiceId == e2?.spaServiceId;
  }

  @override
  int hash(SpaSubscriptionsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.spaPackageId,
        e?.appointmentDate,
        e?.status,
        e?.pricePaid,
        e?.createdAt,
        e?.notes,
        e?.appointmentTime,
        e?.facilityId,
        e?.type,
        e?.spaServiceId
      ]);

  @override
  bool isValidKey(Object? o) => o is SpaSubscriptionsRecord;
}
