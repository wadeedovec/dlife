import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoicesRecord extends FirestoreRecord {
  InvoicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "property_id" field.
  DocumentReference? _propertyId;
  DocumentReference? get propertyId => _propertyId;
  bool hasPropertyId() => _propertyId != null;

  // "my_property_id" field.
  DocumentReference? _myPropertyId;
  DocumentReference? get myPropertyId => _myPropertyId;
  bool hasMyPropertyId() => _myPropertyId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "type" field.
  String? _type;

  /// "rent", "water", "electric", etc.
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "status" field.
  String? _status;

  /// "paid", "unpaid", "overdue"
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "due_date" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "issued_at" field.
  DateTime? _issuedAt;
  DateTime? get issuedAt => _issuedAt;
  bool hasIssuedAt() => _issuedAt != null;

  // "paid_at" field.
  DateTime? _paidAt;
  DateTime? get paidAt => _paidAt;
  bool hasPaidAt() => _paidAt != null;

  // "document_url" field.
  String? _documentUrl;
  String get documentUrl => _documentUrl ?? '';
  bool hasDocumentUrl() => _documentUrl != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _propertyId = snapshotData['property_id'] as DocumentReference?;
    _myPropertyId = snapshotData['my_property_id'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _type = snapshotData['type'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _status = snapshotData['status'] as String?;
    _dueDate = snapshotData['due_date'] as DateTime?;
    _issuedAt = snapshotData['issued_at'] as DateTime?;
    _paidAt = snapshotData['paid_at'] as DateTime?;
    _documentUrl = snapshotData['document_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('invoices');

  static Stream<InvoicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoicesRecord.fromSnapshot(s));

  static Future<InvoicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoicesRecord.fromSnapshot(s));

  static InvoicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvoicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvoicesRecordData({
  DocumentReference? userId,
  DocumentReference? propertyId,
  DocumentReference? myPropertyId,
  String? title,
  String? type,
  double? amount,
  String? status,
  DateTime? dueDate,
  DateTime? issuedAt,
  DateTime? paidAt,
  String? documentUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'property_id': propertyId,
      'my_property_id': myPropertyId,
      'title': title,
      'type': type,
      'amount': amount,
      'status': status,
      'due_date': dueDate,
      'issued_at': issuedAt,
      'paid_at': paidAt,
      'document_url': documentUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoicesRecordDocumentEquality implements Equality<InvoicesRecord> {
  const InvoicesRecordDocumentEquality();

  @override
  bool equals(InvoicesRecord? e1, InvoicesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.propertyId == e2?.propertyId &&
        e1?.myPropertyId == e2?.myPropertyId &&
        e1?.title == e2?.title &&
        e1?.type == e2?.type &&
        e1?.amount == e2?.amount &&
        e1?.status == e2?.status &&
        e1?.dueDate == e2?.dueDate &&
        e1?.issuedAt == e2?.issuedAt &&
        e1?.paidAt == e2?.paidAt &&
        e1?.documentUrl == e2?.documentUrl;
  }

  @override
  int hash(InvoicesRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.propertyId,
        e?.myPropertyId,
        e?.title,
        e?.type,
        e?.amount,
        e?.status,
        e?.dueDate,
        e?.issuedAt,
        e?.paidAt,
        e?.documentUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is InvoicesRecord;
}
