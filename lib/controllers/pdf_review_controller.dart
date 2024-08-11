import 'package:get/get.dart';


class PDFReviewController extends GetxController {
  var pdfUrl = ''.obs;
  var isLoading = true.obs;

  void fetchPDF(String tokenKey) {
    isLoading(true);
    pdfUrl.value = 'https://ut.petrolab.co.id/report/show/pdf?token=$tokenKey';
    isLoading(false);
  }
}
