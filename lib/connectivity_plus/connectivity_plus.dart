import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyHomePageController extends GetxController {
  RxList<ConnectivityResult> connectionStatus = <ConnectivityResult>[].obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e);
      return;
    }

    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    connectionStatus.value = result;
  }
}

class MyHomePage extends StatelessWidget {
  final MyHomePageController controller = Get.put(MyHomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity Plus Example'),
        elevation: 4,
      ),
      body: GetBuilder<MyHomePageController>(
        builder: (controller) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(flex: 2),
            Text(
              'Active connection types:',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Spacer(),
            ListView(
              shrinkWrap: true,
              children: List.generate(
                controller.connectionStatus.length,
                    (index) => Center(
                  child: Text(
                    controller.connectionStatus[index].toString(),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}