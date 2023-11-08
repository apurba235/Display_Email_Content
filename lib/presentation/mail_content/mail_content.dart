import 'package:coffebeans_assignments/data/contents.dart';
import 'package:coffebeans_assignments/data/dummyData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:reactiv/reactiv.dart';

class MailContent extends StatefulWidget {
  const MailContent({Key? key, required this.mailContentNumber}) : super(key: key);
  final int mailContentNumber;

  @override
  State<MailContent> createState() => _MailContentState();
}

class _MailContentState extends State<MailContent> {
  late InAppWebViewController webViewController;
  ReactiveBool isShowingLoader = ReactiveBool(true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Mail Content'),
        actions: const [
          Icon(Icons.more_vert_outlined),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            minLeadingWidth: 45,
            leading: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.amberAccent),
                child: Text(
                  items[widget.mailContentNumber].leadingText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            title: Text(
              items[widget.mailContentNumber].sender,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            subtitle: const Text('to myself@email.com'),
            trailing: const Icon(Icons.more_vert_outlined),
          ),
          Observer(
              listenable: isShowingLoader,
              listener: (showLoader) {
                return Expanded(
                  child: Stack(
                    children: [
                      InAppWebView(
                        onLoadStart: (controller, uri) => isShowingLoader.value = true,
                        onLoadStop: (controller, uri) => isShowingLoader.value = false,
                        onWebViewCreated: (controller) {
                          webViewController = controller;
                          webViewController.loadData(
                              data: widget.mailContentNumber == 0
                                  ? mailContent0
                                  : widget.mailContentNumber == 1
                                      ? mailContent1
                                      : widget.mailContentNumber == 2
                                          ? mailContent2
                                          : '');
                        },
                      ),
                      showLoader
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
