/// This file defines the `LocalDatabase` interface,
/// which is a common interface for all local databases in the application.
abstract interface class LocalDatabase<T> {
  Future<LocalDatabase<T>> init();
  T get db;
}
