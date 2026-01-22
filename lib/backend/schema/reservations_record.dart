import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservationsRecord extends FirestoreRecord {
  ReservationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "facility_id" field.
  DocumentReference? _facilityId;
  DocumentReference? get facilityId => _facilityId;
  bool hasFacilityId() => _facilityId != null;

  // "customer_id" field.
  DocumentReference? _customerId;
  DocumentReference? get customerId => _customerId;
  bool hasCustomerId() => _customerId != null;

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "people_number" field.
  int? _peopleNumber;
  int get peopleNumber => _peopleNumber ?? 0;
  bool hasPeopleNumber() => _peopleNumber != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  void _initializeFields() {
    _facilityId = snapshotData['facility_id'] as DocumentReference?;
    _customerId = snapshotData['customer_id'] as DocumentReference?;
    _dateTime = snapshotData['date_time'] as DateTime?;
    _peopleNumber = castToType<int>(snapshotData['people_number']);
    _note = snapshotData['note'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservations');

  static Stream<ReservationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationsRecord.fromSnapshot(s));

  static Future<ReservationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationsRecord.fromSnapshot(s));

  static ReservationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationsRecordData({
  DocumentReference? facilityId,
  DocumentReference? customerId,
  DateTime? dateTime,
  int? peopleNumber,
  String? note,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'facility_id': facilityId,
      'customer_id': customerId,
      'date_time': dateTime,
      'people_number': peopleNumber,
      'note': note,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationsRecordDocumentEquality
    implements Equality<ReservationsRecord> {
  const ReservationsRecordDocumentEquality();

  @override
  bool equals(ReservationsRecord? e1, ReservationsRecord? e2) {
    return e1?.facilityId == e2?.facilityId &&
        e1?.customerId == e2?.customerId &&
        e1?.dateTime == e2?.dateTime &&
        e1?.peopleNumber == e2?.peopleNumber &&
        e1?.note == e2?.note;
  }

  @override
  int hash(ReservationsRecord? e) => const ListEquality().hash(
      [e?.facilityId, e?.customerId, e?.dateTime, e?.peopleNumber, e?.note]);

  @override
  bool isValidKey(Object? o) => o is ReservationsRecord;
}
