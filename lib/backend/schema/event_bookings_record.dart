import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventBookingsRecord extends FirestoreRecord {
  EventBookingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "number_of_people" field.
  int? _numberOfPeople;
  int get numberOfPeople => _numberOfPeople ?? 0;
  bool hasNumberOfPeople() => _numberOfPeople != null;

  // "additional_guests" field.
  List<String>? _additionalGuests;
  List<String> get additionalGuests => _additionalGuests ?? const [];
  bool hasAdditionalGuests() => _additionalGuests != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "booked_at" field.
  DateTime? _bookedAt;
  DateTime? get bookedAt => _bookedAt;
  bool hasBookedAt() => _bookedAt != null;

  void _initializeFields() {
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _fullName = snapshotData['full_name'] as String?;
    _email = snapshotData['email'] as String?;
    _phone = snapshotData['phone'] as String?;
    _numberOfPeople = castToType<int>(snapshotData['number_of_people']);
    _additionalGuests = getDataList(snapshotData['additional_guests']);
    _totalPrice = castToType<double>(snapshotData['total_price']);
    _bookedAt = snapshotData['booked_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event_bookings');

  static Stream<EventBookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventBookingsRecord.fromSnapshot(s));

  static Future<EventBookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventBookingsRecord.fromSnapshot(s));

  static EventBookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventBookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventBookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventBookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventBookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventBookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventBookingsRecordData({
  DocumentReference? eventRef,
  DocumentReference? userId,
  String? fullName,
  String? email,
  String? phone,
  int? numberOfPeople,
  double? totalPrice,
  DateTime? bookedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_ref': eventRef,
      'user_id': userId,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'number_of_people': numberOfPeople,
      'total_price': totalPrice,
      'booked_at': bookedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventBookingsRecordDocumentEquality
    implements Equality<EventBookingsRecord> {
  const EventBookingsRecordDocumentEquality();

  @override
  bool equals(EventBookingsRecord? e1, EventBookingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.eventRef == e2?.eventRef &&
        e1?.userId == e2?.userId &&
        e1?.fullName == e2?.fullName &&
        e1?.email == e2?.email &&
        e1?.phone == e2?.phone &&
        e1?.numberOfPeople == e2?.numberOfPeople &&
        listEquality.equals(e1?.additionalGuests, e2?.additionalGuests) &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.bookedAt == e2?.bookedAt;
  }

  @override
  int hash(EventBookingsRecord? e) => const ListEquality().hash([
        e?.eventRef,
        e?.userId,
        e?.fullName,
        e?.email,
        e?.phone,
        e?.numberOfPeople,
        e?.additionalGuests,
        e?.totalPrice,
        e?.bookedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is EventBookingsRecord;
}
