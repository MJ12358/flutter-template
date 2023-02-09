// the goal here is to:
//  a: initialize a database and make it accessible later (via injection)
//  b: to keep main.dart free of database specifics

abstract class Database {
  Future<void> init();
  Object get db;
}
