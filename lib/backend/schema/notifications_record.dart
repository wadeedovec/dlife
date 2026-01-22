import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "noti_title" field.
  String? _notiTitle;
  String get notiTitle => _notiTitle ?? '';
  bool hasNotiTitle() => _notiTitle != null;

  // "noti_text" field.
  String? _notiText;
  String get notiText => _notiText ?? '';
  bool hasNotiText() => _notiText != null;

  // "noti_status" field.
  int? _notiStatus;
  int get notiStatus => _notiStatus ?? 0;
  bool hasNotiStatus() => _notiStatus != null;

  // "noti_user" field.
  DocumentReference? _notiUser;
  DocumentReference? get notiUser => _notiUser;
  bool hasNotiUser() => _notiUser != null;

  // "noti_create_time" field.
  DateTime? _notiCreateTime;
  DateTime? get notiCreateTime => _notiCreateTime;
  bool hasNotiCreateTime() => _notiCreateTime != null;

  // "noti_picture" field.
  String? _notiPicture;
  String get notiPicture => _notiPicture ?? '';
  bool hasNotiPicture() => _notiPicture != null;

  // "noti_page" field.
  int? _notiPage;
  int get notiPage => _notiPage ?? 0;
  bool hasNotiPage() => _notiPage != null;

  // "noti_page_id" field.
  String? _notiPageId;
  String get notiPageId => _notiPageId ?? '';
  bool hasNotiPageId() => _notiPageId != null;

  void _initializeFields() {
    _notiTitle = snapshotData['noti_title'] as String?;
    _notiText = snapshotData['noti_text'] as String?;
    _notiStatus = castToType<int>(snapshotData['noti_status']);
    _notiUser = snapshotData['noti_user'] as DocumentReference?;
    _notiCreateTime = snapshotData['noti_create_time'] as DateTime?;
    _notiPicture = snapshotData['noti_picture'] as String?;
    _notiPage = castToType<int>(snapshotData['noti_page']);
    _notiPageId = snapshotData['noti_page_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? notiTitle,
  String? notiText,
  int? notiStatus,
  DocumentReference? notiUser,
  DateTime? notiCreateTime,
  String? notiPicture,
  int? notiPage,
  String? notiPageId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'noti_title': notiTitle,
      'noti_text': notiText,
      'noti_status': notiStatus,
      'noti_user': notiUser,
      'noti_create_time': notiCreateTime,
      'noti_picture': notiPicture,
      'noti_page': notiPage,
      'noti_page_id': notiPageId,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.notiTitle == e2?.notiTitle &&
        e1?.notiText == e2?.notiText &&
        e1?.notiStatus == e2?.notiStatus &&
        e1?.notiUser == e2?.notiUser &&
        e1?.notiCreateTime == e2?.notiCreateTime &&
        e1?.notiPicture == e2?.notiPicture &&
        e1?.notiPage == e2?.notiPage &&
        e1?.notiPageId == e2?.notiPageId;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.notiTitle,
        e?.notiText,
        e?.notiStatus,
        e?.notiUser,
        e?.notiCreateTime,
        e?.notiPicture,
        e?.notiPage,
        e?.notiPageId
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
