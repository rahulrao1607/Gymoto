class FoodList {
  final int id;
  final String name;
  final String foodCategory;

  FoodList({
    required this.id,
    required this.name,
    required this.foodCategory,
  });

  List<FoodList> foodList() {
    return [
      FoodList(
        id: 1102670,
        name: 'Mango',
        foodCategory: 'Fruit',
      ),
      FoodList(
        id: 1102879,
        name: 'Potato',
        foodCategory: 'vegetable',
      ),
      FoodList(
        id: 1103528,
        name: 'Okra',
        foodCategory: 'vegetable',
      ),
      FoodList(
        id: 1102653,
        name: 'Banana',
        foodCategory: 'Fruit',
      ),
      FoodList(
        id: 1102597,
        name: 'Orange',
        foodCategory: 'Fruit',
      ),
      FoodList(
        id: 1100534,
        name: 'Peanut',
        foodCategory: 'Nuts',
      ),
      FoodList(
        id: 1102702,
        name: 'Blueberries',
        foodCategory: 'Fruit',
      ),
      FoodList(
        id: 2344737,
        name: 'papaya',
        foodCategory: 'Fruit',
      ),
      FoodList(
        id: 1102644,
        name: 'water melon',
        foodCategory: 'Fruit',
      ),
      FoodList(
        id: 1102702,
        name: 'boiled chicken',
        foodCategory: 'meat',
      ),
      FoodList(
        id: 1102644,
        name: 'whey protein',
        foodCategory: 'protein',
      )
    ];
  }
}