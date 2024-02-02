// import 'package:bet_app/webViewStack.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // final controller = WebViewController()
//   // ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   // ..setBackgroundColor(const Color(0x00000000))
//   // ..setNavigationDelegate(
//   //   NavigationDelegate(
//   //     onProgress: (int progress) {
//   //       // Update loading bar.
//   //     },
//   //     onPageStarted: (String url) {},
//   //     onPageFinished: (String url) {},
//   //     onWebResourceError: (WebResourceError error) {},
//   //     onNavigationRequest: (NavigationRequest request) {
//   //       if (request.url.startsWith('https://www.youtube.com/')) {
//   //         return NavigationDecision.prevent;
//   //       }
//   //       return NavigationDecision.navigate;
//   //     },
//   //   ),
//   // )
//   // ..loadRequest(Uri.parse('https://www.google.com/'));
//     late final WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..loadRequest(
//         Uri.parse('https://www.betproexch.com/Markets/WorldCasino'),
//       );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     appBar: AppBar(title: const Text('Flutter Simple Example')),
//     body: const WebViewStack(),
//   );
//   }
// }