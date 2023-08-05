import 'package:gymoto/src/features/models/dashboardModel1.dart';
import '../../features/models/base_model.dart';
import '../../features/models/categories_model.dart';



List<dashboardModel1> dashboardM = [
  dashboardModel1(
    imageUrl: "assets/images/adv1.jpg",
  ),
  dashboardModel1(
    imageUrl: "assets/images/adv2.jpg",
  ),
  dashboardModel1(
    imageUrl: "assets/images/adv3.jpg",
  ),
  dashboardModel1(
    imageUrl: "assets/images/adv5.jpg",
  ),
];


List<CategoriesModel> categories = [
    CategoriesModel(
    imageUrl: "assets/images/man.jpeg",
    title: "Men",
      id: 1,
  ),
  CategoriesModel(
    imageUrl: "assets/images/women.jpeg",
    title: "Women",
    id: 2,
  ),
  CategoriesModel(
    imageUrl: "assets/images/shoes.jpg",
    title: "Shoes",
    id: 3,
  ),
  CategoriesModel(
    imageUrl: "assets/images/gymacess.jpeg",
    title: "Accessories",
    id: 4,
  ),
  CategoriesModel(
    imageUrl: "assets/images/weight.jpg",
    title: "Weights",
    id: 5,
  ),
  CategoriesModel(
    imageUrl: "assets/images/prot.jpeg",
    title: "Supplements",
    id: 6,
  ),
];

List<BaseModel> mainList = [
  BaseModel(
    imageUrl: "assets/images/mens.jpg",
    name: "Casual Jeans Pant",
    price: 155.99,
    review: 3.6,
    star: 4.8,
    id: 1,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/blazer.jpg",
    name: "blue Coat",
    price: 143.99,
    review: 5.6,
    star: 5.0,
    id: 2,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/jacjket.jpg",
    name: "Deep Green Jacket",
    price: 212.99,
    review: 2.6,
    star: 3.7,
    id: 3,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/shirt.jpg",
    name: "Orange Shirt",
    price: 432.99,
    review: 1.4,
    star: 2.4,
    id: 4,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/sw.jpg",
    name: "Grey Pullover",
    price: 112.99,
    review: 4.2,
    star: 1.8,
    id: 5,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/women.jpg",
    name: "Pullover Sleeveless",
    price: 320.99,
    review: 2.1,
    star: 3.1,
    id: 6,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/womens.jpg",
    name: "Black Coat",
    price: 113.99,
    review: 3.1,
    star: 4.8,
    id: 7,
    value: 1,
  ),
  BaseModel(
    imageUrl: "assets/images/t-shirt.jpg",
    name: "White Shirt",
    price: 178.99,
    review: 2.6,
    star: 4.8,
    id: 8,
    value: 1,
  ),
];


List<BaseModel> itemsOnCart = [];
List<BaseModel> itemsOnSearch = [];