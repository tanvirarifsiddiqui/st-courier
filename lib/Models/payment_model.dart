// A class to represent payment object
class Payment {
  final String paymentNo;
  final String status;
  final String totalParcel;
  final String rcvParcel;
  final String amt;
  final String rcvAmt;
  final String date;

  Payment({
    required this.paymentNo,
    required this.status,
    required this.totalParcel,
    required this.rcvParcel,
    required this.amt,
    required this.rcvAmt,
    required this.date,
  });
}
