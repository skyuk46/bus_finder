import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:bus_finder/CNG01.dart';
import 'package:bus_finder/CNG02.dart';
import 'package:bus_finder/CNG03.dart';
import 'package:bus_finder/CNG04.dart';
import 'package:bus_finder/busRoute.dart';
import 'package:bus_finder/stopInfo.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Finder',
      home: MyHomePage(title: 'Xe Bus Hà Nội'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Widget widget1;
Widget widget2;

List<String> bus_route_base = [
  '01 - Bến xe Gia Lâm - Bến xe Yên Nghĩa    >',
  '02 - Bác Cổ - Bến xe Yên Nghĩa    >',
  '03A - Bến xe Giáp Bát - Bến xe Gia Lâm    >',
  '03B - Bến xe Nước Ngầm - Long Biên    >',
  '04 - Long Biên - Bệnh viện nội tiết TW CS2    >',
  '05 - KĐT Linh Đàm - Phú Diễn    >',
  '06A - Bến xe Giáp Bát - Cầu Giẽ    >',
  '06B - Bến xe Giáp Bát - Hồng Vân    >',
  '06C - Bến xe Giáp Bát - Phú Minh    >',
  '06D - Bến xe Giáp Bát - Tân Dân    >',
  '07 - Cầu Giấy - Nội Bài    >',
  '08A - Long Biên - Đông Mỹ    >',
  '08B - Long Biên - Vạn Phúc    >',
  '09A - Bờ Hồ - Cầu Giấy    >',
  '09B - Bờ Hồ - Bến xe Mỹ Đình    >',
  '100 - Long Biên - Khu đô thị Đặng Xá    >',
  '101A - Bến xe Giáp Bát - Vân Đình    >',
  '102 - Bến xe Yên Nghĩa - Vân Đình    >',
];

List<String> bus_route_search = [
  '01 - Bến xe Gia Lâm - Bến xe Yên Nghĩa    >',
  '02 - Bác Cổ - Bến xe Yên Nghĩa    >',
  '03A - Bến xe Giáp Bát - Bến xe Gia Lâm    >',
  '03B - Bến xe Nước Ngầm - Long Biên    >',
  '04 - Long Biên - Bệnh viện nội tiết TW CS2    >',
  '05 - KĐT Linh Đàm - Phú Diễn    >',
  '06A - Bến xe Giáp Bát - Cầu Giẽ    >',
  '06B - Bến xe Giáp Bát - Hồng Vân    >',
  '06C - Bến xe Giáp Bát - Phú Minh    >',
  '06D - Bến xe Giáp Bát - Tân Dân    >',
  '07 - Cầu Giấy - Nội Bài    >',
  '08A - Long Biên - Đông Mỹ    >',
  '08B - Long Biên - Vạn Phúc    >',
  '09A - Bờ Hồ - Cầu Giấy    >',
  '09B - Bờ Hồ - Bến xe Mỹ Đình    >',
  '100 - Long Biên - Khu đô thị Đặng Xá    >',
  '101A - Bến xe Giáp Bát - Vân Đình    >',
  '102 - Bến xe Yên Nghĩa - Vân Đình    >',
];

List<String> bus_stop_base = [
  'Phố cầu    >',
  'Dốc Vệ Tinh        >',
  'Bệnh viện đa khoa Thăng Long    >',
  'Đại sứ quán Nhật Bản             >',
  'Đình làng Bùng    >',
  'Ngã 3 Đỗ Xá    >',
  'Làng Lương Xá  >',
  'Bệnh viện K Hà Nội    >',
  'Nhà thi đấu Hà Đông   >',
  'Thôn Xuân Tình        >',
  'Đình Nam Dư Hạ        >',
  'Bưu cục Trâu Quỳ      >',
  'Đại học Hà Nội        >',
  'Nhà D10        >',
];
List<String> bus_stop_search = [
  'Phố Cầu    >',
  'Dốc Vệ Tinh        >',
  'Bệnh viện đa khoa Thăng Long    >',
  'Đại sứ quán Nhật Bản             >',
  'Đình làng Bùng    >',
  'Ngã 3 Đỗ Xá    >',
  'Làng Lương Xá  >',
  'Bệnh viện K Hà Nội    >',
  'Nhà thi đấu Hà Đông   >',
  'Thôn Xuân Tình        >',
  'Đình Nam Dư Hạ        >',
  'Bưu cục Trâu Quỳ      >',
  'Đại học Hà Nội        >',
  'Nhà D10        >',
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void update() {
    setState(() {

    });
  }

  void _navigateToCNG(BuildContext context, String route) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    if (route == "CNG01") {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => new CNG01()));
    }
    else if (route == "CNG02") {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => new CNG02()));
    }
    else if (route == "CNG03") {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => new CNG03()));
    }
    else if (route == "CNG04") {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => new CNG04()));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_counter == 0) {
      widget1 = SearchRouteBar(this.update);
      widget2 = BusRouteList();
    }
    else if (_counter == 1) {
      widget1 = StartPointBar();
      widget2 = EndPointBar();
    }
    else if (_counter == 2) {
      widget1 = SearchStopBar(this.update);
      widget2 = BusStopList();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Ionicons.apps_outline),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: Colors.green,
        title: Text(widget.title),
        actions: [
          InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 240,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              child: RaisedButton.icon(
                                  onPressed: () {
                                      _navigateToCNG(context, "CNG01");
                                  },
                                  icon: Icon(Ionicons.bus),
                                  label: Text("       CNG01                                                                            ")
                              ),
                            ),
                            Container(
                              height: 50,
                              child: RaisedButton.icon(
                                  onPressed: () {
                                    _navigateToCNG(context, "CNG02");
                                  },
                                  icon: Icon(Ionicons.bus),
                                  label: Text("       CNG02                                                                            ")
                              ),
                            ),
                            Container(
                              height: 50,
                              child: RaisedButton.icon(
                                  onPressed: () {
                                    _navigateToCNG(context, "CNG03");
                                  },
                                  icon: Icon(Ionicons.bus),
                                  label: Text("       CNG03                                                                            ")
                              ),
                            ),
                            Container(
                              height: 50,
                              child: RaisedButton.icon(
                                  onPressed: () {
                                    _navigateToCNG(context, "CNG04");
                                  },
                                  icon: Icon(Ionicons.bus),
                                  label: Text("       CNG04                                                                            ")
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                );
              },
              child: Container(
                alignment: Alignment.center,
                child: Text('Bus CNG',style: TextStyle(color: Colors.white, fontSize: 18)),
              )
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 20, top: 10),
                  child: Image(image: AssetImage('images/Bus_icon.png'), height: 150,)
              ),
              Container(
                child:  Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 10,top: 10),
                        child: Text("App thực hiện bởi nhóm 11", style: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10,top: 10),
                      child: Text("Ứng dụng tìm bus", style: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10,top: 10),
                      child: Text("Áp dụng We Map SDK", style: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10,top: 10),
                      child: Text("Tiện lợi cho người dùng", style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Phiên bản 1.0",)
              )
            ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          widget1,
          widget2,
          BottomNavigationBar(
              currentIndex: _counter,
              onTap: (int index) => setState(() => _counter = index),
              selectedItemColor: Colors.green,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Ionicons.bus),
                    label: 'Tuyến Bus',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Ionicons.search),
                    label: "Tìm đường",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Ionicons.walk_outline),
                    label: "Điểm dừng"
                ),
              ]
          )
        ],
      ),
    );
  }
}

class SearchRouteBar extends StatefulWidget {
  SearchRouteBar(this.update);

  Function update;

  @override
  _SearchRouteBar createState() => new _SearchRouteBar();
}

class _SearchRouteBar extends State<SearchRouteBar> {

  TextEditingController searchroutecontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        onChanged: (text) {
          setState(() {
            bus_route_search.clear();
            if (text == "") {
              for (var x in bus_route_base) {
                bus_route_search.add(x);
              }
            }
            else {
              for (var x in bus_route_base) {
                if (x.toUpperCase().contains(text.toUpperCase())) {
                  bus_route_search.add(x);
                }
              }
            }
            this.widget.update();
          });
        },
        controller: searchroutecontroller,
        decoration: InputDecoration(
            prefixIcon: Icon(Ionicons.search),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            hintText: 'Tìm tuyến'
        ),
      ),
    );
  }
}

class BusRouteList extends StatefulWidget {
  BusRouteList({Key key}) : super(key: key);

  @override
  _BusRouteList createState() => new _BusRouteList();
}

class _BusRouteList extends State<BusRouteList> {
  void _navigateToBusRoute(BuildContext context, String route) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => new busRoute(route)));
  }

  void BusRoute(String route) {
    _navigateToBusRoute(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              for (var x in bus_route_search)
                InkWell(
                    onTap: () {
                      BusRoute(x);
                    },
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 15,top: 10, left: 30),
                        child:Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(x, style: TextStyle(fontSize: 18))
                        )
                    )
                ),
            ],
          )
      ),
    );
  }
}

class SearchStopBar extends StatefulWidget {
  SearchStopBar(this.update);
  Function update;

  _SearchStopBar createState() => _SearchStopBar();


}

class _SearchStopBar extends State<SearchStopBar> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        onChanged: (text) {
          setState(() {
            bus_stop_search.clear();
            if (text == "") {
              for (var x in bus_stop_base) {
                bus_stop_search.add(x);
              }
            }
            else {
              for (var x in bus_stop_base) {
                if (x.toUpperCase().contains(text.toUpperCase())) {
                  bus_stop_search.add(x);
                }
              }
            }
            this.widget.update();
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Ionicons.search),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            hintText: 'Điểm dừng'
        ),
      ),
    );
  }
}

class BusStopList extends StatelessWidget {

  _showDialog(BuildContext context, String x) {
    showDialog(
        context: context,
        builder: (context) => new stopInfo(x)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              for (var x in bus_stop_search)
                InkWell(
                    onTap: () {
                      _showDialog(context, x);
                    },
                    child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 15, left: 30),
                        child:Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(x, style: TextStyle(fontSize: 18))
                        )
                    )
                ),
            ],
          )
      ),
    );
  }
}

class StartPointBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Ionicons.location_outline),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                hintText: 'Điểm đi'
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: Icon(Ionicons.arrow_down_circle_sharp, size: 30,),
        )
      ],
    );
  }
}

class EndPointBar extends StatelessWidget {

  void findWay() {

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Ionicons.arrow_forward_circle_outline),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                hintText: 'Điểm đi'
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 10, bottom: 260),
            child: ButtonTheme(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              buttonColor: Colors.green,
              minWidth: 350.0,
              height: 40.0,
              child: RaisedButton(
                onPressed: findWay,
                child: Text("Tìm đường", style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ),
        )
      ],
    );
  }
}
