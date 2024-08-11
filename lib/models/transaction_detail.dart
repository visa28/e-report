class TransactionDetail {
  String? labNumber;
  String? evalCode;
  String? customerName;
  String? unitLocation;
  String? unitModel;
  String? serialNumber;
  String? unitNumber;
  String? component;
  String? matrix;
  String? oilMatrix;
  String? recomm1;
  String? recomm2;

  TransactionDetail({
    this.labNumber,
    this.evalCode,
    this.customerName,
    this.unitLocation,
    this.unitModel,
    this.serialNumber,
    this.unitNumber,
    this.component,
    this.matrix,
    this.oilMatrix,
    this.recomm1,
    this.recomm2,
  });

  factory TransactionDetail.fromJson(Map<String, dynamic> json) {
    return TransactionDetail(
      labNumber: json['lab_no'],
      evalCode: json['eval_code'],
      customerName: json['name'],
      unitLocation: json['unit']['unitlocation'],
      unitModel: json['unit']['model'],
      serialNumber: json['add_met'],
      unitNumber: json['unit']['unitno'],
      component: json['component'],
      matrix: json['matrix'],
      oilMatrix: json['oil_matrix'],
      recomm1: json['recomm1'],
      recomm2: json['recomm2'],
    );
  }
}
