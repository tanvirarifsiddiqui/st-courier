// A class to represent a parcel object
class Parcel {
  final String invoiceId;
  final String name;
  final String phone;
  final String address;
  final double charge;
  final double amount;
  final String brief;
  final String status;

  Parcel({
    required this.invoiceId,
    required this.name,
    required this.phone,
    required this.address,
    required this.charge,
    required this.amount,
    required this.brief,
    required this.status,
  });
}
