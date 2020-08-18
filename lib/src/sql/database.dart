import 'dart:async';

import 'package:moor/moor.dart';
import 'connectors/stub_sql_connector.dart'
  // ignore: uri_does_not_exist
  if (dart.library.io) 'connectors/io_sql_connector.dart'
  // ignore: uri_does_not_exist
  if (dart.library.html) 'connectors/web_sql_connector.dart'
  // ignore: uri_does_not_exist
  if (dart.library.io) 'connectors/memory_sql_connector.dart'
  // ignore: uri_does_not_exist
  if (dart.library.io) 'connectors/flutter_sql_connector.dart';

import 'tables/tables.dart';

export 'package:moor/moor.dart';

part 'database.g.dart';

@UseMoor(tables: [DatesTable, AttributesTable])
class Database extends _$Database {
  Database._([QueryExecutor executor]) : super(executor);

  static FutureOr<Database> open() async =>
    Database._(await openConnection());

  factory Database.openLazy() =>
    Database._(openConnectionLazy());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration =>
    _DatabaseMigrationStrategy();
}

/// Handles database migrations by delegating work to [OnCreate] and [OnUpgrade]
/// methods.
class _DatabaseMigrationStrategy implements MigrationStrategy {
  /// Executes when the database is opened for the first time.
  @override
  final OnCreate onCreate;

  /// Executes when the database has been opened previously, but the last access
  /// happened at a different [GeneratedDatabase.schemaVersion].
  /// Schema version upgrades and downgrades will both be run here.
  @override
  final OnUpgrade onUpgrade;

  /// Executes after the database is ready to be used (ie. it has been opened
  /// and all migrations ran), but before any other queries will be sent. This
  /// makes it a suitable place to populate data after the database has been
  /// created or set sqlite `PRAGMAS` that you need.
  @override
  final OnBeforeOpen /*?*/ beforeOpen;

  /// Construct a migration strategy from the provided [onCreate] and
  /// [onUpgrade] methods.
  _DatabaseMigrationStrategy({
    this.onCreate = _defaultOnCreate,
    this.onUpgrade = _defaultOnUpdate,
    this.beforeOpen,
  });

  static Future<void> _defaultOnCreate(Migrator m) =>
    _onCreate(m);
  static Future<void> _defaultOnUpdate(Migrator m, int from, int to) =>
    _update(m, from, to);

  static Future<void> _onCreate(Migrator m) async {
    await m.createAll();
    await m.createIndex(AttributesTable().tableAndIDIndex);
  }

  static Future<void> _update(Migrator m, int from, int to) async {
    if (from >= to) return;
    final version = from+1;
    switch (version) {
      case 1:
        break;
      default:
        throw Exception("You've bumped the schema version for your moor database "
            "but didn't provide a strategy for schema updates. Please do that by "
            'adapting the migrations getter in your database class.');
    }
    if (version >= to) return;
    return _update(m, version, to);
  }
}