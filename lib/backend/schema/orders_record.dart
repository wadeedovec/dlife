import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "items" field.
  List<String>? _items;
  List<String> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "progress" field.
  int? _progress;
  int get progress => _progress ?? 0;
  bool hasProgress() => _progress != null;

  // "facilityID" field.
  DocumentReference? _facilityID;
  DocumentReference? get facilityID => _facilityID;
  bool hasFacilityID() => _facilityID != null;

  // "orderState" field.
  bool? _orderState;
  bool get orderState => _orderState ?? false;
  bool hasOrderState() => _orderState != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "table" field.
  String? _table;
  String get table => _table ?? '';
  bool hasTable() => _table != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _items = getDataList(snapshotData['items']);
    _totalPrice = castToType<double>(snapshotData['total_price']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _orderId = snapshotData['order_id'] as String?;
    _progress = castToType<int>(snapshotData['progress']);
    _facilityID = snapshotData['facilityID'] as DocumentReference?;
    _orderState = snapshotData['orderState'] as bool?;
    _status = snapshotData['status'] as String?;
    _category = snapshotData['category'] as String?;
    _table = snapshotData['table'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DocumentReference? userId,
  double? totalPrice,
  DateTime? createdAt,
  String? orderId,
  int? progress,
  DocumentReference? facilityID,
  bool? orderState,
  String? status,
  String? category,
  String? table,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'total_price': totalPrice,
      'created_at': createdAt,
      'order_id': orderId,
      'progress': progress,
      'facilityID': facilityID,
      'orderState': orderState,
      'status': status,
      'category': category,
      'table': table,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.createdAt == e2?.createdAt &&
        e1?.orderId == e2?.orderId &&
        e1?.progress == e2?.progress &&
        e1?.facilityID == e2?.facilityID &&
        e1?.orderState == e2?.orderState &&
        e1?.status == e2?.status &&
        e1?.category == e2?.category &&
        e1?.table == e2?.table;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.items,
        e?.totalPrice,
        e?.createdAt,
        e?.orderId,
        e?.progress,
        e?.facilityID,
        e?.orderState,
        e?.status,
        e?.category,
        e?.table
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
