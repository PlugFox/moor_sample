import 'dart:async';
import 'dart:io' as io;

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:platform_info/platform_info.dart';

LazyDatabase openConnectionLazy() =>
  LazyDatabase(openConnection);

FutureOr<QueryExecutor> openConnection() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = io.File(p.join(dbFolder.path, 'db.sqlite'));
  return VmDatabase(file, logStatements: Platform().buildMode == BuildMode.debug);
}