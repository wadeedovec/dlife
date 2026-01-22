import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "role" field.
  int? _role;
  int get role => _role ?? 0;
  bool hasRole() => _role != null;

  // "push_notification" field.
  int? _pushNotification;
  int get pushNotification => _pushNotification ?? 0;
  bool hasPushNotification() => _pushNotification != null;

  // "location_permission" field.
  int? _locationPermission;
  int get locationPermission => _locationPermission ?? 0;
  bool hasLocationPermission() => _locationPermission != null;

  // "receive_email" field.
  int? _receiveEmail;
  int get receiveEmail => _receiveEmail ?? 0;
  bool hasReceiveEmail() => _receiveEmail != null;

  // "preferred_language" field.
  String? _preferredLanguage;
  String get preferredLanguage => _preferredLanguage ?? '';
  bool hasPreferredLanguage() => _preferredLanguage != null;

  // "company_id" field.
  DocumentReference? _companyId;
  DocumentReference? get companyId => _companyId;
  bool hasCompanyId() => _companyId != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "birth_date" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  bool hasBirthDate() => _birthDate != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _status = castToType<int>(snapshotData['status']);
    _role = castToType<int>(snapshotData['role']);
    _pushNotification = castToType<int>(snapshotData['push_notification']);
    _locationPermission = castToType<int>(snapshotData['location_permission']);
    _receiveEmail = castToType<int>(snapshotData['receive_email']);
    _preferredLanguage = snapshotData['preferred_language'] as String?;
    _companyId = snapshotData['company_id'] as DocumentReference?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _birthDate = snapshotData['birth_date'] as DateTime?;
    _address = snapshotData['address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? status,
  int? role,
  int? pushNotification,
  int? locationPermission,
  int? receiveEmail,
  String? preferredLanguage,
  DocumentReference? companyId,
  String? firstName,
  String? lastName,
  DateTime? birthDate,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'status': status,
      'role': role,
      'push_notification': pushNotification,
      'location_permission': locationPermission,
      'receive_email': receiveEmail,
      'preferred_language': preferredLanguage,
      'company_id': companyId,
      'first_name': firstName,
      'last_name': lastName,
      'birth_date': birthDate,
      'address': address,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.status == e2?.status &&
        e1?.role == e2?.role &&
        e1?.pushNotification == e2?.pushNotification &&
        e1?.locationPermission == e2?.locationPermission &&
        e1?.receiveEmail == e2?.receiveEmail &&
        e1?.preferredLanguage == e2?.preferredLanguage &&
        e1?.companyId == e2?.companyId &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.birthDate == e2?.birthDate &&
        e1?.address == e2?.address;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.status,
        e?.role,
        e?.pushNotification,
        e?.locationPermission,
        e?.receiveEmail,
        e?.preferredLanguage,
        e?.companyId,
        e?.firstName,
        e?.lastName,
        e?.birthDate,
        e?.address
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
