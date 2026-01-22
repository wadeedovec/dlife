import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WalletRecord extends FirestoreRecord {
  WalletRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_wallet" field.
  DocumentReference? _userWallet;
  DocumentReference? get userWallet => _userWallet;
  bool hasUserWallet() => _userWallet != null;

  // "wallet_amount" field.
  double? _walletAmount;
  double get walletAmount => _walletAmount ?? 0.0;
  bool hasWalletAmount() => _walletAmount != null;

  // "HC" field.
  String? _hc;
  String get hc => _hc ?? '';
  bool hasHc() => _hc != null;

  void _initializeFields() {
    _userWallet = snapshotData['user_wallet'] as DocumentReference?;
    _walletAmount = castToType<double>(snapshotData['wallet_amount']);
    _hc = snapshotData['HC'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wallet');

  static Stream<WalletRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WalletRecord.fromSnapshot(s));

  static Future<WalletRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WalletRecord.fromSnapshot(s));

  static WalletRecord fromSnapshot(DocumentSnapshot snapshot) => WalletRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WalletRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WalletRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WalletRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WalletRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWalletRecordData({
  DocumentReference? userWallet,
  double? walletAmount,
  String? hc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_wallet': userWallet,
      'wallet_amount': walletAmount,
      'HC': hc,
    }.withoutNulls,
  );

  return firestoreData;
}

class WalletRecordDocumentEquality implements Equality<WalletRecord> {
  const WalletRecordDocumentEquality();

  @override
  bool equals(WalletRecord? e1, WalletRecord? e2) {
    return e1?.userWallet == e2?.userWallet &&
        e1?.walletAmount == e2?.walletAmount &&
        e1?.hc == e2?.hc;
  }

  @override
  int hash(WalletRecord? e) =>
      const ListEquality().hash([e?.userWallet, e?.walletAmount, e?.hc]);

  @override
  bool isValidKey(Object? o) => o is WalletRecord;
}
