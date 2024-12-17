import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoriesRecord extends FirestoreRecord {
  StoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _cover = snapshotData['cover'] as String?;
    _content = snapshotData['content'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stories');

  static Stream<StoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoriesRecord.fromSnapshot(s));

  static Future<StoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoriesRecord.fromSnapshot(s));

  static StoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoriesRecordData({
  String? title,
  String? cover,
  String? content,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'cover': cover,
      'content': content,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoriesRecordDocumentEquality implements Equality<StoriesRecord> {
  const StoriesRecordDocumentEquality();

  @override
  bool equals(StoriesRecord? e1, StoriesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.cover == e2?.cover &&
        e1?.content == e2?.content;
  }

  @override
  int hash(StoriesRecord? e) =>
      const ListEquality().hash([e?.title, e?.cover, e?.content]);

  @override
  bool isValidKey(Object? o) => o is StoriesRecord;
}
