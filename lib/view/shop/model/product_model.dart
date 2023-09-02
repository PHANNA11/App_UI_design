class ProductModel {
  late int id;
  late String name;
  late String image;
  late double price;
  late int qty;
  late String description;
  late bool isFavorite;
  ProductModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.qty,
      required this.description,
      required this.isFavorite});
}

List<ProductModel> productList = [
  ProductModel(
    id: 1,
    name: 'Berger ',
    image:
        'https://img.freepik.com/premium-photo/illustation-berger-with-tomato-chees_35766-1703.jpg?w=2000',
    price: 2.9,
    qty: 1,
    description:
        'Premium Photo | Illustation of berger with a tomato and chees',
    isFavorite: false,
  ),
  ProductModel(
    id: 2,
    name: 'Pizza',
    image:
        'https://www.onmanorama.com/content/dam/mm/en/food/features/images/2021/10/17/pizza.jpg.transform/576x300/image.jpg',
    price: 18.9,
    qty: 1,
    description:
        'Different kinds of pizza for all types of foodies | Food | Manorama English',
    isFavorite: false,
  ),
  ProductModel(
    id: 3,
    name: 'Chicken',
    image:
        'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/6/3/1/FNM_070111-Fried-Chicken-026_s4x3.jpg.rend.hgtvcom.616.462.suffix/1382539796174.jpeg',
    price: 7.9,
    qty: 1,
    description: 'Classic Fried Chicken',
    isFavorite: false,
  ),
];
