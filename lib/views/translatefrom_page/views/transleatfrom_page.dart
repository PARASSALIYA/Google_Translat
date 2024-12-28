import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class TranslatFromPage extends StatefulWidget {
  const TranslatFromPage({super.key});

  @override
  State<TranslatFromPage> createState() => _TranslatFromPageState();
}

class _TranslatFromPageState extends State<TranslatFromPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Translate from"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              "Recent languages",
              style: TextStyle(fontSize: 16),
            ),
            ListTile(
              leading: const Icon(
                Icons.check,
              ),
              title: Text(context.watch<HomeProvider>().sl),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<HomeProvider>().launguageList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // onTap: () {
                    onForcePressUpdate: (details) {
                      context.read<HomeProvider>().sl = "${details}";
                      context.read<HomeProvider>().translate();
                    },
                    child: ListTile(
                      title: Text(context
                          .watch<HomeProvider>()
                          .launguageList[index]
                          .language),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
