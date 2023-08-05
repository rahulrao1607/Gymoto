import 'package:flutter/material.dart';
import 'dart:math';

class WeightLossScreen extends StatefulWidget {
  @override
  _WeightLossScreenState createState() => _WeightLossScreenState();
}

class _WeightLossScreenState extends State<WeightLossScreen> {
  String breakfast = '';
  String snack1 = '';
  String lunch = '';
  String snack2 = '';
  String dinner = '';
  String snack3 = '';

  void generateMealPlan() {
    setState(() {
      breakfast = bfcalc();
      snack1 = s1calc();
      lunch = lcalc();
      snack2 = s2calc();
      dinner = dcalc();
      snack3 = s3calc();
    });
  }

  String bfcalc() {
    List<String> protein = ['Yogurt(1 cup)', 'Cooked meat(85g)', 'Cooked fish(100g)', '1 whole egg + 4 egg whites', 'Tofu(125g)'];
    List<String> fruit = ['Berries(80g)', 'Apple', 'Orange', 'Banana', 'Dried Fruit(Handfull)', 'Fruit Juice(125ml)'];

    String meal = protein[Random().nextInt(protein.length)] + ', ';
    meal += fruit[Random().nextInt(fruit.length)];

    return meal;
  }

  String s1calc() {
    List<String> protein_snack = ['Soy nuts(30g)', 'Low fat milk(250ml)', 'Hummus(4 Tbsp)', 'Cottage cheese (125g)', 'Flavored yogurt(125g)'];

    if (Random().nextInt(2) == 0) {
      return protein_snack[Random().nextInt(protein_snack.length)];
    } else {
      return '';
    }
  }

  String lcalc() {
    List<String> protein = ['Yogurt(1 cup)', 'Cooked meat(85g)', 'Cooked fish(100g)', '1 whole egg + 4 egg whites', 'Tofu(125g)'];
    List<String> vegetable = ['Any vegetable(80g)', 'Leafy greens(Any Amount)'];
    List<String> taste_enhancer = ['2 TSP (10 ml) olive oil', '2 TBSP (30g) reduced-calorie salad dressing', '1/4 medium avocado', 'Small handful of nuts', '1/2 ounce grated Parmesan cheese', '1 TBSP (20g) jam, jelly, honey, syrup, sugar'];
    List<String> grains = ['Cooked Grain(150g)', 'Whole Grain Bread(1 slice)', 'Half Large Potato(75g)', 'Oats(250g)', '2 corn tortillas'];
    List<String> fruit = ['Berries(80g)', 'Apple', 'Orange', 'Banana', 'Dried Fruit(Handfull)', 'Fruit Juice(125ml)'];

    String meal = '${protein[Random().nextInt(protein.length)]}, ';
    meal += '${vegetable[Random().nextInt(vegetable.length)]}, ';
    meal += 'Leafy greens, ';
    meal += '${taste_enhancer[Random().nextInt(taste_enhancer.length)]}, ';
    meal += grains[Random().nextInt(grains.length)];

    if (Random().nextInt(2) == 0) {
      meal += ', ${fruit[Random().nextInt(fruit.length)]}';
    }

    if (Random().nextInt(2) == 0) {
      meal += ', ${protein[Random().nextInt(protein.length)]}, ';
      meal += vegetable[Random().nextInt(vegetable.length)];
    }

    return meal;
  }

  String s2calc() {
    List<String> proteinSnack = ['Soy nuts(30g)', 'Low fat milk(250ml)', 'Hummus(4 Tbsp)', 'Cottage cheese (125g)', 'Flavored yogurt(125g)'];
    List<String> vegetable = ['Any vegetable(80g)', 'Leafy greens(Any Amount)'];

    String meal = proteinSnack[Random().nextInt(proteinSnack.length)] + ', ';
    meal += vegetable[Random().nextInt(vegetable.length)];

    return meal;
  }

  String dcalc() {
    List<String> protein = ['Yogurt(1 cup)', 'Cooked meat(85g)', 'Cooked fish(100g)', '1 whole egg + 4 egg whites', 'Tofu(125g)'];
    List<String> vegetable = ['Any vegetable(80g)', 'Leafy greens(Any Amount)'];
    List<String> tasteEnhancer = ['2 TSP (10 ml) olive oil', '2 TBSP (30g) reduced-calorie salad dressing', '1/4 medium avocado', 'Small handful of nuts', '1/2 ounce grated Parmesan cheese', '1 TBSP (20g) jam, jelly, honey, syrup, sugar'];
    List<String> grains = ['Cooked Grain(150g)', 'Whole Grain Bread(1 slice)', 'Half Large Potato(75g)', 'Oats(250g)', '2 corn tortillas'];

    String meal = '${protein[Random().nextInt(protein.length)]}, ';
    meal += '2 vegetables 80g, ';
    meal += 'Leafy Greens, ';
    meal += '${grains[Random().nextInt(grains.length)]}, ';
    meal += tasteEnhancer[Random().nextInt(tasteEnhancer.length)];

    if (Random().nextInt(2) == 0) {
      meal += ', ${protein[Random().nextInt(protein.length)]}';
    }

    if (Random().nextInt(2) == 0) {
      meal += ', ${grains[Random().nextInt(grains.length)]}, ';
      meal += tasteEnhancer[Random().nextInt(tasteEnhancer.length)];
    }

    return meal;
  }

  String s3calc() {
    List<String> fruit = ['Berries(80g)', 'Apple', 'Orange', 'Banana', 'Dried Fruit(Handfull)', 'Fruit Juice(125ml)'];

    return fruit[Random().nextInt(fruit.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF464646),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Breakfast :',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(breakfast,style: TextStyle(color: Colors.white),),
              const SizedBox(height: 16.0),
              const Text(
                'Snack 1 :',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(snack1,style: TextStyle(color: Colors.white),),
              const SizedBox(height: 16.0),
              const Text(
                'Lunch :',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(lunch,style: TextStyle(color: Colors.white),),
              const SizedBox(height: 16.0),
              const Text(
                'Snack 2 :',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(snack2,style: TextStyle(color: Colors.white),),
              const SizedBox(height: 16.0),
              const Text(
                'Dinner :',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(dinner,style: TextStyle(color: Colors.white),),
              const SizedBox(height: 16.0),
              const Text(
                'Snack 3 :',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(snack3,style: TextStyle(color: Colors.white),),
              const SizedBox(height: 24.0),
              Center(
                child: ElevatedButton(
                  onPressed: generateMealPlan,
                  child: Text('Generate Meal Plan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}