import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "start_time" field.
  String? _startTime;

  /// "12:00 PM"
  String get startTime => _startTime ?? '';
  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  String? _endTime;

  /// "11:00 PM"
  String get endTime => _endTime ?? '';
  bool hasEndTime() => _endTime != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "is_featured" field.
  bool? _isFeatured;
  bool get isFeatured => _isFeatured ?? false;
  bool hasIsFeatured() => _isFeatured != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "event_requirements" field.
  String? _eventRequirements;
  String get eventRequirements => _eventRequirements ?? '';
  bool hasEventRequirements() => _eventRequirements != null;

  // "event_id" field.
  String? _eventId;
  String get eventId => _eventId ?? '';
  bool hasEventId() => _eventId != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _startTime = snapshotData['start_time'] as String?;
    _endTime = snapshotData['end_time'] as String?;
    _location = snapshotData['location'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _capacity = castToType<int>(snapshotData['capacity']);
    _image = snapshotData['image'] as String?;
    _tags = getDataList(snapshotData['tags']);
    _isFeatured = snapshotData['is_featured'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _eventRequirements = snapshotData['event_requirements'] as String?;
    _eventId = snapshotData['event_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? title,
  String? description,
  DateTime? date,
  String? startTime,
  String? endTime,
  String? location,
  double? price,
  int? capacity,
  String? image,
  bool? isFeatured,
  DateTime? createdAt,
  String? eventRequirements,
  String? eventId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'date': date,
      'start_time': startTime,
      'end_time': endTime,
      'location': location,
      'price': price,
      'capacity': capacity,
      'image': image,
      'is_featured': isFeatured,
      'created_at': createdAt,
      'event_requirements': eventRequirements,
      'event_id': eventId,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.location == e2?.location &&
        e1?.price == e2?.price &&
        e1?.capacity == e2?.capacity &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.isFeatured == e2?.isFeatured &&
        e1?.createdAt == e2?.createdAt &&
        e1?.eventRequirements == e2?.eventRequirements &&
        e1?.eventId == e2?.eventId;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.date,
        e?.startTime,
        e?.endTime,
        e?.location,
        e?.price,
        e?.capacity,
        e?.image,
        e?.tags,
        e?.isFeatured,
        e?.createdAt,
        e?.eventRequirements,
        e?.eventId
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
