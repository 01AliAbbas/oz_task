// Model for shop data
class ShopItem {
  final String name;
  final String imagePath;
  final String address;
  final bool isOpen;
  final int deliveryTime;
  final double distance;
  final double rating;

  ShopItem({
    required this.name,
    required this.imagePath,
    required this.address,
    required this.isOpen,
    required this.deliveryTime,
    required this.distance,
    required this.rating,
  });
}