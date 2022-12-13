import 'dart:async';

import 'package:beyond_cli/src/core/command/version.dart';

import 'command/create.dart';
import 'command/generate.dart';
import 'command/help.dart';

class BeyondCommand {
  static final progressStreamController = StreamController<double>.broadcast();
  static final progress = progressStreamController.stream.asBroadcastStream();

  static Future<int> dispatchCommand(List<String> args) async {
    switch (args[0]) {
      case '--version':
        return await Version.print();
      case '-h':
        return await Help.global();
      case 'help':
        return await Help.global();
      case 'create':
        return await Create.dispatch(args);
      case 'generate':
        return await Generate.dispatch(args);
      default:
        return 2;
    }
  }
}
