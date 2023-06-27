import 'package:flutter/material.dart';
import 'package:travel_booking/App_Tab.dart';
import 'package:travel_booking/Popular_Hotels.dart';
import 'package:travel_booking/Hot_Deals.dart';

import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  ScrollController _controller = ScrollController();
  late TabController _tabController;
  List hotels = [];

  readData() async {
    try {
      print('hi');
      String jsonString = await DefaultAssetBundle.of(context).loadString('json/popular_hotels.json');
      setState(() {
        hotels = jsonDecode(jsonString);
      });
      print(hotels.length);
    } catch (e) {
      print('Error loading JSON: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    readData();
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.04,
                    image: AssetImage("img/header_bg.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Where you \nwanna go?",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 40,
                          fontFamily: 'AwanZaman Bold',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only( bottom: 14, right: 8),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.search_rounded,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: NestedScrollView(
                  controller: _controller,
                  headerSliverBuilder: (BuildContext context, bool isScroll) {
                    return [
                      SliverAppBar(
                        pinned: false,
                        backgroundColor: Colors.white60,
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(110),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TabBar(
                              labelPadding: EdgeInsets.only(right: 8),
                              indicatorColor: Colors.white,

                              controller: _tabController,
                              isScrollable: true,
                              tabs: [
                                Padding(
                                  padding: EdgeInsets.only(left: 22, right: 5.0),
                                  child: App_Tab(
                                    img: 'img/hotel.png',
                                    the_text: 'Hotel',
                                    controller: _tabController,
                                    index: 0,
                                    selectedColor: Colors.blue,
                                    unselectedColor: Colors.white,
                                    tab: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: App_Tab(
                                    img: 'img/airplane.png',
                                    the_text: 'Flight',
                                    controller: _tabController,
                                    index: 1,
                                    selectedColor: Colors.blue,
                                    unselectedColor: Colors.white,
                                    tab: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: App_Tab(
                                    img: 'img/location.png',
                                    the_text: 'Place',
                                    controller: _tabController,
                                    index: 2,
                                    selectedColor: Colors.blue,
                                    unselectedColor: Colors.white,
                                    tab: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: App_Tab(
                                    img: 'img/food.png',
                                    the_text: 'Food',
                                    controller: _tabController,
                                    index: 3,
                                    selectedColor: Colors.blue,
                                    unselectedColor: Colors.white,
                                    tab: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    // physics: AlwaysScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Popular Hotels',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 28,
                                    fontFamily: 'AwanZaman Bold',
                                  ),
                                ),
                                InkWell(
                                  onTap: (){},
                                  child:Text(
                                  'See all    ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    fontFamily: 'AwanZaman Bold',
                                    color: Colors.orange,
                                  ),
                                ),
                                ),
                              ],
                            ),
                            Container(
                              height: 240,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: hotels.length,
                                itemBuilder: (context, index) {
                                  print(hotels[index]);
                                  return Padding(
                                    padding: EdgeInsets.all(7),
                                    child: PopularHotel(
                                      hotels: hotels,
                                      index: index,
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Hot Deals',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 28,
                                fontFamily: 'AwanZaman Bold',
                              ),
                            ),
                            SizedBox(
                              height: 240,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: hotels.length,
                                itemBuilder: (context, index) {
                                  print(hotels[index]);
                                  return Padding(
                                    padding: EdgeInsets.all(7),
                                    child: Hotdeals(hotels: hotels,index: index,discount: 25,),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('hola'),
                      Text('hello'),
                      Text('hola'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
