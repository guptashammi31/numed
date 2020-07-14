import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:numed/screens/doctordetail.dart';


class ProductsScreen extends StatelessWidget {
  Future<List> getData() async {
    final response = await http.get("https://technogenr.com/flutter_test/getdata.php");
    return json.decode(response.body);
  }
  @override

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    //  backgroundColor: Color(0xFFD6D6D6),

//      appBar: new AppBar(
//        title: new Text(" Available Doctors"),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        child: new Icon(Icons.add),
////        onPressed: ()=>Navigator.of(context).push(
////          new MaterialPageRoute(
////            builder: (BuildContext context)=> new AddData(),
////          )
////        ),
//      ),
      body:ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Color(0xFF21BFBD),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                    width: 225.0,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Neumed ',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color:Color(0xFF393939),
                             //   fontWeight: FontWeight.bold,
                                fontSize: 25.0)),

                      ],
                    ))
              ],
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height - 100.0,

            decoration: BoxDecoration(
            //  color: Colors.white,

            ),
           child: new FutureBuilder<List>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? new ItemList(
                  list: snapshot.data,
                )
                    : new Center(
                  child: new CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),

    );
  }
}

class ItemList extends StatelessWidget {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return
          new Container(
            margin: EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 1.0),
            height: 230.0,
            decoration: BoxDecoration(

              border: Border.all(color: Color(0xFFD6D6D6)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            //  padding: const EdgeInsets.all(6.0),
          child: new GestureDetector(
//            onTap: ()=>Navigator.of(context).push(
//                new MaterialPageRoute(
//                    builder: (BuildContext context)=> new Detail(list:list , index: i,)
//                )
//            ),
            child:
            Stack(
              children: <Widget>[
                Container(

                  margin: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 4.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(90.0, 0.0, 3.0, 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(list[i]['item_name'],
                                style: TextStyle(
                                  color:Color(0xFF21BFBD),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),

                            SizedBox(height: 10.0),

                          ],
                        ),

                        Text("${list[i]['stock']} years of experience",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),Container(
                          padding: EdgeInsets.fromLTRB(1.0, 4.0, 7.0, 2.0),
                          child:
                          Text(
                            'MBBS,PGDD (Diabetes)',

                            style: TextStyle(
                              color:  Color(0xFF747474),
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                       // _buildRatingStars(4),
                        Container(
                          padding: EdgeInsets.fromLTRB(1.0, 4.0, 7.0, 2.0),
                          child:
                          Text(

                            'Address:Bhubaneswar ',

                            style: TextStyle(
                              color:  Color(0xFF747474),
                              fontSize: 13.0,
                            ),
                          ),
                        ),

                     SizedBox(height: 100.0),
                      ],
                    ),
                  ),
                ),
                new Container(
                    margin: EdgeInsets.fromLTRB(9.0, 22.0, 5.0, 5.0),

                    width: 75,
                    height: 75,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                        'assets/images/doctor.png',

                      ),
                        )
                    )

                ),

                Container(
                  margin: EdgeInsets.fromLTRB(30.0, 120.0, 5.0, 5.0),

                  child:
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        // onTap:color: Colors.red,
                        child:
                        Row(children: <Widget>[

//                              padding: EdgeInsets.all(5.0),
//                              width: 60.0,
//                              decoration: BoxDecoration(
//                                color: Theme.of(context).accentColor,
//                                borderRadius: BorderRadius.circular(10.0),
//                              ),
//                              alignment: Alignment.center,
                          GestureDetector(
                            child:
                            Row(

                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),

                                  decoration: BoxDecoration(

                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  child:
                                  Row(children: <Widget>[
                                    Image.asset(
                                      "assets/images/hospital.png",
                                      height: 18 ,
                                      width: 18,
                                    ),        SizedBox(width: 5.0),

                                    Text(
                                      "₹${list[i]['price']}",style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                    ),],),),],
                            ),)],),),
                      SizedBox(width: 26.0),
                      Row(children: <Widget>[


                        GestureDetector(

                          child:
                          Row(

                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),

                                decoration: BoxDecoration(

                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child:
                                Row(children: <Widget>[
                                  Image.asset(
                                    "assets/images/comment.png",
                                    height: 18 ,
                                    width: 18,
                                  ),        SizedBox(width: 5.0),

                                  Text(
                                    "₹${list[i]['price']}",style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                  ),],),),],
                          ),)],),
                      SizedBox(width: 26.0),

                      Row(children: <Widget>[

//                              padding: EdgeInsets.all(5.0),
//                              width: 60.0,
//                              decoration: BoxDecoration(
//                                color: Theme.of(context).accentColor,
//                                borderRadius: BorderRadius.circular(10.0),
//                              ),
//                              alignment: Alignment.center,
                        GestureDetector(
                          child:
                          Row(

                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),

                                decoration: BoxDecoration(

                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child:
                                Row(children: <Widget>[
                                  Image.asset(
                                    "assets/images/vchat.png",
                                    height: 18 ,
                                    width: 18,
                                  ),        SizedBox(width: 5.0),

                                  Text(
                                    "₹${list[i]['price']}",style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                  ),],),),],
                          ),)],),


                    ],
                  ),),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(17.0, 155.0, 5.0, 5.0),
                      width: 80.0,

                      alignment: Alignment.center,
                      child: Text(
                        "Available Today",
                        style: TextStyle(
                          color:  Color(0xFF388E3C),
                          fontSize: 11.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 9.0),
                     new GestureDetector(
                      onTap: ()=>Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context)=> new Detail(list:list , index: i,)
                          )
                      ),
                      child:
                    Container(
                      padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                      margin: EdgeInsets.fromLTRB(140.0, 145.0, 5.0, 0.0),
                      width: 75.0,
                      height:35,
                      decoration: BoxDecoration(
        color:Color(0xFF21BFBD),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(

                        "Book Now", style: TextStyle(
                       // color: Colors.white,

                        //color:  Color(0xFF747474),
                        fontSize: 11.0,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                    ),),
                  ],
                ),

              ],
            ),

          ),
        );
      },
    );
  }
}
//Color(0xFF69F0AE)