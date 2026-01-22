import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentsRecord extends FirestoreRecord {
  DocumentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "file_url" field.
  String? _fileUrl;
  String get fileUrl => _fileUrl ?? '';
  bool hasFileUrl() => _fileUrl != null;

  // "added_at" field.
  DateTime? _addedAt;
  DateTime? get addedAt => _addedAt;
  bool hasAddedAt() => _addedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _fileUrl = snapshotData['file_url'] as String?;
    _addedAt = snapshotData['added_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('documents')
          : FirebaseFirestore.instance.collectionGroup('documents');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('documents').doc(id);

  static Stream<DocumentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocumentsRecord.fromSnapshot(s));

  static Future<DocumentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocumentsRecord.fromSnapshot(s));

  static DocumentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocumentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocumentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocumentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocumentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocumentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocumentsRecordData({
  String? title,
  String? fileUrl,
  DateTime? addedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'file_url': fileUrl,
      'added_at': addedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocumentsRecordDocumentEquality implements Equality<DocumentsRecord> {
  const DocumentsRecordDocumentEquality();

  @override
  bool equals(DocumentsRecord? e1, DocumentsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.fileUrl == e2?.fileUrl &&
        e1?.addedAt == e2?.addedAt;
  }

  @override
  int hash(DocumentsRecord? e) =>
      const ListEquality().hash([e?.title, e?.fileUrl, e?.addedAt]);

  @override
  bool isValidKey(Object? o) => o is DocumentsRecord;
}
