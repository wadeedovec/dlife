import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DevicesRecord extends FirestoreRecord {
  DevicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_device" field.
  DocumentReference? _userDevice;
  DocumentReference? get userDevice => _userDevice;
  bool hasUserDevice() => _userDevice != null;

  // "device_info" field.
  String? _deviceInfo;
  String get deviceInfo => _deviceInfo ?? '';
  bool hasDeviceInfo() => _deviceInfo != null;

  void _initializeFields() {
    _userDevice = snapshotData['user_device'] as DocumentReference?;
    _deviceInfo = snapshotData['device_info'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('devices');

  static Stream<DevicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DevicesRecord.fromSnapshot(s));

  static Future<DevicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DevicesRecord.fromSnapshot(s));

  static DevicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DevicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DevicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DevicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DevicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DevicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDevicesRecordData({
  DocumentReference? userDevice,
  String? deviceInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_device': userDevice,
      'device_info': deviceInfo,
    }.withoutNulls,
  );

  return firestoreData;
}

class DevicesRecordDocumentEquality implements Equality<DevicesRecord> {
  const DevicesRecordDocumentEquality();

  @override
  bool equals(DevicesRecord? e1, DevicesRecord? e2) {
    return e1?.userDevice == e2?.userDevice && e1?.deviceInfo == e2?.deviceInfo;
  }

  @override
  int hash(DevicesRecord? e) =>
      const ListEquality().hash([e?.userDevice, e?.deviceInfo]);

  @override
  bool isValidKey(Object? o) => o is DevicesRecord;
}
