import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _FavoriteStory = prefs
              .getStringList('ff_FavoriteStory')
              ?.map((path) => path.ref)
              .toList() ??
          _FavoriteStory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _SearchActive = false;
  bool get SearchActive => _SearchActive;
  set SearchActive(bool value) {
    _SearchActive = value;
  }

  List<DocumentReference> _FavoriteStory = [];
  List<DocumentReference> get FavoriteStory => _FavoriteStory;
  set FavoriteStory(List<DocumentReference> value) {
    _FavoriteStory = value;
    prefs.setStringList('ff_FavoriteStory', value.map((x) => x.path).toList());
  }

  void addToFavoriteStory(DocumentReference value) {
    FavoriteStory.add(value);
    prefs.setStringList(
        'ff_FavoriteStory', _FavoriteStory.map((x) => x.path).toList());
  }

  void removeFromFavoriteStory(DocumentReference value) {
    FavoriteStory.remove(value);
    prefs.setStringList(
        'ff_FavoriteStory', _FavoriteStory.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavoriteStory(int index) {
    FavoriteStory.removeAt(index);
    prefs.setStringList(
        'ff_FavoriteStory', _FavoriteStory.map((x) => x.path).toList());
  }

  void updateFavoriteStoryAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    FavoriteStory[index] = updateFn(_FavoriteStory[index]);
    prefs.setStringList(
        'ff_FavoriteStory', _FavoriteStory.map((x) => x.path).toList());
  }

  void insertAtIndexInFavoriteStory(int index, DocumentReference value) {
    FavoriteStory.insert(index, value);
    prefs.setStringList(
        'ff_FavoriteStory', _FavoriteStory.map((x) => x.path).toList());
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
