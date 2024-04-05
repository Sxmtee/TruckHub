import 'package:flutter/material.dart';
import 'package:trucks/Features/Home/widgets/fetch_driver.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

SliverWoltModalSheetPage page1(BuildContext context, ValueNotifier notifier) {
  return WoltModalSheetPage(
    hasSabGradient: false,
    leadingNavBarWidget: notifier.value == 0
        ? const SizedBox.shrink()
        : IconButton(
            padding: const EdgeInsets.all(10),
            icon: const Icon(Icons.arrow_back),
            onPressed: Navigator.of(context).pop,
          ),
    // stickyActionBar: Padding(
    //   padding: const EdgeInsets.all(10),
    //   child: ElevatedButton(
    //     onPressed: () => notifier.value = notifier.value + 1,
    //     child: const SizedBox(
    //       height: 50,
    //       width: double.infinity,
    //       child: Center(
    //         child: Text('Next'),
    //       ),
    //     ),
    //   ),
    // ),
    topBarTitle: const Text('List of available drivers'),
    isTopBarLayerAlwaysVisible: true,
    trailingNavBarWidget: IconButton(
      padding: const EdgeInsets.all(10),
      icon: const Icon(Icons.close),
      onPressed: Navigator.of(context).pop,
    ),
    child: const FetchDriver(),
  );
}
