// A class to represent payment object
class PaymentRequest {
  final String paymentNo;
  final String status;
  final String note;
  final String date;

  PaymentRequest({
    required this.paymentNo,
    required this.status,
    required this.note,
    required this.date,
  });
}
