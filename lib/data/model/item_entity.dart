class ItemEntity {
  final String id;
  final String image;
  final String title;
  final String description;
  final String price;
  final List<ClothSize> size;
  bool isLiked;

  ItemEntity({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.size,
    required this.isLiked,
  });

  static List<ItemEntity> fakeListItem = [
    ItemEntity(
        id: '1',
        image: 'assets/images/1.jpg',
        title: 'Sunglasses',
        description:
            'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
        price: '129',
        size: [
          ClothSize.XS,
          ClothSize.S,
          ClothSize.M,
          ClothSize.L,
          ClothSize.XL
        ],
        isLiked: false),
    ItemEntity(
        id: '2',
        image: 'assets/images/2.jpg',
        title: 'Party dress',
        description:
            'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
        price: '229',
        size: [
          ClothSize.XS,
          ClothSize.S,
          ClothSize.M,
          ClothSize.L,
          ClothSize.XL
        ],
        isLiked: true),
    ItemEntity(
        id: '3',
        image: 'assets/images/3.jpg',
        title: 'Shooniz',
        description:
            'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
        price: '229',
        size: [
          ClothSize.XS,
          ClothSize.S,
          ClothSize.M,
          ClothSize.L,
          ClothSize.XL
        ],
        isLiked: false),
    ItemEntity(
        id: '4',
        image: 'assets/images/4.jpg',
        title: 'Lady dress',
        description:
            'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
        price: '229',
        size: [
          ClothSize.XS,
          ClothSize.S,
          ClothSize.M,
          ClothSize.L,
          ClothSize.XL
        ],
        isLiked: false),
    ItemEntity(
        id: '5',
        image: 'assets/images/5.jpg',
        title: 'Formal Blouse',
        description:
            'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
        price: '229',
        size: [
          ClothSize.XS,
          ClothSize.S,
          ClothSize.XL
        ],
        isLiked: false),
    ItemEntity(
        id: '6',
        image: 'assets/images/6.jpg',
        title: 'Slut Dress',
        description:
            'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
        price: '229',
        size: [
          ClothSize.XS,
          ClothSize.M,
          ClothSize.L,
          ClothSize.XL
        ],
        isLiked: false),
    ItemEntity(
        id: '7',
        image: 'assets/images/7.jpg',
        title: 'Autumn coat',
        description:
            'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
        price: '229',
        size: [
          ClothSize.XS,
          ClothSize.S,
          ClothSize.L,
          ClothSize.XL
        ],
        isLiked: false),
    ItemEntity(
        id: '8',
        image: 'assets/images/8.jpg',
        title: 'Autumn coat',
        description:
            'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
        price: '229',
        size: [
          ClothSize.XS,
          ClothSize.S,
          ClothSize.M,
          ClothSize.L,
          ClothSize.XL
        ],
        isLiked: false),
    ItemEntity(
        id: '9',
        image: 'assets/images/9.jpg',
        title: 'Autumn coat',
        description:
            'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
        price: '229',
        size: [
          ClothSize.XS,
          ClothSize.S,
          ClothSize.XL
        ],
        isLiked: false),
    ItemEntity(
        id: '10',
        image: 'assets/images/10.jpg',
        title: 'Autumn coat',
        description:
            'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
        price: '229',
        size: [
          ClothSize.S,
          ClothSize.M,
          ClothSize.L,
        ],
        isLiked: false)
  ];
}

enum ClothSize { XS, S, M, L, XL }
