import 'package:moor/moor.dart';

@DataClassName('Dates')
class DatesTable extends Table {
  @override
  String get tableName => 'dates';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 8, max: 64)();
  TextColumn get description => text().named('desc').nullable()();
  DateTimeColumn get value => dateTime().named('date_time')();
  BoolColumn get isUtc => boolean().named('is_utc').withDefault(const Constant(true))();
}