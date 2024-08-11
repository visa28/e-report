import 'package:get/get.dart';

class PdfService extends GetConnect {
  Future<Response> getPdfReport(String tokenKey) async {
    final response = await get(
      'https://ut.petrolab.co.id/report/show/pdf?token=$tokenKey',
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      return Response(); // Handle error accordingly
    }
  }
}
