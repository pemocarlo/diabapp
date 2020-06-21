import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 110,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Your entries!",
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Which updates do you have?",
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color(0xffa29aac),
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              IconButton(
                alignment: Alignment.topCenter,
                icon: Image.asset(
                  "assets/images/notification.png",
                  width: 24,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        GridDashboard(),
      ],
    );
  }
}

class GridDashboard extends StatelessWidget {
  final Items item1 = new Items(
      title: "Glucometry",
      subtitle: "Enter your readings",
      event: "3 Pending",
      img: Icons.healing);

  final Items item2 = new Items(
    title: "Meals",
    subtitle: "A log of your meals",
    event: "4 Pending",
    img: Icons.fastfood,
  );
  final Items item3 = new Items(
    title: "Symptoms",
    subtitle: "What did you feel?",
    event: "",
    img: Icons.local_hospital,
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
    ];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/meal");
              },
              child: DashBoardItem(
                color: color,
                item: data,
              ),
            );
          }).toList()),
    );
  }
}

class DashBoardItem extends StatelessWidget {
  const DashBoardItem({
    Key key,
    @required this.item,
    @required this.color,
  }) : super(key: key);

  final Items item;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(color), borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            item.img,
            color: Colors.white,
            size: 35.0,
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            item.title,
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            item.subtitle,
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white38,
                    fontSize: 10,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            item.event,
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  IconData img;
  Items({this.title, this.subtitle, this.event, this.img});
}
