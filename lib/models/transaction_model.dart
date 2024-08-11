class TransactionModel {
  final String labNo;
  final String evalCode;
  final String name;
  final String model;
  final String unitNo;
  final String component;
  final String sampleDate;
  final String reportDate;

  TransactionModel({
    required this.labNo,
    required this.evalCode,
    required this.name,
    required this.model,
    required this.unitNo,
    required this.component,
    required this.sampleDate,
    required this.reportDate,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      labNo: json['Lab_No'],
      evalCode: json['EVAL_CODE'],
      name: json['name'],
      model: json['MODEL'],
      unitNo: json['UNIT_NO'],
      component: json['COMPONENT'],
      sampleDate: json['SAMPL_DT1'],
      reportDate: json['RPT_DT1'],
    );
  }
}
