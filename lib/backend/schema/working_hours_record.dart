import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkingHoursRecord extends FirestoreRecord {
  WorkingHoursRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "open_time" field.
  String? _openTime;
  String get openTime => _openTime ?? '';
  bool hasOpenTime() => _openTime != null;

  // "close_time" field.
  String? _closeTime;
  String get closeTime => _closeTime ?? '';
  bool hasCloseTime() => _closeTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _day = snapshotData['day'] as String?;
    _openTime = snapshotData['open_time'] as String?;
    _closeTime = snapshotData['close_time'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('working_hours')
          : FirebaseFirestore.instance.collectionGroup('working_hours');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('working_hours').doc(id);

  static Stream<WorkingHoursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkingHoursRecord.fromSnapshot(s));

  static Future<WorkingHoursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkingHoursRecord.fromSnapshot(s));

  static WorkingHoursRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkingHoursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkingHoursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkingHoursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkingHoursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkingHoursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkingHoursRecordData({
  String? day,
  String? openTime,
  String? closeTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
      'open_time': openTime,
      'close_time': closeTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkingHoursRecordDocumentEquality
    implements Equality<WorkingHoursRecord> {
  const WorkingHoursRecordDocumentEquality();

  @override
  bool equals(WorkingHoursRecord? e1, WorkingHoursRecord? e2) {
    return e1?.day == e2?.day &&
        e1?.openTime == e2?.openTime &&
        e1?.closeTime == e2?.closeTime;
  }

  @override
  int hash(WorkingHoursRecord? e) =>
      const ListEquality().hash([e?.day, e?.openTime, e?.closeTime]);

  @override
  bool isValidKey(Object? o) => o is WorkingHoursRecord;
}
