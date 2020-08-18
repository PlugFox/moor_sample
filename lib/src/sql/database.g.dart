// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Dates extends DataClass implements Insertable<Dates> {
  final int id;
  final String name;
  final String description;
  final DateTime value;
  final bool isUtc;
  Dates(
      {@required this.id,
      @required this.name,
      this.description,
      @required this.value,
      @required this.isUtc});
  factory Dates.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Dates(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}desc']),
      value: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_time']),
      isUtc: boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_utc']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['desc'] = Variable<String>(description);
    }
    if (!nullToAbsent || value != null) {
      map['date_time'] = Variable<DateTime>(value);
    }
    if (!nullToAbsent || isUtc != null) {
      map['is_utc'] = Variable<bool>(isUtc);
    }
    return map;
  }

  DatesTableCompanion toCompanion(bool nullToAbsent) {
    return DatesTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      isUtc:
          isUtc == null && nullToAbsent ? const Value.absent() : Value(isUtc),
    );
  }

  factory Dates.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Dates(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      value: serializer.fromJson<DateTime>(json['value']),
      isUtc: serializer.fromJson<bool>(json['isUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'value': serializer.toJson<DateTime>(value),
      'isUtc': serializer.toJson<bool>(isUtc),
    };
  }

  Dates copyWith(
          {int id,
          String name,
          String description,
          DateTime value,
          bool isUtc}) =>
      Dates(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        value: value ?? this.value,
        isUtc: isUtc ?? this.isUtc,
      );
  @override
  String toString() {
    return (StringBuffer('Dates(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('value: $value, ')
          ..write('isUtc: $isUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(description.hashCode, $mrjc(value.hashCode, isUtc.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Dates &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.value == this.value &&
          other.isUtc == this.isUtc);
}

class DatesTableCompanion extends UpdateCompanion<Dates> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> value;
  final Value<bool> isUtc;
  const DatesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.value = const Value.absent(),
    this.isUtc = const Value.absent(),
  });
  DatesTableCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.description = const Value.absent(),
    @required DateTime value,
    this.isUtc = const Value.absent(),
  })  : name = Value(name),
        value = Value(value);
  static Insertable<Dates> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> description,
    Expression<DateTime> value,
    Expression<bool> isUtc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'desc': description,
      if (value != null) 'date_time': value,
      if (isUtc != null) 'is_utc': isUtc,
    });
  }

  DatesTableCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<DateTime> value,
      Value<bool> isUtc}) {
    return DatesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      value: value ?? this.value,
      isUtc: isUtc ?? this.isUtc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['desc'] = Variable<String>(description.value);
    }
    if (value.present) {
      map['date_time'] = Variable<DateTime>(value.value);
    }
    if (isUtc.present) {
      map['is_utc'] = Variable<bool>(isUtc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DatesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('value: $value, ')
          ..write('isUtc: $isUtc')
          ..write(')'))
        .toString();
  }
}

class $DatesTableTable extends DatesTable
    with TableInfo<$DatesTableTable, Dates> {
  final GeneratedDatabase _db;
  final String _alias;
  $DatesTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 8, maxTextLength: 64);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'desc',
      $tableName,
      true,
    );
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedDateTimeColumn _value;
  @override
  GeneratedDateTimeColumn get value => _value ??= _constructValue();
  GeneratedDateTimeColumn _constructValue() {
    return GeneratedDateTimeColumn(
      'date_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isUtcMeta = const VerificationMeta('isUtc');
  GeneratedBoolColumn _isUtc;
  @override
  GeneratedBoolColumn get isUtc => _isUtc ??= _constructIsUtc();
  GeneratedBoolColumn _constructIsUtc() {
    return GeneratedBoolColumn('is_utc', $tableName, false,
        defaultValue: const Constant(true));
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, description, value, isUtc];
  @override
  $DatesTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'dates';
  @override
  final String actualTableName = 'dates';
  @override
  VerificationContext validateIntegrity(Insertable<Dates> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(_descriptionMeta,
          description.isAcceptableOrUnknown(data['desc'], _descriptionMeta));
    }
    if (data.containsKey('date_time')) {
      context.handle(_valueMeta,
          value.isAcceptableOrUnknown(data['date_time'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('is_utc')) {
      context.handle(
          _isUtcMeta, isUtc.isAcceptableOrUnknown(data['is_utc'], _isUtcMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Dates map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Dates.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DatesTableTable createAlias(String alias) {
    return $DatesTableTable(_db, alias);
  }
}

class Attributes extends DataClass implements Insertable<Attributes> {
  final String table;
  final int id;
  final String name;
  final Uint8List value;
  Attributes(
      {@required this.table,
      @required this.id,
      @required this.name,
      @required this.value});
  factory Attributes.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final uint8ListType = db.typeSystem.forDartType<Uint8List>();
    return Attributes(
      table:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}table']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      value: uint8ListType
          .mapFromDatabaseResponse(data['${effectivePrefix}value']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || table != null) {
      map['table'] = Variable<String>(table);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<Uint8List>(value);
    }
    return map;
  }

  AttributesTableCompanion toCompanion(bool nullToAbsent) {
    return AttributesTableCompanion(
      table:
          table == null && nullToAbsent ? const Value.absent() : Value(table),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory Attributes.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Attributes(
      table: serializer.fromJson<String>(json['table']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<Uint8List>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'table': serializer.toJson<String>(table),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<Uint8List>(value),
    };
  }

  Attributes copyWith({String table, int id, String name, Uint8List value}) =>
      Attributes(
        table: table ?? this.table,
        id: id ?? this.id,
        name: name ?? this.name,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('Attributes(')
          ..write('table: $table, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(table.hashCode,
      $mrjc(id.hashCode, $mrjc(name.hashCode, value.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Attributes &&
          other.table == this.table &&
          other.id == this.id &&
          other.name == this.name &&
          other.value == this.value);
}

class AttributesTableCompanion extends UpdateCompanion<Attributes> {
  final Value<String> table;
  final Value<int> id;
  final Value<String> name;
  final Value<Uint8List> value;
  const AttributesTableCompanion({
    this.table = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.value = const Value.absent(),
  });
  AttributesTableCompanion.insert({
    @required String table,
    @required int id,
    @required String name,
    @required Uint8List value,
  })  : table = Value(table),
        id = Value(id),
        name = Value(name),
        value = Value(value);
  static Insertable<Attributes> custom({
    Expression<String> table,
    Expression<int> id,
    Expression<String> name,
    Expression<Uint8List> value,
  }) {
    return RawValuesInsertable({
      if (table != null) 'table': table,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    });
  }

  AttributesTableCompanion copyWith(
      {Value<String> table,
      Value<int> id,
      Value<String> name,
      Value<Uint8List> value}) {
    return AttributesTableCompanion(
      table: table ?? this.table,
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (table.present) {
      map['table'] = Variable<String>(table.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = Variable<Uint8List>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttributesTableCompanion(')
          ..write('table: $table, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $AttributesTableTable extends AttributesTable
    with TableInfo<$AttributesTableTable, Attributes> {
  final GeneratedDatabase _db;
  final String _alias;
  $AttributesTableTable(this._db, [this._alias]);
  final VerificationMeta _tableMeta = const VerificationMeta('table');
  GeneratedTextColumn _table;
  @override
  GeneratedTextColumn get table => _table ??= _constructTable();
  GeneratedTextColumn _constructTable() {
    return GeneratedTextColumn('table', $tableName, false,
        minTextLength: 1, maxTextLength: 64);
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 64);
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedBlobColumn _value;
  @override
  GeneratedBlobColumn get value => _value ??= _constructValue();
  GeneratedBlobColumn _constructValue() {
    return GeneratedBlobColumn(
      'value',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [table, id, name, value];
  @override
  $AttributesTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'attributes';
  @override
  final String actualTableName = 'attributes';
  @override
  VerificationContext validateIntegrity(Insertable<Attributes> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('table')) {
      context.handle(
          _tableMeta, table.isAcceptableOrUnknown(data['table'], _tableMeta));
    } else if (isInserting) {
      context.missing(_tableMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {table, id, name};
  @override
  Attributes map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Attributes.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AttributesTableTable createAlias(String alias) {
    return $AttributesTableTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DatesTableTable _datesTable;
  $DatesTableTable get datesTable => _datesTable ??= $DatesTableTable(this);
  $AttributesTableTable _attributesTable;
  $AttributesTableTable get attributesTable =>
      _attributesTable ??= $AttributesTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [datesTable, attributesTable];
}
