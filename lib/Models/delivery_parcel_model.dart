class DeliveryParcel {
  final String invoiceId;
  final String totalCollectAmount;
  final String cod;
  final String codCharge;
  final String package;
  final String deliveryCharge;
  final String returnCharge;
  final String customerCollectAmount;
  final String totalCharge;
  final String paidAmount;

  DeliveryParcel({
    required this.invoiceId,
    required this.totalCollectAmount,
    required this.cod,
    required this.codCharge,
    required this.package,
    required this.deliveryCharge,
    required this.returnCharge,
    required this.customerCollectAmount,
    required this.totalCharge,
    required this.paidAmount
  });
}