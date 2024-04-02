import 'package:baseflow_plugin_template/baseflow_plugin_template.dart';
import 'package:flutter/material.dart';
import 'package:untitled10/base_url.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseflowPluginExample(
        pluginName: 'Geolocator',
        githubURL: 'https://github.com/Baseflow/flutter-geolocator',
        pubDevURL: 'https://pub.dev/packages/geolocator',
        pages: [
          ExamplePage(
            Icons.pin_drop,
                (BuildContext context) => const BaseUrl(),
          ),
        ]);
  }
}
