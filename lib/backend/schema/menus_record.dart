import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenusRecord extends FirestoreRecord {
  MenusRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "menu_category_name" field.
  String? _menuCategoryName;
  String get menuCategoryName => _menuCategoryName ?? '';
  bool hasMenuCategoryName() => _menuCategoryName != null;

  // "menu_category_status" field.
  bool? _menuCategoryStatus;
  bool get menuCategoryStatus => _menuCategoryStatus ?? false;
  bool hasMenuCategoryStatus() => _menuCategoryStatus != null;

  // "menu_picture" field.
  String? _menuPicture;
  String get menuPicture => _menuPicture ?? '';
  bool hasMenuPicture() => _menuPicture != null;

  // "sort_order" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  bool hasSortOrder() => _sortOrder != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _menuCategoryName = snapshotData['menu_category_name'] as String?;
    _menuCategoryStatus = snapshotData['menu_category_status'] as bool?;
    _menuPicture = snapshotData['menu_picture'] as String?;
    _sortOrder = castToType<int>(snapshotData['sort_order']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('menus')
          : FirebaseFirestore.instance.collectionGroup('menus');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('menus').doc(id);

  static Stream<MenusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenusRecord.fromSnapshot(s));

  static Future<MenusRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenusRecord.fromSnapshot(s));

  static MenusRecord fromSnapshot(DocumentSnapshot snapshot) => MenusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenusRecordData({
  String? menuCategoryName,
  bool? menuCategoryStatus,
  String? menuPicture,
  int? sortOrder,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'menu_category_name': menuCategoryName,
      'menu_category_status': menuCategoryStatus,
      'menu_picture': menuPicture,
      'sort_order': sortOrder,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenusRecordDocumentEquality implements Equality<MenusRecord> {
  const MenusRecordDocumentEquality();

  @override
  bool equals(MenusRecord? e1, MenusRecord? e2) {
    return e1?.menuCategoryName == e2?.menuCategoryName &&
        e1?.menuCategoryStatus == e2?.menuCategoryStatus &&
        e1?.menuPicture == e2?.menuPicture &&
        e1?.sortOrder == e2?.sortOrder;
  }

  @override
  int hash(MenusRecord? e) => const ListEquality().hash([
        e?.menuCategoryName,
        e?.menuCategoryStatus,
        e?.menuPicture,
        e?.sortOrder
      ]);

  @override
  bool isValidKey(Object? o) => o is MenusRecord;
}
