import 'package:custom_app/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Map<int, Color> color = {
    50: const Color.fromRGBO(51, 153, 255, .1),
    100: const Color.fromRGBO(51, 153, 255, .2),
    200: const Color.fromRGBO(51, 153, 255, .3),
    300: const Color.fromRGBO(51, 153, 255, .4),
    400: const Color.fromRGBO(51, 153, 255, .5),
    500: const Color.fromRGBO(51, 153, 255, .6),
    600: const Color.fromRGBO(51, 153, 255, .7),
    700: const Color.fromRGBO(51, 153, 255, .8),
    800: const Color.fromRGBO(51, 153, 255, .9),
    900: const Color.fromRGBO(51, 153, 255, 1),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFB74093, color),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Drink App",
          style: const TextStyle(
            color: Color(0xFF222c69),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.grey,
            ),
          )
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.more,
                color: Color(0xFF222c69),
                size: 20,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.add,
                color: Color(0xFF222c69),
                size: 20,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person,
                color: Color(0xFF222c69),
                size: 20,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          //First Part Row Scrolling
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            width: double.infinity,
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _listElement('assets/images/image1.jpg'),
                const SizedBox(
                  width: 20,
                ),
                _listElement('assets/images/image2.jpg'),
                const SizedBox(
                  width: 20,
                ),
                _listElement('assets/images/image3.jpg'),
                const SizedBox(
                  width: 20,
                ),
                _listElement('assets/images/image4.jpg'),
                const SizedBox(
                  width: 20,
                ),
                _listElement('assets/images/image5.jpg'),
                const SizedBox(
                  width: 20,
                ),
                _listElement('assets/images/image6.jpg'),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 8, bottom: 8, left: 5, right: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomLeft: const Radius.circular(10),
                    bottomRight: const Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(4, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const ListTile(
                    leading:  CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/image8.jpg"),
                    ),
                    title:  Text("Brand Name"),
                    subtitle: Text("34 minutes ago"),
                    trailing:  Icon(Icons.more_vert),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Divider(
                      height: 3,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: ReadMoreText(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce accumsan maximus ex id fringilla. Curabitur id facilisis leo, non aliquam felis. Maecenas sagittis bibendum est, in fermentum eros. Morbi magna dui, faucibus vitae enim non, imperdiet iaculis lacus. Suspendisse congue felis neque, vel dignissim erat tristique in. Sed elit augue, lacinia vitae enim vel, faucibus aliquet dui.',
                      trimLines: 3,
                      style: TextStyle(color: Colors.black),
                      colorClickableText: Color(0xFF222c69),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '...Show more',
                      trimExpandedText: ' show less',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  imgPath: "assets/images/image5.jpg")));
                        },
                        child: Hero(
                          tag: "assets/images/image5.jpg",
                          child: Container(
                            height: 200,
                            width: (MediaQuery.of(context).size.width - 50) / 2,
                            decoration: const BoxDecoration(
                                borderRadius:
                                     BorderRadius.all(Radius.circular(10)),
                                image:  DecorationImage(
                                  image: AssetImage("assets/images/image5.jpg"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      imgPath: "assets/images/image4.jpg")));
                            },
                            child: Hero(
                              tag: "assets/images/image4.jpg",
                              child: Container(
                                height: 95,
                                width:
                                    (MediaQuery.of(context).size.width - 100) /
                                        2,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                         BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      image:  AssetImage(
                                          "assets/images/image4.jpg"),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      imgPath: "assets/images/image3.jpg")));
                            },
                            child: Hero(
                              tag: "assets/images/image3.jpg",
                              child: Container(
                                height: 95,
                                width:
                                    (MediaQuery.of(context).size.width - 100) /
                                        2,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                         BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      image:  AssetImage(
                                          "assets/images/image3.jpg"),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 3,
                    color: Colors.grey.shade400,
                  ),
                  const ListTile(
                    title:  Text("12.456 Likes"),
                    trailing:  Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  _listElement(String s) {
    return Column(
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
               Radius.circular(40),
            ),
            image: DecorationImage(image: AssetImage(s), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 30,
          width: 75,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Color(0xFF222c69),
              borderRadius:  BorderRadius.all(Radius.circular(15))),
          child: const Text(
            "Follow",
            style:  TextStyle(color: Colors.white, fontSize: 16),
          ),
        )
      ],
    );
  }
}
