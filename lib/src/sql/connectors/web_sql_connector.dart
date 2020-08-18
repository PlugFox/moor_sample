import 'dart:async';

import 'package:moor/moor.dart' show QueryExecutor, LazyDatabase;
import 'package:moor/moor_web.dart';

import 'package:platform_info/platform_info.dart';

QueryExecutor openConnectionLazy() =>
  LazyDatabase(openConnection);

FutureOr<QueryExecutor> openConnection() =>
  WebDatabase('db', logStatements: Platform().buildMode == BuildMode.debug);
