import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaintenanceRequestsRecord extends FirestoreRecord {
  MaintenanceRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "my_property_id" field.
  DocumentReference? _myPropertyId;
  DocumentReference? get myPropertyId => _myPropertyId;
  bool hasMyPropertyId() => _myPropertyId != null;

  // "property_id" field.
  DocumentReference? _propertyId;
  DocumentReference? get propertyId => _propertyId;
  bool hasPropertyId() => _propertyId != null;

  // "property_name" field.
  String? _propertyName;
  String get propertyName => _propertyName ?? '';
  bool hasPropertyName() => _propertyName != null;

  // "issue_category" field.
  String? _issueCategory;

  /// "Plumbing", "Electricity", etc.
  String get issueCategory => _issueCategory ?? '';
  bool hasIssueCategory() => _issueCategory != null;

  // "priority" field.
  String? _priority;

  /// "Low", "Medium", "Urgent"
  String get priority => _priority ?? '';
  bool hasPriority() => _priority != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "location_in_unit" field.
  String? _locationInUnit;
  String get locationInUnit => _locationInUnit ?? '';
  bool hasLocationInUnit() => _locationInUnit != null;

  // "attachments" field.
  List<String>? _attachments;
  List<String> get attachments => _attachments ?? const [];
  bool hasAttachments() => _attachments != null;

  // "status" field.
  String? _status;

  /// "pending", "in_progress", "resolved", "rejected","scheduled"
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "submitted_at" field.
  DateTime? _submittedAt;
  DateTime? get submittedAt => _submittedAt;
  bool hasSubmittedAt() => _submittedAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "resolution_notes" field.
  String? _resolutionNotes;
  String get resolutionNotes => _resolutionNotes ?? '';
  bool hasResolutionNotes() => _resolutionNotes != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "handled_by" field.
  String? _handledBy;
  String get handledBy => _handledBy ?? '';
  bool hasHandledBy() => _handledBy != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _myPropertyId = snapshotData['my_property_id'] as DocumentReference?;
    _propertyId = snapshotData['property_id'] as DocumentReference?;
    _propertyName = snapshotData['property_name'] as String?;
    _issueCategory = snapshotData['issue_category'] as String?;
    _priority = snapshotData['priority'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _locationInUnit = snapshotData['location_in_unit'] as String?;
    _attachments = getDataList(snapshotData['attachments']);
    _status = snapshotData['status'] as String?;
    _submittedAt = snapshotData['submitted_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _resolutionNotes = snapshotData['resolution_notes'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _handledBy = snapshotData['handled_by'] as String?;
    _duration = snapshotData['duration'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('maintenance_requests');

  static Stream<MaintenanceRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaintenanceRequestsRecord.fromSnapshot(s));

  static Future<MaintenanceRequestsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MaintenanceRequestsRecord.fromSnapshot(s));

  static MaintenanceRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaintenanceRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaintenanceRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaintenanceRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaintenanceRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaintenanceRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaintenanceRequestsRecordData({
  DocumentReference? userId,
  DocumentReference? myPropertyId,
  DocumentReference? propertyId,
  String? propertyName,
  String? issueCategory,
  String? priority,
  String? title,
  String? description,
  String? locationInUnit,
  String? status,
  DateTime? submittedAt,
  DateTime? updatedAt,
  String? resolutionNotes,
  double? price,
  String? handledBy,
  String? duration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'my_property_id': myPropertyId,
      'property_id': propertyId,
      'property_name': propertyName,
      'issue_category': issueCategory,
      'priority': priority,
      'title': title,
      'description': description,
      'location_in_unit': locationInUnit,
      'status': status,
      'submitted_at': submittedAt,
      'updated_at': updatedAt,
      'resolution_notes': resolutionNotes,
      'price': price,
      'handled_by': handledBy,
      'duration': duration,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaintenanceRequestsRecordDocumentEquality
    implements Equality<MaintenanceRequestsRecord> {
  const MaintenanceRequestsRecordDocumentEquality();

  @override
  bool equals(MaintenanceRequestsRecord? e1, MaintenanceRequestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.myPropertyId == e2?.myPropertyId &&
        e1?.propertyId == e2?.propertyId &&
        e1?.propertyName == e2?.propertyName &&
        e1?.issueCategory == e2?.issueCategory &&
        e1?.priority == e2?.priority &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.locationInUnit == e2?.locationInUnit &&
        listEquality.equals(e1?.attachments, e2?.attachments) &&
        e1?.status == e2?.status &&
        e1?.submittedAt == e2?.submittedAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.resolutionNotes == e2?.resolutionNotes &&
        e1?.price == e2?.price &&
        e1?.handledBy == e2?.handledBy &&
        e1?.duration == e2?.duration;
  }

  @override
  int hash(MaintenanceRequestsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.myPropertyId,
        e?.propertyId,
        e?.propertyName,
        e?.issueCategory,
        e?.priority,
        e?.title,
        e?.description,
        e?.locationInUnit,
        e?.attachments,
        e?.status,
        e?.submittedAt,
        e?.updatedAt,
        e?.resolutionNotes,
        e?.price,
        e?.handledBy,
        e?.duration
      ]);

  @override
  bool isValidKey(Object? o) => o is MaintenanceRequestsRecord;
}
