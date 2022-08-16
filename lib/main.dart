import 'dart:math';
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'data.dart';
import 'data_dao.dart';
import 'package:flutterfire_ui/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
  Stream<DatabaseEvent> stream = ref.onValue;
  stream.listen((DatabaseEvent event) {
    _itemCount = _itemCount + 1;
  });

  /*ref.once().then((DatabaseEvent databaseEvent) {
    //print(databaseEvent.snapshot.value?.toString());
    Map<dynamic, dynamic> values =
        databaseEvent.snapshot.value as Map<dynamic, dynamic>;
    values.forEach((key, value) {
      //print(values);
      list.add(value);
      print(key);
      print(value);
    });
  });*/
}

final dataDao = DataDao();

final DatabaseReference ref = FirebaseDatabase.instance.ref().child("mistakes");
List<Map<String, Object>> lists = [];
final ScrollController _scrollController = ScrollController();
late int _itemCount = 3;
Random random = Random();
int index = 0;
late int _currentIndex = 0;

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyScrollBehavior(),
      title: '(:',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffffffff)),
      home: const MyHomePage(title: 'test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List colors = [
    const Color(0xfffff1e6),
    const Color(0xfffde2e4),
    const Color(0xfffad2e1),
    const Color(0xffe2ece9),
    const Color(0xffbee1e6),
    const Color(0xfff0efeb),
    const Color(0xffdfe7fd),
    const Color(0xffcddafd),
  ];

  void changeIndex() {
    setState(() => index = random.nextInt(3));
  }

  String _wrong = "wrong";
  String _right = "right";

  Widget _buildItem(BuildContext context, int index) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30.toDouble())),
        child: Container(
            color: colors[
                index % 8], //const Color(0xfff9f5f0), // 0xffe0ece6 0xffe2e4f6
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_wrong,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Divider(
                  color: Colors.black,
                  height: 150,
                  indent: 50,
                  endIndent: 50,
                  thickness: 2,
                ),
                Text(_right,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            )));
  }

  /*FutureBuilder(
        future: ref.once(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
           //return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            final spell = snapshot.data!.snapshot;

            return ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext ctx, i) => ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(30.toDouble())),
                    child: Container(
                        color: colors[index %
                            8], //const Color(0xfff9f5f0), // 0xffe0ece6 0xffe2e4f6
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                spell.children
                                    .toList()[_currentIndex]
                                    .child('wrong')
                                    .value,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const Divider(
                              color: Colors.black,
                              height: 130,
                              indent: 50,
                              endIndent: 50,
                              thickness: 2,
                            ),
                            Text(
                                spell.children
                                    .toList()[_currentIndex]
                                    .child('right')
                                    .value,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ))));
          }
          return const Center(child: Text('Error!'));
        });
        */

  /*ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30.toDouble())),
        child: FirebaseAnimatedList(
          controller: _scrollController,
          query: dataDao.getDataQuery(),
          itemBuilder: (context, snapshot, animation, index) {
            final json = snapshot.value as Map<dynamic, dynamic>;
            final data = Data.fromJson(json);

            return Container(
            color: colors[
                index % 8], //const Color(0xfff9f5f0), // 0xffe0ece6 0xffe2e4f6
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.wrong,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Divider(
                  color: Colors.black,
                  height: 130,
                  indent: 50,
                  endIndent: 50,
                  thickness: 2,
                ),
                Text(data.right,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            )
        //Image.asset(
        //  images[index % images.length],
        //  fit: BoxFit.fill,
        //),
        );
          },
        ));
    */

  /*Container(
            color: colors[
                index % 8], //const Color(0xfff9f5f0), // 0xffe0ece6 0xffe2e4f6
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_getWrong(index).toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Divider(
                  color: Colors.black,
                  height: 130,
                  indent: 50,
                  endIndent: 50,
                  thickness: 2,
                ),
                Text(_right,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ))
        //Image.asset(
        //  images[index % images.length],
        //  fit: BoxFit.fill,
        //),
        );
        */

  @override
  Widget build(BuildContext context) {
    // CODING BEIM BUILDEN

    // ENDE CODING

    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Spelling mistakes vom Hund'),
        backgroundColor: const Color(0xff52796f),
      ),*/

      /*body: FirebaseAnimatedList(
        controller: _scrollController,
        query: dataDao.getDataQuery(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final data = Data.fromJson(json);

          return Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Text(data.right),
          );
        },
      ),*/

      /*
          FirebaseDatabaseQueryBuilder(
              query: dataDao.getDataQuery(),
              builder: (context, snapshot, _) {
                if (snapshot.isFetching) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Something went wrong! ${snapshot.error}');
                }

                
                return GridView.builder(
                  itemCount: snapshot.docs.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.docs[index].value as Map;

                    return Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: Text(data['right']),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0),
                );
              }),
      
      */

      body: StreamBuilder(
          stream: ref.once().asStream(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.snapshot.value != null) {
                Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                List<dynamic> list = map.values.toList();

                //_right = list[_currentIndex]["right"];
                //_wrong = list[_currentIndex]["wrong"];

                return Swiper(
                  customLayoutOption:
                      CustomLayoutOption(startIndex: -1, stateCount: 3)
                        ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                        ..addTranslate(
                          [
                            const Offset(-710.0, -40.0),
                            const Offset(0.0, 0.0),
                            const Offset(710.0, -40.0)
                          ],
                        ),
                  itemBuilder: (BuildContext context, int index) => ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(30.toDouble())),
                      child: Container(
                          color: colors[index %
                              8], //const Color(0xfff9f5f0), // 0xffe0ece6 0xffe2e4f6
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(list[_currentIndex]["wrong"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              const Divider(
                                color: Colors.black,
                                height: 130,
                                indent: 50,
                                endIndent: 50,
                                thickness: 2,
                              ),
                              Text(list[_currentIndex]["right"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ))),
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  fade: 1.0,
                  index: _currentIndex,
                  onIndexChanged: (index) {
                    () => changeIndex();
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  curve: Curves.ease,
                  scale: 1,
                  itemWidth: 300.0,
                  itemHeight: 300.0,
                  controller: SwiperController(),
                  layout: SwiperLayout.CUSTOM,
                  outer: false,
                  viewportFraction: 0.8,
                  autoplayDelay: 3000,
                  loop: true,
                  autoplay: false,
                  itemCount: list.length,
                  scrollDirection: Axis.horizontal,
                  axisDirection: AxisDirection.left,
                  autoplayDisableOnInteraction: false,
                  pagination: const SwiperPagination(
                      //builder: DotSwiperPaginationBuilder(
                      //    size: 10.0, activeSize: 20.0, space: 10.0)),
                      builder: FractionPaginationBuilder(
                          color: Color(0xff474747),
                          activeColor: Color(0xFF474747))),
                );
              }
            }
            return const Center(child: Text('Error!'));
          }),
      /*  Swiper(
        /*customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
          ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
          ..addTranslate(
            [
              const Offset(-710.0, -40.0),
              const Offset(0.0, 0.0),
              const Offset(710.0, -40.0)
            ],
          ),*/
        itemBuilder: _buildItem,
        indicatorLayout: PageIndicatorLayout.COLOR,
        fade: 1.0,
        index: _currentIndex,
        onIndexChanged: (index) {
          () => changeIndex();
          setState(() {
            _currentIndex = index;
          });
        },
        curve: Curves.ease,
        scale: 1,
        itemWidth: 300.0,
        itemHeight: 300.0,
        controller: SwiperController(),
        layout: SwiperLayout.STACK,
        outer: false,
        viewportFraction: 0.8,
        autoplayDelay: 3000,
        loop: true,
        autoplay: false,
        itemCount: _itemCount,
        scrollDirection: Axis.horizontal,
        axisDirection: AxisDirection.left,
        autoplayDisableOnInteraction: false,
        pagination: const SwiperPagination(
            //builder: DotSwiperPaginationBuilder(
            //    size: 10.0, activeSize: 20.0, space: 10.0)),
            builder: FractionPaginationBuilder(
                color: Color(0xff474747), activeColor: Color(0xFF474747))),
      ), 
      
      */
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        // tooltip: 'Increment',
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog(context),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    TextEditingController wrongController = TextEditingController();
    TextEditingController rightController = TextEditingController();

    void _sendData() {
      final data = Data(rightController.text, wrongController.text);
      dataDao.saveData(data);
      setState(() {});
    }

    return AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextFormField(
          controller: wrongController,
          // initialValue: 'Input text',
          decoration: const InputDecoration(
            labelText: 'Falsch',
            border: OutlineInputBorder(),
            suffixIcon: Icon(
              Icons.error,
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: rightController,
          // initialValue: 'Input text',
          decoration: const InputDecoration(
            labelText: 'Ausgebessert',
            border: OutlineInputBorder(),
            suffixIcon: Icon(
              Icons.error,
            ),
          ),
        )
      ]),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          //textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: () async {
            _sendData();
          },
          child: const Text('Save'),
        )
      ],
    );
  }
}

/*
class ExampleVertical extends StatelessWidget {
  const ExampleVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ExampleVertical'),
        ),
        body: Swiper(
          itemBuilder: (context, index) {
            return Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          pagination: const SwiperPagination(alignment: Alignment.centerRight),
          control: const SwiperControl(),
        ));
  }
}

class ExampleFraction extends StatelessWidget {
  const ExampleFraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ExampleFraction'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Swiper(
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: images.length,
              pagination:
                  const SwiperPagination(builder: SwiperPagination.fraction),
              control: const SwiperControl(),
            )),
            Expanded(
                child: Swiper(
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: images.length,
              scrollDirection: Axis.vertical,
              pagination: const SwiperPagination(
                  alignment: Alignment.centerRight,
                  builder: SwiperPagination.fraction),
            ))
          ],
        ));
  }
}

class ExampleCustomPagination extends StatelessWidget {
  const ExampleCustomPagination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Custom Pagination'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Swiper(
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: images.length,
                pagination: SwiperPagination(
                    margin: EdgeInsets.zero,
                    builder: SwiperCustomPagination(builder: (context, config) {
                      return ConstrainedBox(
                        constraints: const BoxConstraints.expand(height: 50.0),
                        child: Container(
                          color: Colors.white,
                          child: Text(
                            '${titles[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}',
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                      );
                    })),
                control: const SwiperControl(),
              ),
            ),
            Expanded(
              child: Swiper(
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: images.length,
                pagination: SwiperPagination(
                    margin: EdgeInsets.zero,
                    builder: SwiperCustomPagination(builder: (context, config) {
                      return ConstrainedBox(
                        constraints: const BoxConstraints.expand(height: 50.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '${titles[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}',
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: const DotSwiperPaginationBuilder(
                                        color: Colors.black12,
                                        activeColor: Colors.black,
                                        size: 10.0,
                                        activeSize: 20.0)
                                    .build(context, config),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
                control: const SwiperControl(color: Colors.redAccent),
              ),
            )
          ],
        ));
  }
}

class ExamplePhone extends StatelessWidget {
  const ExamplePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone'),
      ),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.asset(
              'images/bg.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          Swiper.children(
            autoplay: false,
            pagination: const SwiperPagination(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                builder: DotSwiperPaginationBuilder(
                    color: Colors.white30,
                    activeColor: Colors.white,
                    size: 20.0,
                    activeSize: 20.0)),
            children: <Widget>[
              Image.asset(
                'images/1.png',
                fit: BoxFit.contain,
              ),
              Image.asset(
                'images/2.png',
                fit: BoxFit.contain,
              ),
              Image.asset('images/3.png', fit: BoxFit.contain)
            ],
          )
        ],
      ),
    );
  }
}
*/

class ScaffoldWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final List<Widget>? actions;

  const ScaffoldWidget({
    Key? key,
    required this.title,
    required this.child,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: child,
    );
  }
}
