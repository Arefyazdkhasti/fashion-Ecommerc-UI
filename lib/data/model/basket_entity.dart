import '../item_entity.dart';

class BasketEntity {
  final String id;
  final String image;
  final String title;
  final String price;
  final ClothSize size;
  int count;
  bool isChecked;

  BasketEntity({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.size,
    required this.count,
    required this.isChecked,
  });

  static List<BasketEntity> fakeBasketItems = [
    BasketEntity(
        id: '1',
        image: 'assets/images/6.jpg',
        title: 'Chiffon dress',
        price: '180',
        size: ClothSize.M,
        count: 1,
        isChecked: false),
    BasketEntity(
        id: '2',
        image: 'assets/images/10.jpg',
        title: 'Autum Coat',
        price: '750',
        size: ClothSize.M,
        count: 1,
        isChecked: true)
  ];
}
