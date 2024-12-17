import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersdetailsRecord extends FirestoreRecord {
  UsersdetailsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  void _initializeFields() {
    _username = snapshotData['username'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usersdetails');

  static Stream<UsersdetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersdetailsRecord.fromSnapshot(s));

  static Future<UsersdetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersdetailsRecord.fromSnapshot(s));

  static UsersdetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersdetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersdetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersdetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersdetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersdetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersdetailsRecordData({
  String? username,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'username': username,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersdetailsRecordDocumentEquality
    implements Equality<UsersdetailsRecord> {
  const UsersdetailsRecordDocumentEquality();

  @override
  bool equals(UsersdetailsRecord? e1, UsersdetailsRecord? e2) {
    return e1?.username == e2?.username;
  }

  @override
  int hash(UsersdetailsRecord? e) => const ListEquality().hash([e?.username]);

  @override
  bool isValidKey(Object? o) => o is UsersdetailsRecord;
}
