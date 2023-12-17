class ParcelDetails {
  final String invoiceId;
  final String status;
  final String merchantName;
  final String merchantOrderId;
  //2nd card
  final String deliveryDistrict;
  final String deliveryArea;
  final String collectAmount;
  final String deliveryCharge;
  final String codCharge;
  final String totalCharge;
  //3rd card
  final String customerName;
  final String customerPhoneNo;
  final String parcelNote;
  //4th row
  final String deliveryAddress;

  ParcelDetails({
    required this.invoiceId,
    required this.status,
    required this.merchantName,
    required this.merchantOrderId,
    required this.deliveryDistrict,
    required this.deliveryArea,
    required this.collectAmount,
    required this.deliveryCharge,
    required this.codCharge,
    required this.totalCharge,
    required this.customerName,
    required this.customerPhoneNo,
    required this.parcelNote,
    required this.deliveryAddress,
  });
}
