// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';

import '../controllers/pdf_review_controller.dart';

class PDFReviewPage extends StatelessWidget {
  final PDFReviewController controller = Get.put(PDFReviewController());
  final String tokenKey;

  PDFReviewPage({required this.tokenKey});

  @override
  Widget build(BuildContext context) {
    controller.fetchPDF(tokenKey);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Review'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              // Trigger PDF download
              _downloadPDF(context, tokenKey);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri(controller.pdfUrl.value),
            ),
          );
        }
      }),
    );
  }

  Future<void> _downloadPDF(BuildContext context, String tokenKey) async {
    final String url = 'https://ut.petrolab.co.id/report/show/pdf?token=$tokenKey';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Uint8List bytes = response.bodyBytes;
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/document.pdf');
        await file.writeAsBytes(bytes);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("PDF downloaded successfully")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to download PDF: ${response.statusCode}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to download PDF: $e")),
      );
    }
  }
}
