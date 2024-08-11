import 'package:get/get.dart';
import 'dart:convert';

import '../models/transaction_detail.dart';

class TransactionDetailController extends  GetConnect {
  var isLoading = true.obs;
  var transactionDetail = TransactionDetail().obs;
  
  void fetchTransactionDetail(String labNumber) async {
    try {
      isLoading(true);
      final response = await get('http://api.ut.petrolab.co.id/transaction/detail/$labNumber');

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);  // Ensure json is recognized here
        transactionDetail.value = TransactionDetail.fromJson(jsonData);
      }
    } finally {
      isLoading(false);
    }
  }
}
