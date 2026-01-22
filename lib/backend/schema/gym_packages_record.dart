import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GymPackagesRecord extends FirestoreRecord {
  GymPackagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "duration_display" field.
  String? _durationDisplay;
  String get durationDisplay => _durationDisplay ?? '';
  bool hasDurationDisplay() => _durationDisplay != null;

  // "total_months" field.
  int? _totalMonths;
  int get totalMonths => _totalMonths ?? 0;
  bool hasTotalMonths() => _totalMonths != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "features" field.
  List<String>? _features;
  List<String> get features => _features ?? const [];
  bool hasFeatures() => _features != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "sort_order" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  bool hasSortOrder() => _sortOrder != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _durationDisplay = snapshotData['duration_display'] as String?;
    _totalMonths = castToType<int>(snapshotData['total_months']);
    _price = castToType<double>(snapshotData['price']);
    _features = getDataList(snapshotData['features']);
    _tag = snapshotData['tag'] as String?;
    _isActive = snapshotData['is_active'] as bool?;
    _sortOrder = castToType<int>(snapshotData['sort_order']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _imageUrl = snapshotData['image_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gym_packages');

  static Stream<GymPackagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GymPackagesRecord.fromSnapshot(s));

  static Future<GymPackagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GymPackagesRecord.fromSnapshot(s));

  static GymPackagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GymPackagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GymPackagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GymPackagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GymPackagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GymPackagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGymPackagesRecordData({
  String? name,
  String? durationDisplay,
  int? totalMonths,
  double? price,
  String? tag,
  bool? isActive,
  int? sortOrder,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'duration_display': durationDisplay,
      'total_months': totalMonths,
      'price': price,
      'tag': tag,
      'is_active': isActive,
      'sort_order': sortOrder,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'image_url': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class GymPackagesRecordDocumentEquality implements Equality<GymPackagesRecord> {
  const GymPackagesRecordDocumentEquality();

  @override
  bool equals(GymPackagesRecord? e1, GymPackagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.durationDisplay == e2?.durationDisplay &&
        e1?.totalMonths == e2?.totalMonths &&
        e1?.price == e2?.price &&
        listEquality.equals(e1?.features, e2?.features) &&
        e1?.tag == e2?.tag &&
        e1?.isActive == e2?.isActive &&
        e1?.sortOrder == e2?.sortOrder &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.imageUrl == e2?.imageUrl;
  }

  @override
  int hash(GymPackagesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.durationDisplay,
        e?.totalMonths,
        e?.price,
        e?.features,
        e?.tag,
        e?.isActive,
        e?.sortOrder,
        e?.createdAt,
        e?.updatedAt,
        e?.imageUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is GymPackagesRecord;
}
