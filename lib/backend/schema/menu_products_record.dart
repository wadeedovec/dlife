import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuProductsRecord extends FirestoreRecord {
  MenuProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "isAvailable" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  bool hasIsAvailable() => _isAvailable != null;

  // "displayOrder" field.
  int? _displayOrder;
  int get displayOrder => _displayOrder ?? 0;
  bool hasDisplayOrder() => _displayOrder != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "menuId" field.
  DocumentReference? _menuId;
  DocumentReference? get menuId => _menuId;
  bool hasMenuId() => _menuId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _image = snapshotData['image'] as String?;
    _isAvailable = snapshotData['isAvailable'] as bool?;
    _displayOrder = castToType<int>(snapshotData['displayOrder']);
    _tags = getDataList(snapshotData['tags']);
    _menuId = snapshotData['menuId'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('menu_products')
          : FirebaseFirestore.instance.collectionGroup('menu_products');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('menu_products').doc(id);

  static Stream<MenuProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuProductsRecord.fromSnapshot(s));

  static Future<MenuProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuProductsRecord.fromSnapshot(s));

  static MenuProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MenuProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuProductsRecordData({
  String? name,
  String? description,
  double? price,
  String? image,
  bool? isAvailable,
  int? displayOrder,
  DocumentReference? menuId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'isAvailable': isAvailable,
      'displayOrder': displayOrder,
      'menuId': menuId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuProductsRecordDocumentEquality
    implements Equality<MenuProductsRecord> {
  const MenuProductsRecordDocumentEquality();

  @override
  bool equals(MenuProductsRecord? e1, MenuProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.image == e2?.image &&
        e1?.isAvailable == e2?.isAvailable &&
        e1?.displayOrder == e2?.displayOrder &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.menuId == e2?.menuId;
  }

  @override
  int hash(MenuProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.price,
        e?.image,
        e?.isAvailable,
        e?.displayOrder,
        e?.tags,
        e?.menuId
      ]);

  @override
  bool isValidKey(Object? o) => o is MenuProductsRecord;
}
