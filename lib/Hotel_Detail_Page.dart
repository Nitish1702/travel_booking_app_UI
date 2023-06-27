import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_booking/App_Tab.dart';

class HotelDetail extends StatelessWidget {
  final List hotels;
  final int index;
  int _currentIndex=0;
  // int index1=0;

  HotelDetail({
    required this.hotels,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: Stack(
              children:[FlexibleSpaceBar(
                title: Container(
                  height: 20,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.7)

                  ),
                  margin:EdgeInsets.only(left: 50,bottom: 20),
                  child:Center(child:Text(
                    '${(_currentIndex+1).toString()}/1 photos',
                    style: TextStyle(fontSize: 10),
                  ),
                  ),
                ),
              background: CarouselSlider(

                items: [
                  Image.asset(
                    hotels[index]['img'],
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                  ),
                  Image.asset(
                    hotels[index]['img'],
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                  ),
                  Image.asset(
                    hotels[index]['img'],
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                  ),
                ],
                options: CarouselOptions(
                  onPageChanged: (index1, reason) {
                    _currentIndex=index1;
                    setState(){
                    };
                  },
                  height: 400,
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                  autoPlay: true,
                ),
              ),
            ),
                Positioned(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                  ),
                  bottom: -1,
                  left: 0,
                  right: 0,
                ),
            ]
            ),
            actions: [
              Padding(
                padding: EdgeInsets.all(0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      // Handle share button press
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.favorite_border),

                    onPressed: () {
                      // Handle favorite button press
                    },
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(

            child:Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                image: DecorationImage(
                  image: AssetImage('img/loc.jpg'),
                  opacity: 0.1,
                  alignment: Alignment.bottomCenter

                )
              ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only( bottom: 10),
                        child: Text(
                          hotels[index]['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                          ),
                          Text(
                            hotels[index]['location'],
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  hotels[index]['starRating'].toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  '\$${hotels[index]['price'].toStringAsFixed(2)}/',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'night',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: ReadMoreText(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, "
                        "and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    style: TextStyle(fontSize: 15),
                    trimLines: 3,
                    colorClickableText: Colors.deepOrangeAccent,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: ' Read less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 20),
                  child:Text(
                    'What we offer',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  height: 130,
                margin: EdgeInsets.only(bottom: 10),
                child:ListView(

                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 15,),
                    Padding(padding: EdgeInsets.only(bottom: 10),
                    child:App_Tab(img: 'img/bed.png', the_text: '2 Bed',tab:false),
                ),
                    SizedBox(width: 10,),
                    Padding(padding: EdgeInsets.only(bottom: 10),
                    child:App_Tab(img: 'img/dinner.png', the_text: 'Dinner',tab:false),
                    ),
                    SizedBox(width: 10,),
                    Padding(padding: EdgeInsets.only(bottom: 10),
                      child:App_Tab(img: 'img/hottub.png', the_text: 'Hot Tub',tab:false),
                    ),
                    SizedBox(width: 10,),
                    Padding(padding: EdgeInsets.only(bottom: 10),
                      child:App_Tab(img: 'img/ac.png', the_text: '1 AC',tab:false),
                    ),
                    SizedBox(width: 10,),
                    Padding(padding: EdgeInsets.only(bottom: 10),
                      child:App_Tab(img: 'img/wifi.png', the_text: 'WiFi',tab:false),
                    )

                  ],
                )
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Padding(padding: EdgeInsets.only(left: 20,top:10),
                  child:Text(
                        'Hosted by',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                  ),
                      ListTile(
                        leading: Container(
                          width: 60,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                              image: AssetImage('img/tom_cruise.jpeg'),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        title: Text(
                          'John Doe', // Replace with the actual name
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              '4.5', // Replace with the actual star rating
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' (20 reviews)', // Replace with the actual number of reviews
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        trailing: InkWell(

                          onTap: (){},
                          child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange,
                            elevation: 4,
                            child:Container(
                            height: 40,
                            width: 40,
                            child: Icon(Icons.chat_outlined,color: Colors.white,size: 30,),
                          ),
                          ),
                        )

                      ),
                      InkWell(
                        splashColor: Colors.lightBlue,

                        focusColor: Colors.red,

                        autofocus: true,
                        onTap: (){},
                      child:Container(
                        margin: EdgeInsets.all(10),
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue
                        ),
                        child: Center(
                          child: Text(
                            'Book Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      )

                    ],
                  ),
                )
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}





