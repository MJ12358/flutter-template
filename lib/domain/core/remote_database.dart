/// This file defines the `RemoteDatabase` interface,
/// which is a common interface for all remote databases in the application.
abstract interface class RemoteDatabase<T> {
  Future<RemoteDatabase<T>> init();
  Future<void> close();
  T get db;
}
