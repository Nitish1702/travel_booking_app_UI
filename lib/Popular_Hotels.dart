import 'package:flutter/material.dart';
import 'package:travel_booking/Hotel_Detail_Page.dart';

class PopularHotel extends StatelessWidget {
  final List hotels;
  final int index;

  const PopularHotel({
    required this.hotels,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>HotelDetail(hotels: hotels,index: index,)),
      );
    },
    child:Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(hotels[index]['img']),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hotels[index]['name'],
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white70,
                ),
                Text(
                  hotels[index]['location'],
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(children: [
                Text(
                  '\$${hotels[index]['price'].toStringAsFixed(2)}/',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'night',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
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
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18),
                        )
                      ],
                    )),
              ]),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
