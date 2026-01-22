import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectsRecord extends FirestoreRecord {
  ProjectsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "project_name" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  bool hasProjectName() => _projectName != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "project_description" field.
  String? _projectDescription;
  String get projectDescription => _projectDescription ?? '';
  bool hasProjectDescription() => _projectDescription != null;

  // "project_starting_date" field.
  DateTime? _projectStartingDate;
  DateTime? get projectStartingDate => _projectStartingDate;
  bool hasProjectStartingDate() => _projectStartingDate != null;

  // "project_delivery_date" field.
  DateTime? _projectDeliveryDate;
  DateTime? get projectDeliveryDate => _projectDeliveryDate;
  bool hasProjectDeliveryDate() => _projectDeliveryDate != null;

  // "project_images" field.
  List<String>? _projectImages;
  List<String> get projectImages => _projectImages ?? const [];
  bool hasProjectImages() => _projectImages != null;

  // "project_price" field.
  String? _projectPrice;
  String get projectPrice => _projectPrice ?? '';
  bool hasProjectPrice() => _projectPrice != null;

  // "project_360" field.
  String? _project360;
  String get project360 => _project360 ?? '';
  bool hasProject360() => _project360 != null;

  // "project_catalog" field.
  String? _projectCatalog;
  String get projectCatalog => _projectCatalog ?? '';
  bool hasProjectCatalog() => _projectCatalog != null;

  // "project_location" field.
  String? _projectLocation;
  String get projectLocation => _projectLocation ?? '';
  bool hasProjectLocation() => _projectLocation != null;

  // "project_website" field.
  String? _projectWebsite;
  String get projectWebsite => _projectWebsite ?? '';
  bool hasProjectWebsite() => _projectWebsite != null;

  // "project_call" field.
  String? _projectCall;
  String get projectCall => _projectCall ?? '';
  bool hasProjectCall() => _projectCall != null;

  // "project_units" field.
  int? _projectUnits;
  int get projectUnits => _projectUnits ?? 0;
  bool hasProjectUnits() => _projectUnits != null;

  // "project_map" field.
  String? _projectMap;
  String get projectMap => _projectMap ?? '';
  bool hasProjectMap() => _projectMap != null;

  // "project_video" field.
  String? _projectVideo;
  String get projectVideo => _projectVideo ?? '';
  bool hasProjectVideo() => _projectVideo != null;

  // "project_status" field.
  int? _projectStatus;
  int get projectStatus => _projectStatus ?? 0;
  bool hasProjectStatus() => _projectStatus != null;

  // "project_youtube" field.
  String? _projectYoutube;
  String get projectYoutube => _projectYoutube ?? '';
  bool hasProjectYoutube() => _projectYoutube != null;

  // "project_cover_image" field.
  String? _projectCoverImage;
  String get projectCoverImage => _projectCoverImage ?? '';
  bool hasProjectCoverImage() => _projectCoverImage != null;

  // "project_key_features" field.
  List<String>? _projectKeyFeatures;
  List<String> get projectKeyFeatures => _projectKeyFeatures ?? const [];
  bool hasProjectKeyFeatures() => _projectKeyFeatures != null;

  // "project_amenities" field.
  List<String>? _projectAmenities;
  List<String> get projectAmenities => _projectAmenities ?? const [];
  bool hasProjectAmenities() => _projectAmenities != null;

  void _initializeFields() {
    _projectName = snapshotData['project_name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _projectDescription = snapshotData['project_description'] as String?;
    _projectStartingDate = snapshotData['project_starting_date'] as DateTime?;
    _projectDeliveryDate = snapshotData['project_delivery_date'] as DateTime?;
    _projectImages = getDataList(snapshotData['project_images']);
    _projectPrice = snapshotData['project_price'] as String?;
    _project360 = snapshotData['project_360'] as String?;
    _projectCatalog = snapshotData['project_catalog'] as String?;
    _projectLocation = snapshotData['project_location'] as String?;
    _projectWebsite = snapshotData['project_website'] as String?;
    _projectCall = snapshotData['project_call'] as String?;
    _projectUnits = castToType<int>(snapshotData['project_units']);
    _projectMap = snapshotData['project_map'] as String?;
    _projectVideo = snapshotData['project_video'] as String?;
    _projectStatus = castToType<int>(snapshotData['project_status']);
    _projectYoutube = snapshotData['project_youtube'] as String?;
    _projectCoverImage = snapshotData['project_cover_image'] as String?;
    _projectKeyFeatures = getDataList(snapshotData['project_key_features']);
    _projectAmenities = getDataList(snapshotData['project_amenities']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projects');

  static Stream<ProjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectsRecord.fromSnapshot(s));

  static Future<ProjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectsRecord.fromSnapshot(s));

  static ProjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectsRecordData({
  String? projectName,
  DateTime? createdAt,
  String? projectDescription,
  DateTime? projectStartingDate,
  DateTime? projectDeliveryDate,
  String? projectPrice,
  String? project360,
  String? projectCatalog,
  String? projectLocation,
  String? projectWebsite,
  String? projectCall,
  int? projectUnits,
  String? projectMap,
  String? projectVideo,
  int? projectStatus,
  String? projectYoutube,
  String? projectCoverImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'project_name': projectName,
      'created_at': createdAt,
      'project_description': projectDescription,
      'project_starting_date': projectStartingDate,
      'project_delivery_date': projectDeliveryDate,
      'project_price': projectPrice,
      'project_360': project360,
      'project_catalog': projectCatalog,
      'project_location': projectLocation,
      'project_website': projectWebsite,
      'project_call': projectCall,
      'project_units': projectUnits,
      'project_map': projectMap,
      'project_video': projectVideo,
      'project_status': projectStatus,
      'project_youtube': projectYoutube,
      'project_cover_image': projectCoverImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectsRecordDocumentEquality implements Equality<ProjectsRecord> {
  const ProjectsRecordDocumentEquality();

  @override
  bool equals(ProjectsRecord? e1, ProjectsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.projectName == e2?.projectName &&
        e1?.createdAt == e2?.createdAt &&
        e1?.projectDescription == e2?.projectDescription &&
        e1?.projectStartingDate == e2?.projectStartingDate &&
        e1?.projectDeliveryDate == e2?.projectDeliveryDate &&
        listEquality.equals(e1?.projectImages, e2?.projectImages) &&
        e1?.projectPrice == e2?.projectPrice &&
        e1?.project360 == e2?.project360 &&
        e1?.projectCatalog == e2?.projectCatalog &&
        e1?.projectLocation == e2?.projectLocation &&
        e1?.projectWebsite == e2?.projectWebsite &&
        e1?.projectCall == e2?.projectCall &&
        e1?.projectUnits == e2?.projectUnits &&
        e1?.projectMap == e2?.projectMap &&
        e1?.projectVideo == e2?.projectVideo &&
        e1?.projectStatus == e2?.projectStatus &&
        e1?.projectYoutube == e2?.projectYoutube &&
        e1?.projectCoverImage == e2?.projectCoverImage &&
        listEquality.equals(e1?.projectKeyFeatures, e2?.projectKeyFeatures) &&
        listEquality.equals(e1?.projectAmenities, e2?.projectAmenities);
  }

  @override
  int hash(ProjectsRecord? e) => const ListEquality().hash([
        e?.projectName,
        e?.createdAt,
        e?.projectDescription,
        e?.projectStartingDate,
        e?.projectDeliveryDate,
        e?.projectImages,
        e?.projectPrice,
        e?.project360,
        e?.projectCatalog,
        e?.projectLocation,
        e?.projectWebsite,
        e?.projectCall,
        e?.projectUnits,
        e?.projectMap,
        e?.projectVideo,
        e?.projectStatus,
        e?.projectYoutube,
        e?.projectCoverImage,
        e?.projectKeyFeatures,
        e?.projectAmenities
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectsRecord;
}
