import 'dart:async';

import 'package:moor/moor.dart' show LazyDatabase, QueryExecutor;

LazyDatabase openConnectionLazy() =>
  throw UnsupportedError('Unsupported platform');

FutureOr<QueryExecutor> openConnection() =>
  throw UnsupportedError('Unsupported platform');
