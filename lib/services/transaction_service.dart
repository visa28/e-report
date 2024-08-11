import 'package:get/get.dart';

import '../models/summary_model.dart';


class TransactionService extends GetConnect {
  Future<SummaryModel?> getTransactionSummary(String username) async {
    final response = await get(
      'https://ut.petrolab.co.id/api/transaction/unit/summary?username=$username',
    );

    if (response.statusCode == 200) {
      final data = response.body['data'];
      return SummaryModel(
        totalNormal: data['total_normal'],
        totalCaution: data['total_caution'],
        totalCritical: data['total_critical'],
        totalSevere: data['total_severe'],
      );
    } else {
      return null; // Handle error accordingly
    }
  }
}
