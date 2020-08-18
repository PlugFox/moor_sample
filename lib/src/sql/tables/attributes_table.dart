import 'package:moor/moor.dart';

@DataClassName('Attributes')
class AttributesTable extends Table {
  @override
  String get tableName => 'attributes';

  @override
  Set<Column> get primaryKey => {table, id, name};

  // CREATE UNIQUE INDEX
  Index get tableAndIDIndex => Index('table_and_id_idx', 'CREATE INDEX IF NOT EXISTS `table_idx` ON `$tableName` (`table`, `id`);');

  TextColumn get table => text().withLength(min: 1, max: 64)();
  IntColumn get id => integer().named('id')();
  TextColumn get name => text().withLength(min: 1, max: 64)();
  BlobColumn get value => blob()();
}