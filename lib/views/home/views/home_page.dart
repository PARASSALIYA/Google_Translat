import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_translat/views/home/provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeProvider>().getLaunguage();
    context.read<HomeProvider>().speech = context.read<HomeProvider>().speech;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Translate"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: context.watch<HomeProvider>().controller,
                    onSubmitted: (value) {
                      context.read<HomeProvider>().textSelected =
                          context.read<HomeProvider>().controller.text;
                      context.read<HomeProvider>().translate();
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter text",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<HomeProvider>().textSelected =
                        context.read<HomeProvider>().controller.text;
                    context.read<HomeProvider>().translate();
                  },
                  icon: const Icon(Icons.translate),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: Text(
                    context.watch<HomeProvider>().textList,
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<HomeProvider>()
                        .speak(context.read<HomeProvider>().textList);
                  },
                  icon: const Icon(Icons.volume_up),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      value: context.read<HomeProvider>().sl,
                      items: context
                          .read<HomeProvider>()
                          .launguageList
                          .map(
                            (e) => DropdownMenuItem(
                              value: e.code,
                              child: Text(e.language),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        context.read<HomeProvider>().sl = value!;
                        context.read<HomeProvider>().translate();
                      },
                      hint: const Text("Select Language"),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.swap_horiz),
                  ),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      value: context.read<HomeProvider>().tl,
                      items: context
                          .watch<HomeProvider>()
                          .launguageList
                          .map(
                            (e) => DropdownMenuItem(
                              value: e.code,
                              child: Text(e.language),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        context.read<HomeProvider>().tl = value!;
                        context.read<HomeProvider>().translate();
                      },
                      hint: const Text("Select Language"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 90,
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.people,
                            color: Colors.white, size: 30),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            context.watch<HomeProvider>().isListening
                                ? Icons.mic
                                : Icons.mic_none,
                            size: 40,
                            color: Colors.white,
                          ),
                          onPressed: context.read<HomeProvider>().isListening
                              ? context.read<HomeProvider>().stopListening
                              : context.read<HomeProvider>().startListening,
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt,
                            color: Colors.white, size: 30),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
