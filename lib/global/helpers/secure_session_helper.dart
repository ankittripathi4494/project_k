import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureSessionHelper {
  static final SecureSessionHelper _instance =
      SecureSessionHelper._internalSecureStorage();
  FlutterSecureStorage? storage;

  // Private constructor
  SecureSessionHelper._internalSecureStorage();

  // Public factory method to provide access to the singleton instance
  factory SecureSessionHelper() {
    return _instance;
  }

  // Initialize the SharedPreferences instance
  Future<void> init() async {
    storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(),
    );
  }

  // Method to get a String value from SharedPreferences
  Future<bool>? containsKey(String key) {
    return storage?.containsKey(key: key);
  }

  //! Getter Methods
  // Method to get a String value from SharedPreferences
  Future<String?>? getData(String key) {
    return storage?.read(key: key);
  }

  // Method to get a List of String values from SharedPreferences
  Future<Map<String, String>>? getAllData(String key) {
    return storage?.readAll();
  }

  //! Setter Methods

  // Method to set a value as String in SharedPreferences
  Future<void> setData(String key, String value) async {
    await storage?.write(key: key, value: value);
  }

  //! Removed Methods
  // Method to remove a value from SharedPreferences
  Future<void> remove(String key) async {
    await storage?.delete(key: key);
  }

  // Method to clear all value from SharedPreferences
  Future<void> removeAll() async {
    await storage?.deleteAll();
  }
}
