import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _locationAPP =
          await secureStorage.getString('ff_locationAPP') ?? _locationAPP;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _locationAPP = '';
  String get locationAPP => _locationAPP;
  set locationAPP(String value) {
    _locationAPP = value;
    secureStorage.setString('ff_locationAPP', value);
  }

  void deleteLocationAPP() {
    secureStorage.delete(key: 'ff_locationAPP');
  }

  List<dynamic> _cartItems = [];
  List<dynamic> get cartItems => _cartItems;
  set cartItems(List<dynamic> value) {
    _cartItems = value;
  }

  void addToCartItems(dynamic value) {
    cartItems.add(value);
  }

  void removeFromCartItems(dynamic value) {
    cartItems.remove(value);
  }

  void removeAtIndexFromCartItems(int index) {
    cartItems.removeAt(index);
  }

  void updateCartItemsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    cartItems[index] = updateFn(_cartItems[index]);
  }

  void insertAtIndexInCartItems(int index, dynamic value) {
    cartItems.insert(index, value);
  }

  DocumentReference? _currentFacilityId;
  DocumentReference? get currentFacilityId => _currentFacilityId;
  set currentFacilityId(DocumentReference? value) {
    _currentFacilityId = value;
  }

  List<String> _additionalGuests = [];
  List<String> get additionalGuests => _additionalGuests;
  set additionalGuests(List<String> value) {
    _additionalGuests = value;
  }

  void addToAdditionalGuests(String value) {
    additionalGuests.add(value);
  }

  void removeFromAdditionalGuests(String value) {
    additionalGuests.remove(value);
  }

  void removeAtIndexFromAdditionalGuests(int index) {
    additionalGuests.removeAt(index);
  }

  void updateAdditionalGuestsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    additionalGuests[index] = updateFn(_additionalGuests[index]);
  }

  void insertAtIndexInAdditionalGuests(int index, String value) {
    additionalGuests.insert(index, value);
  }

  final _userWalletManager = StreamRequestManager<List<WalletRecord>>();
  Stream<List<WalletRecord>> userWallet({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<WalletRecord>> Function() requestFn,
  }) =>
      _userWalletManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserWalletCache() => _userWalletManager.clear();
  void clearUserWalletCacheKey(String? uniqueKey) =>
      _userWalletManager.clearRequest(uniqueKey);
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
