import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../usda/home.dart';
import '../../Tracker Meal/Pages/home_track.dart';
import '../../diet recommendation/user_Info.dart';
import '../../shopping/category_screen/men_cat.dart';


class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [

    {
      "title": "Monthly Record",
      "images":
      "https://firebasestorage.googleapis.com/v0/b/gymoto-b05a8.appspot.com/o/Habbit%20tracker.jpg?alt=media&token=01a764f8-96f0-4b64-a633-30650da99c23",
    },
    {
      "title": "Diet Plan",
      "images":
      "https://firebasestorage.googleapis.com/v0/b/gymoto-b05a8.appspot.com/o/meal%20recommendation.jpg?alt=media&token=c7d342a1-5f10-472d-9932-7c30df828207",
    },
    {
      "title": "Facts about Food ",
      "images":
      "https://firebasestorage.googleapis.com/v0/b/gymoto-b05a8.appspot.com/o/workout%20recom.jpg?alt=media&token=cf5afd4c-6b61-4b93-af7a-7649cef2f771",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 250,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: ()
          {
            switch (index)
            {

              case 0:
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (ctx) => const Habbit()));
                break;
              case 1:
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (ctx) => UserInfoFormScreen()));
                break;
              case 2:
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (ctx) => const HomeScreen2()));
                break;
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              color: const Color(0xFF464646),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    "${gridMap.elementAt(index)['images']}",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${gridMap.elementAt(index)['title']}",
                            style: Theme.of(context).textTheme.subtitle1!.merge(
                                   const TextStyle(fontWeight: FontWeight.w700,color: Colors.white
                                   ),
                            ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        )
                      ],
                    ),

                )
              ],
            ),
          ),
        );
      },
    );
  }
}