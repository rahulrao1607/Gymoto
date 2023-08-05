import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'modellist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DetailScreen extends StatefulWidget {
  final int id;
  DetailScreen(this.id);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late FoodData foodData;
  bool loading = true;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    var url = Uri.parse(
        "https://api.nal.usda.gov/fdc/v1/food/${widget.id}?api_key=prRjefHraOUsvMPLf3yn7OioBJX11RbbaBLfVMAQ");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedResponse = convert.jsonDecode(response.body);
      print('===================$decodedResponse');
      foodData = FoodData.fromMap(decodedResponse);
      print('===================$foodData');
      setState(() {
        loading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: loading
            ? SizedBox.shrink()
            : FittedBox(
          child: Text(
            "${foodData.description}",
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
      body: Container(
        child: loading
            ? Center(child: CircularProgressIndicator())
            : Column(
          children: [
            Text(
              "Portion: per 100g",
              style: TextStyle(fontSize: 25),
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                    itemCount: foodData == null
                        ? 0
                        : foodData.foodNutrients!.length,
                    itemBuilder: (context, index) {
                      var nutrient =
                      foodData.foodNutrients![index].nutrient!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              alignment: Alignment.topLeft,
                              fit: BoxFit.scaleDown,
                              child: Text(
                                foodData.foodNutrients![index].amount ==
                                    null
                                    ? " ${nutrient.name}: "
                                    : "${nutrient.name}:   ${foodData.foodNutrients![index].amount} ${foodData.foodNutrients![index].amount == null ? "" : nutrient.unitName}",
                                style: foodData.foodNutrients![index]
                                    .amount ==
                                    null
                                    ? const TextStyle(
                                  backgroundColor: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 23,
                                )
                                    : const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.black54,
                          ),
                        ],
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}