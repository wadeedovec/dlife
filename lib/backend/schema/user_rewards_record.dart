import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRewardsRecord extends FirestoreRecord {
  UserRewardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "reward_id" field.
  DocumentReference? _rewardId;
  DocumentReference? get rewardId => _rewardId;
  bool hasRewardId() => _rewardId != null;

  // "status" field.
  String? _status;

  /// "redeemed" | "used"
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "redeemed_at" field.
  DateTime? _redeemedAt;
  DateTime? get redeemedAt => _redeemedAt;
  bool hasRedeemedAt() => _redeemedAt != null;

  // "facility_id" field.
  DocumentReference? _facilityId;
  DocumentReference? get facilityId => _facilityId;
  bool hasFacilityId() => _facilityId != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _rewardId = snapshotData['reward_id'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _redeemedAt = snapshotData['redeemed_at'] as DateTime?;
    _facilityId = snapshotData['facility_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_rewards');

  static Stream<UserRewardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRewardsRecord.fromSnapshot(s));

  static Future<UserRewardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRewardsRecord.fromSnapshot(s));

  static UserRewardsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserRewardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRewardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRewardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRewardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRewardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRewardsRecordData({
  DocumentReference? userId,
  DocumentReference? rewardId,
  String? status,
  DateTime? redeemedAt,
  DocumentReference? facilityId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'reward_id': rewardId,
      'status': status,
      'redeemed_at': redeemedAt,
      'facility_id': facilityId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRewardsRecordDocumentEquality implements Equality<UserRewardsRecord> {
  const UserRewardsRecordDocumentEquality();

  @override
  bool equals(UserRewardsRecord? e1, UserRewardsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.rewardId == e2?.rewardId &&
        e1?.status == e2?.status &&
        e1?.redeemedAt == e2?.redeemedAt &&
        e1?.facilityId == e2?.facilityId;
  }

  @override
  int hash(UserRewardsRecord? e) => const ListEquality()
      .hash([e?.userId, e?.rewardId, e?.status, e?.redeemedAt, e?.facilityId]);

  @override
  bool isValidKey(Object? o) => o is UserRewardsRecord;
}
