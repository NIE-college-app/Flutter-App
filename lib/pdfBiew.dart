import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class pdfView extends StatefulWidget {
  @override
  _pdfViewState createState() => _pdfViewState();
}

class _pdfViewState extends State<pdfView> {

	Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
		appBar: AppBar(
			title: Text('Syllabus'),
		),
		body: WebView(
			initialUrl: "http://www.nie.ac.in/wp-content/uploads/2015/05/I-Sc-Engg.-III-year-2019-20.pdf",
			javascriptMode: JavascriptMode.unrestricted,
			onWebViewCreated: (WebViewController cont) {
				_controller.complete(cont);
			},
		),
	);
  }
}
