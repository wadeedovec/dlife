import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FacilitiesRecord extends FirestoreRecord {
  FacilitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "facility_name" field.
  String? _facilityName;
  String get facilityName => _facilityName ?? '';
  bool hasFacilityName() => _facilityName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "facility_status" field.
  int? _facilityStatus;
  int get facilityStatus => _facilityStatus ?? 0;
  bool hasFacilityStatus() => _facilityStatus != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "facility_location" field.
  String? _facilityLocation;
  String get facilityLocation => _facilityLocation ?? '';
  bool hasFacilityLocation() => _facilityLocation != null;

  // "facility_status_now" field.
  int? _facilityStatusNow;
  int get facilityStatusNow => _facilityStatusNow ?? 0;
  bool hasFacilityStatusNow() => _facilityStatusNow != null;

  // "facility_map" field.
  String? _facilityMap;
  String get facilityMap => _facilityMap ?? '';
  bool hasFacilityMap() => _facilityMap != null;

  // "facility_phone" field.
  String? _facilityPhone;
  String get facilityPhone => _facilityPhone ?? '';
  bool hasFacilityPhone() => _facilityPhone != null;

  // "facility_file" field.
  String? _facilityFile;
  String get facilityFile => _facilityFile ?? '';
  bool hasFacilityFile() => _facilityFile != null;

  // "facility_images" field.
  List<String>? _facilityImages;
  List<String> get facilityImages => _facilityImages ?? const [];
  bool hasFacilityImages() => _facilityImages != null;

  // "facility_category" field.
  String? _facilityCategory;
  String get facilityCategory => _facilityCategory ?? '';
  bool hasFacilityCategory() => _facilityCategory != null;

  // "parentId" field.
  DocumentReference? _parentId;
  DocumentReference? get parentId => _parentId;
  bool hasParentId() => _parentId != null;

  // "restaurant_type" field.
  String? _restaurantType;
  String get restaurantType => _restaurantType ?? '';
  bool hasRestaurantType() => _restaurantType != null;

  // "capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  // "open_at" field.
  String? _openAt;
  String get openAt => _openAt ?? '';
  bool hasOpenAt() => _openAt != null;

  // "close_at" field.
  String? _closeAt;
  String get closeAt => _closeAt ?? '';
  bool hasCloseAt() => _closeAt != null;

  // "facility_tags" field.
  List<String>? _facilityTags;
  List<String> get facilityTags => _facilityTags ?? const [];
  bool hasFacilityTags() => _facilityTags != null;

  void _initializeFields() {
    _facilityName = snapshotData['facility_name'] as String?;
    _description = snapshotData['description'] as String?;
    _facilityStatus = castToType<int>(snapshotData['facility_status']);
    _logo = snapshotData['logo'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _facilityLocation = snapshotData['facility_location'] as String?;
    _facilityStatusNow = castToType<int>(snapshotData['facility_status_now']);
    _facilityMap = snapshotData['facility_map'] as String?;
    _facilityPhone = snapshotData['facility_phone'] as String?;
    _facilityFile = snapshotData['facility_file'] as String?;
    _facilityImages = getDataList(snapshotData['facility_images']);
    _facilityCategory = snapshotData['facility_category'] as String?;
    _parentId = snapshotData['parentId'] as DocumentReference?;
    _restaurantType = snapshotData['restaurant_type'] as String?;
    _capacity = castToType<int>(snapshotData['capacity']);
    _openAt = snapshotData['open_at'] as String?;
    _closeAt = snapshotData['close_at'] as String?;
    _facilityTags = getDataList(snapshotData['facility_tags']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('facilities');

  static Stream<FacilitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FacilitiesRecord.fromSnapshot(s));

  static Future<FacilitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FacilitiesRecord.fromSnapshot(s));

  static FacilitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FacilitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FacilitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FacilitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FacilitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FacilitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFacilitiesRecordData({
  String? facilityName,
  String? description,
  int? facilityStatus,
  String? logo,
  DateTime? createdTime,
  String? facilityLocation,
  int? facilityStatusNow,
  String? facilityMap,
  String? facilityPhone,
  String? facilityFile,
  String? facilityCategory,
  DocumentReference? parentId,
  String? restaurantType,
  int? capacity,
  String? openAt,
  String? closeAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'facility_name': facilityName,
      'description': description,
      'facility_status': facilityStatus,
      'logo': logo,
      'created_time': createdTime,
      'facility_location': facilityLocation,
      'facility_status_now': facilityStatusNow,
      'facility_map': facilityMap,
      'facility_phone': facilityPhone,
      'facility_file': facilityFile,
      'facility_category': facilityCategory,
      'parentId': parentId,
      'restaurant_type': restaurantType,
      'capacity': capacity,
      'open_at': openAt,
      'close_at': closeAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class FacilitiesRecordDocumentEquality implements Equality<FacilitiesRecord> {
  const FacilitiesRecordDocumentEquality();

  @override
  bool equals(FacilitiesRecord? e1, FacilitiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.facilityName == e2?.facilityName &&
        e1?.description == e2?.description &&
        e1?.facilityStatus == e2?.facilityStatus &&
        e1?.logo == e2?.logo &&
        e1?.createdTime == e2?.createdTime &&
        e1?.facilityLocation == e2?.facilityLocation &&
        e1?.facilityStatusNow == e2?.facilityStatusNow &&
        e1?.facilityMap == e2?.facilityMap &&
        e1?.facilityPhone == e2?.facilityPhone &&
        e1?.facilityFile == e2?.facilityFile &&
        listEquality.equals(e1?.facilityImages, e2?.facilityImages) &&
        e1?.facilityCategory == e2?.facilityCategory &&
        e1?.parentId == e2?.parentId &&
        e1?.restaurantType == e2?.restaurantType &&
        e1?.capacity == e2?.capacity &&
        e1?.openAt == e2?.openAt &&
        e1?.closeAt == e2?.closeAt &&
        listEquality.equals(e1?.facilityTags, e2?.facilityTags);
  }

  @override
  int hash(FacilitiesRecord? e) => const ListEquality().hash([
        e?.facilityName,
        e?.description,
        e?.facilityStatus,
        e?.logo,
        e?.createdTime,
        e?.facilityLocation,
        e?.facilityStatusNow,
        e?.facilityMap,
        e?.facilityPhone,
        e?.facilityFile,
        e?.facilityImages,
        e?.facilityCategory,
        e?.parentId,
        e?.restaurantType,
        e?.capacity,
        e?.openAt,
        e?.closeAt,
        e?.facilityTags
      ]);

  @override
  bool isValidKey(Object? o) => o is FacilitiesRecord;
}
