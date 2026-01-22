import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlocksRecord extends FirestoreRecord {
  BlocksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "block_name" field.
  String? _blockName;
  String get blockName => _blockName ?? '';
  bool hasBlockName() => _blockName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _blockName = snapshotData['block_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('blocks')
          : FirebaseFirestore.instance.collectionGroup('blocks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('blocks').doc(id);

  static Stream<BlocksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlocksRecord.fromSnapshot(s));

  static Future<BlocksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlocksRecord.fromSnapshot(s));

  static BlocksRecord fromSnapshot(DocumentSnapshot snapshot) => BlocksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlocksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlocksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlocksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlocksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlocksRecordData({
  String? blockName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'block_name': blockName,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlocksRecordDocumentEquality implements Equality<BlocksRecord> {
  const BlocksRecordDocumentEquality();

  @override
  bool equals(BlocksRecord? e1, BlocksRecord? e2) {
    return e1?.blockName == e2?.blockName;
  }

  @override
  int hash(BlocksRecord? e) => const ListEquality().hash([e?.blockName]);

  @override
  bool isValidKey(Object? o) => o is BlocksRecord;
}
