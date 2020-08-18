import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'package:path/path.dart' as path;

import 'package:grinder/grinder.dart';

void main(List<String> args) => grind(args);

String get flutter => io.Platform.isWindows
    ? 'flutter.bat'
    : 'flutter';

@DefaultTask('Doctor')
Future<void> doctor() =>
    _run('$flutter doctor');

@Task('Code generation')
Future<void> gen() =>
    _run('$flutter pub run build_runner build --delete-conflicting-outputs');

@Task('Get')
@Depends(upgrade)
Future<void> get() =>
    _run('$flutter pub get');

@Task('Upgrade')
Future<void> upgrade() =>
    _run('$flutter upgrade');

@Task('Outdated')
@Depends(get)
Future<void> outdated() =>
    _run('$flutter pub outdated');

@Task('Clean')
Future<void> clean() async {
  defaultClean();
  await _run('$flutter pub run build_runner clean');
  await _run('$flutter clean');
}

@Task('Change branch to stable')
Future<void> stable() =>
    _run('$flutter channel stable');

@Task('Change branch to beta')
Future<void> beta() =>
    _run('$flutter channel beta');

@Task('Change branch to dev')
Future<void> dev() =>
    _run('$flutter channel dev');

@Task('Change branch to master')
Future<void> master() =>
    _run('$flutter channel master');

@Task('Performs the static analysis of source code')
@Depends(gen)
Future<void> lint() =>
    _run('$flutter analyze --no-pub --congratulate --current-package --preamble');

@Task('Performs the static analysis of source code')
@Depends(gen)
Future<void> test() {
  if (!io.Directory('test').existsSync()) return Future<void>.value(null);
  final files = io.Directory('test')
      .listSync(recursive: false)
      .whereType<io.File>()
      .where((file) => path.extension(file.path)
      .toLowerCase().endsWith('.dart'));
  if (files.isEmpty) {
    return Future<void>.value(null);
  } else if (files.length == 1) {
    return _run('$flutter test --no-pub --coverage --concurrency=6 ${path.normalize('test/${path.basename(files.first.path)}')}');
  } else {
    return _run('$flutter test --no-pub --coverage --concurrency=6 ${path.normalize('test/')}');
  }
}

Future<void> _run(String executable) async {
  final commands = executable.split(' ').where((element) => element.isNotEmpty).toList(growable: true);
  return io.Process.start(
    commands.first,
    commands.sublist(1),
  ).then((process) =>
      Future.wait<void>([
        process.stdout.forEach((message) {
          log(utf8.decode(message));
        }),
        process.stderr.forEach((message) {
          log('\x1B[31m${utf8.decode(message)}\x1B[0m');
        }),
      ]));
}
