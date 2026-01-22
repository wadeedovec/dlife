import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "wallet_id" field.
  DocumentReference? _walletId;
  DocumentReference? get walletId => _walletId;
  bool hasWalletId() => _walletId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "transaction_amount" field.
  double? _transactionAmount;
  double get transactionAmount => _transactionAmount ?? 0.0;
  bool hasTransactionAmount() => _transactionAmount != null;

  // "transaction_bill" field.
  String? _transactionBill;
  String get transactionBill => _transactionBill ?? '';
  bool hasTransactionBill() => _transactionBill != null;

  // "company_id" field.
  DocumentReference? _companyId;
  DocumentReference? get companyId => _companyId;
  bool hasCompanyId() => _companyId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "direction" field.
  String? _direction;

  /// in, out, invoice
  String get direction => _direction ?? '';
  bool hasDirection() => _direction != null;

  // "type" field.
  String? _type;

  /// wallet_topup, spa_payment, refund, gym_payment, restaurant_payment,
  /// loungeBar_payment, invoice_payment, maintenance_payment,
  /// hotelResort_payment, other
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "receiver_id" field.
  DocumentReference? _receiverId;
  DocumentReference? get receiverId => _receiverId;
  bool hasReceiverId() => _receiverId != null;

  // "invoice_id" field.
  DocumentReference? _invoiceId;
  DocumentReference? get invoiceId => _invoiceId;
  bool hasInvoiceId() => _invoiceId != null;

  // "event_id" field.
  DocumentReference? _eventId;
  DocumentReference? get eventId => _eventId;
  bool hasEventId() => _eventId != null;

  void _initializeFields() {
    _walletId = snapshotData['wallet_id'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _transactionAmount = castToType<double>(snapshotData['transaction_amount']);
    _transactionBill = snapshotData['transaction_bill'] as String?;
    _companyId = snapshotData['company_id'] as DocumentReference?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _direction = snapshotData['direction'] as String?;
    _type = snapshotData['type'] as String?;
    _receiverId = snapshotData['receiver_id'] as DocumentReference?;
    _invoiceId = snapshotData['invoice_id'] as DocumentReference?;
    _eventId = snapshotData['event_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  DocumentReference? walletId,
  DateTime? createdAt,
  double? transactionAmount,
  String? transactionBill,
  DocumentReference? companyId,
  DocumentReference? userId,
  String? direction,
  String? type,
  DocumentReference? receiverId,
  DocumentReference? invoiceId,
  DocumentReference? eventId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'wallet_id': walletId,
      'created_at': createdAt,
      'transaction_amount': transactionAmount,
      'transaction_bill': transactionBill,
      'company_id': companyId,
      'user_id': userId,
      'direction': direction,
      'type': type,
      'receiver_id': receiverId,
      'invoice_id': invoiceId,
      'event_id': eventId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.walletId == e2?.walletId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.transactionAmount == e2?.transactionAmount &&
        e1?.transactionBill == e2?.transactionBill &&
        e1?.companyId == e2?.companyId &&
        e1?.userId == e2?.userId &&
        e1?.direction == e2?.direction &&
        e1?.type == e2?.type &&
        e1?.receiverId == e2?.receiverId &&
        e1?.invoiceId == e2?.invoiceId &&
        e1?.eventId == e2?.eventId;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.walletId,
        e?.createdAt,
        e?.transactionAmount,
        e?.transactionBill,
        e?.companyId,
        e?.userId,
        e?.direction,
        e?.type,
        e?.receiverId,
        e?.invoiceId,
        e?.eventId
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
