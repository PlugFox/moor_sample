import 'dart:async';

//import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor/moor.dart';

@Deprecated('Use io sql connector with VmDatabase instead')
LazyDatabase openConnectionLazy() =>
  //LazyDatabase(openConnection);
  throw UnsupportedError('Use io sql connector with VmDatabase instead');

@Deprecated('Use io sql connector with VmDatabase instead')
FutureOr<QueryExecutor> openConnection() =>
  //FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite');
  throw UnsupportedError('Use io sql connector with VmDatabase instead');
