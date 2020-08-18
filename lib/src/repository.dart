import 'dart:async';

import 'sql/database.dart';

class Repository {
  Database _database;

  Future<void> init() async {
    _database = await Database.open();
  }

  Future<void> close() async {
    await _database?.close();
  }

  Future<void> setCurrentDate() =>
    _database.transaction<void>(() async {
      final now = DateTime.now();
      // Вставим текущее время
      final dateID = await _database.into(_database.datesTable).insert(
        DatesTableCompanion.insert(
          name: now.toIso8601String(),
          value: now,
          isUtc: Value(now.isUtc),
        ),
      );
      // Добавим аттрибуты
      await _database.batch((batch) {
        batch.insertAll(_database.attributesTable, [
          AttributesTableCompanion.insert(
            table: 'dates',
            id: dateID,
            name: 'month',
            value: Uint8List.fromList(now.month.toString().codeUnits),
          ),
          AttributesTableCompanion.insert(
            table: 'dates',
            id: dateID,
            name: 'day',
            value: Uint8List.fromList(now.day.toString().codeUnits),
          ),
          AttributesTableCompanion.insert(
            table: 'dates',
            id: dateID,
            name: 'hour',
            value: Uint8List.fromList(now.hour.toString().codeUnits),
          ),
          AttributesTableCompanion.insert(
            table: 'dates',
            id: dateID,
            name: 'minute',
            value: Uint8List.fromList(now.minute.toString().codeUnits),
          ),
          AttributesTableCompanion.insert(
            table: 'dates',
            id: dateID,
            name: 'second',
            value: Uint8List.fromList(now.second.toString().codeUnits),
          ),
        ]);
      });
      return;
    });

  Future<String> getLastDate() =>
    _database.transaction<String>(() async {
      final date = await (_database.select(_database.datesTable)
          ..limit(1)
          ..orderBy([(t) => OrderingTerm.desc(t.id)])
        ).getSingle();
      final attributes = await (_database.select(_database.attributesTable)
          ..where((tbl) => tbl.table.equals('dates') & tbl.id.equals(date.id)))
          .get();
      return 'id: ${date.id},\n'
        'name: ${date.name},\n'
        'description: ${date.description},\n'
        'isUtc: ${date.isUtc},\n'
        'unixtime: ${date.value.millisecondsSinceEpoch*1000},\n'
        'attributes:\n'
        ' * ${attributes.map<String>((e) => '${e.name}: ${String.fromCharCodes(e.value)}').join('\n * ')}';
    });
}