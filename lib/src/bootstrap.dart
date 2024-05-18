import 'dart:async';
import 'package:todolist/src/core/flavor/flavor_config.dart';
import 'package:flutter/material.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  required Flavor flavor,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig.appFlavor = flavor;

  runApp(await builder());
}


