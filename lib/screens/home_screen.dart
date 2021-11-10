import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../languages/languages.dart';
import '../config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime dateTime = DateTime.now();

  // TabController controller=TabController(length: 2, vsync:SingleTickerProviderStateMixin() );
  int tabBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 3,
        initialIndex: tabBarIndex,
        child: Directionality(
          textDirection: getIsEnglish(context) == true
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Scaffold(
              backgroundColor: backGroundApp,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '\$596',
                            style: TextStyle(
                              fontFamily: 'Verdana',
                              fontSize: 13,
                              color: Color(0xcfff2121),
                              letterSpacing: 0.52,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'W2BESO',
                            style: TextStyle(
                              fontFamily: 'Verdana',
                              fontSize: 13,
                              color: Color(0xcfffffff),
                              letterSpacing: 0.52,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: heightScreen * .25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            gradient: const LinearGradient(
                              begin: Alignment(0.0, -1.0),
                              end: Alignment(0.0, 1.0),
                              colors: [Color(0xff1ecbf4), Color(0xff194dc3)],
                              stops: [0.0, 1.0],
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                            top: 18,
                            right: 18,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                              child: Center(
                                child: Image(
                                  image: AssetImage('assets/images/mar.png'),
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      color: const Color(0xff353E55),
                      height: heightScreen * .05,
                      child: TabBar(
                          labelPadding: const EdgeInsets.all(0),
                          unselectedLabelColor: Colors.green,
                          indicatorColor: Colors.transparent,
                          // labelColor: Colors.black,
                          onTap: (value) {
                            setState(() {
                              tabBarIndex = value;
                            });
                          },
                          tabs: [
                            Tab(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        color: tabBarIndex == 0
                                            ? Colors.white
                                            : Colors.transparent,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'PALLADIUM',
                                          style: TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontSize: 13,
                                            color: tabBarIndex == 0
                                                ? Colors.black
                                                : const Color(0xffffffff),
                                            letterSpacing: -0.20800000000000002,
                                            fontWeight: tabBarIndex == 0
                                                ? FontWeight.normal
                                                : FontWeight.w500,
                                            height: 1.6153846153846154,
                                          ),
                                          textHeightBehavior:
                                              const TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      height: 8,
                                      child: Transform.rotate(
                                        angle: -4.71,
                                        child: Divider(
                                          color: Colors.grey.withOpacity(.4),
                                          thickness: 2,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: tabBarIndex == 1
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                                child: Center(
                                  child: Text(
                                    'PLATINUM',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 13,
                                      color: tabBarIndex == 1
                                          ? Colors.black
                                          : const Color(0xffffffff),
                                      letterSpacing: -0.20800000000000002,
                                      fontWeight: tabBarIndex == 1
                                          ? FontWeight.normal
                                          : FontWeight.w500,
                                      height: 1.6153846153846154,
                                    ),
                                    textHeightBehavior:
                                        const TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      height: 8,
                                      child: Transform.rotate(
                                        angle: -4.71,
                                        child: Divider(
                                          color: Colors.grey.withOpacity(.4),
                                          thickness: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        color: tabBarIndex == 2
                                            ? Colors.white
                                            : Colors.transparent,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'PHODIUM',
                                          style: TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontSize: 13,
                                            color: tabBarIndex == 2
                                                ? Colors.black
                                                : const Color(0xffffffff),
                                            letterSpacing: -0.20800000000000002,
                                            fontWeight: tabBarIndex == 2
                                                ? FontWeight.normal
                                                : FontWeight.w500,
                                            height: 1.6153846153846154,
                                          ),
                                          textHeightBehavior:
                                              const TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  child: Center(
                                      child: Text.rich(
                                    TextSpan(
                                      style: const TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 13,
                                        color: Color(0xffffffff),
                                        letterSpacing: -0.20800000000000002,
                                        height: 1.6153846153846154,
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: 'PALLADIUM Price is : ',
                                        ),
                                        TextSpan(
                                          text:
                                              '10.059.87 USD o tz ${dateTime.day} \/ ${dateTime.month} \/${dateTime.year}',
                                          style: const TextStyle(
                                            color: Color(0xff199be0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    textHeightBehavior:
                                        const TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                Container(
                                  height: heightScreen * .3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.0),
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                const Text(
                                  'Palladium recycling does not guarantee the prices shown are correct Prices  displayed are not in real time and are for informational purposes only',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 9,
                                    color: Color(0xfff5f5f5),
                                    letterSpacing: -0.14400000000000002,
                                    height: 1.6666666666666667,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 18),
                                  child: Center(
                                      child: Text.rich(
                                    TextSpan(
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 13,
                                        color: Color(0xffffffff),
                                        letterSpacing: -0.20800000000000002,
                                        height: 1.6153846153846154,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'PLATINUM Price is : ',
                                        ),
                                        TextSpan(
                                          text:
                                              '10.059.87 USD o tz 15 Oct \'21',
                                          style: TextStyle(
                                            color: Color(0xff199be0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                Container(
                                  height: heightScreen * .3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.0),
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                const Text(
                                  'PLATINUM recycling does not guarantee the prices shown are correct Prices  displayed are not in real time and are for informational purposes only',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 9,
                                    color: Color(0xfff5f5f5),
                                    letterSpacing: -0.14400000000000002,
                                    height: 1.6666666666666667,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          const Text('3'),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
