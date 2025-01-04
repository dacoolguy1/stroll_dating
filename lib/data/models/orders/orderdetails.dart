class OrderDetails {
  final String restaurantName;
  final String logoPath;
  final double amount;
  final String date;
  final int itemCount;
  final String orderId;

  const OrderDetails({
    required this.restaurantName,
    required this.logoPath,
    required this.amount,
    required this.date,
    required this.itemCount,
    required this.orderId,
  });
}
