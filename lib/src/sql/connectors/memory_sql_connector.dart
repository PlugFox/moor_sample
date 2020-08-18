import 'dart:async';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

import 'package:platform_info/platform_info.dart';

LazyDatabase openConnectionLazy() =>
    LazyDatabase(openConnection);

FutureOr<QueryExecutor> openConnection() =>
  VmDatabase.memory(logStatements: Platform().buildMode == BuildMode.debug); // ':memory:'