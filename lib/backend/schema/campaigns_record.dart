import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CampaignsRecord extends FirestoreRecord {
  CampaignsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "campaign_status" field.
  int? _campaignStatus;
  int get campaignStatus => _campaignStatus ?? 0;
  bool hasCampaignStatus() => _campaignStatus != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "campaign_id" field.
  String? _campaignId;
  String get campaignId => _campaignId ?? '';
  bool hasCampaignId() => _campaignId != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _image = snapshotData['image'] as String?;
    _campaignStatus = castToType<int>(snapshotData['campaign_status']);
    _createdDate = snapshotData['created_date'] as DateTime?;
    _campaignId = snapshotData['campaign_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('campaigns');

  static Stream<CampaignsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CampaignsRecord.fromSnapshot(s));

  static Future<CampaignsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CampaignsRecord.fromSnapshot(s));

  static CampaignsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CampaignsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CampaignsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CampaignsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CampaignsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CampaignsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCampaignsRecordData({
  String? title,
  String? content,
  String? image,
  int? campaignStatus,
  DateTime? createdDate,
  String? campaignId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'content': content,
      'image': image,
      'campaign_status': campaignStatus,
      'created_date': createdDate,
      'campaign_id': campaignId,
    }.withoutNulls,
  );

  return firestoreData;
}

class CampaignsRecordDocumentEquality implements Equality<CampaignsRecord> {
  const CampaignsRecordDocumentEquality();

  @override
  bool equals(CampaignsRecord? e1, CampaignsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.image == e2?.image &&
        e1?.campaignStatus == e2?.campaignStatus &&
        e1?.createdDate == e2?.createdDate &&
        e1?.campaignId == e2?.campaignId;
  }

  @override
  int hash(CampaignsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.content,
        e?.image,
        e?.campaignStatus,
        e?.createdDate,
        e?.campaignId
      ]);

  @override
  bool isValidKey(Object? o) => o is CampaignsRecord;
}
