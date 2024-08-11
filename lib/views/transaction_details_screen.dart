
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/transaction_detail_controler.dart';

class TransactionDetailPage extends StatelessWidget {
  final TransactionDetailController controller =
      Get.put(TransactionDetailController());

  final String labNumber;

  TransactionDetailPage({required this.labNumber});

  @override
  Widget build(BuildContext context) {
    controller.fetchTransactionDetail(labNumber);

    return Scaffold(
      appBar: AppBar(
        title: Text(labNumber),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Customer Name: ${controller.transactionDetail.value.customerName}'),
                        Text('Unit Location: ${controller.transactionDetail.value.unitLocation}'),
                        Text('Unit Model: ${controller.transactionDetail.value.unitModel}'),
                        Text('Serial Number: ${controller.transactionDetail.value.serialNumber}'),
                        Divider(),
                        Text('Unit Number: ${controller.transactionDetail.value.unitNumber}'),
                        Text('Component: ${controller.transactionDetail.value.component}'),
                        Text('Component Matrix: ${controller.transactionDetail.value.matrix}'),
                        Text('Oil Matrix: ${controller.transactionDetail.value.oilMatrix}'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Recommendations',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.transactionDetail.value.recomm1 ?? ''),
                        SizedBox(height: 8.0),
                        Text(controller.transactionDetail.value.recomm2 ?? ''),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
