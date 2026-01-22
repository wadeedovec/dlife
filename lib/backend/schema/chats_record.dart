import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_a" field.
  DocumentReference? _userA;
  DocumentReference? get userA => _userA;
  bool hasUserA() => _userA != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "last_message_seen_by" field.
  List<DocumentReference>? _lastMessageSeenBy;
  List<DocumentReference> get lastMessageSeenBy =>
      _lastMessageSeenBy ?? const [];
  bool hasLastMessageSeenBy() => _lastMessageSeenBy != null;

  // "last_message_sent_by" field.
  DocumentReference? _lastMessageSentBy;
  DocumentReference? get lastMessageSentBy => _lastMessageSentBy;
  bool hasLastMessageSentBy() => _lastMessageSentBy != null;

  // "user_b" field.
  DocumentReference? _userB;
  DocumentReference? get userB => _userB;
  bool hasUserB() => _userB != null;

  // "ticket_topic" field.
  String? _ticketTopic;
  String get ticketTopic => _ticketTopic ?? '';
  bool hasTicketTopic() => _ticketTopic != null;

  // "ticket_created_time" field.
  DateTime? _ticketCreatedTime;
  DateTime? get ticketCreatedTime => _ticketCreatedTime;
  bool hasTicketCreatedTime() => _ticketCreatedTime != null;

  // "ticket_status" field.
  int? _ticketStatus;
  int get ticketStatus => _ticketStatus ?? 0;
  bool hasTicketStatus() => _ticketStatus != null;

  // "ticket_content" field.
  String? _ticketContent;
  String get ticketContent => _ticketContent ?? '';
  bool hasTicketContent() => _ticketContent != null;

  // "ticket_image" field.
  String? _ticketImage;
  String get ticketImage => _ticketImage ?? '';
  bool hasTicketImage() => _ticketImage != null;

  // "ticket_category" field.
  String? _ticketCategory;
  String get ticketCategory => _ticketCategory ?? '';
  bool hasTicketCategory() => _ticketCategory != null;

  void _initializeFields() {
    _userA = snapshotData['user_a'] as DocumentReference?;
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _lastMessageSeenBy = getDataList(snapshotData['last_message_seen_by']);
    _lastMessageSentBy =
        snapshotData['last_message_sent_by'] as DocumentReference?;
    _userB = snapshotData['user_b'] as DocumentReference?;
    _ticketTopic = snapshotData['ticket_topic'] as String?;
    _ticketCreatedTime = snapshotData['ticket_created_time'] as DateTime?;
    _ticketStatus = castToType<int>(snapshotData['ticket_status']);
    _ticketContent = snapshotData['ticket_content'] as String?;
    _ticketImage = snapshotData['ticket_image'] as String?;
    _ticketCategory = snapshotData['ticket_category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DocumentReference? userA,
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? lastMessageSentBy,
  DocumentReference? userB,
  String? ticketTopic,
  DateTime? ticketCreatedTime,
  int? ticketStatus,
  String? ticketContent,
  String? ticketImage,
  String? ticketCategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_a': userA,
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'last_message_sent_by': lastMessageSentBy,
      'user_b': userB,
      'ticket_topic': ticketTopic,
      'ticket_created_time': ticketCreatedTime,
      'ticket_status': ticketStatus,
      'ticket_content': ticketContent,
      'ticket_image': ticketImage,
      'ticket_category': ticketCategory,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userA == e2?.userA &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        listEquality.equals(e1?.lastMessageSeenBy, e2?.lastMessageSeenBy) &&
        e1?.lastMessageSentBy == e2?.lastMessageSentBy &&
        e1?.userB == e2?.userB &&
        e1?.ticketTopic == e2?.ticketTopic &&
        e1?.ticketCreatedTime == e2?.ticketCreatedTime &&
        e1?.ticketStatus == e2?.ticketStatus &&
        e1?.ticketContent == e2?.ticketContent &&
        e1?.ticketImage == e2?.ticketImage &&
        e1?.ticketCategory == e2?.ticketCategory;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.userA,
        e?.lastMessage,
        e?.lastMessageTime,
        e?.lastMessageSeenBy,
        e?.lastMessageSentBy,
        e?.userB,
        e?.ticketTopic,
        e?.ticketCreatedTime,
        e?.ticketStatus,
        e?.ticketContent,
        e?.ticketImage,
        e?.ticketCategory
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
