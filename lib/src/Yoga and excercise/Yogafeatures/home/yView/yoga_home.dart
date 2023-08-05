import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../state mangment/Ycontroller/yoga_controller.dart';
import '../../yoga/yoga_view/product_page.dart';
import '../Ywidgets/yoga_cateogrytile.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(fontSize: 20)),
                    ),
                  )
                ],
              ),
            ),
          ),
          pinned: true,
          backgroundColor: const Color(0xFF464646),
          expandedHeight: 300,
          toolbarHeight: 30,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Positioned(
                  left: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.43,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xFF464646),
                    child: Container(
                      margin:
                      const EdgeInsets.only(right: 40, top: 20, bottom: 20),
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/path.png'),
                              fit: BoxFit.contain)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "${DateTime.now().hour < 12 ? 'GOOD MORNING!' : DateTime.now().hour < 16 ? 'GOOD AFTERNOON!' : 'GOOD EVENING!'}\nYOGI",
                    style: const TextStyle(
                      fontFamily: "Ethnocentric",
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              GridView.count(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                children: <Widget>[
                  CategoryTile(
                    img: 'img1',
                    title: "Diet",
                    onTap: openProductPage,
                  ),
                  CategoryTile(
                    img: 'img2',
                    title: "Kegel Exercise",
                    onTap: openProductPage,
                  ),
                  CategoryTile(
                    img: 'img3',
                    title: "Meditation",
                    onTap: openProductPage,
                  ),
                  CategoryTile(
                    img: 'img4',
                    title: "Yoga",
                    onTap: openProductPage,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void openProductPage(String img, String title)
  {
    context.read<YogaController>().setWorkoutName(title);
    Navigator.pushNamed(context, ProductPage.id,
        arguments: {'image': img, 'title': title});
  }
}
