import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_sample/localizations.dart';

import 'drawer.dart';
import 'slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'assets/images/iu1.jpg',
    'assets/images/iu2.jpg',
    'assets/images/iu4.jpg',
    'assets/images/iu5.jpg',
    'assets/images/iu3.jpg',
    'assets/images/iu6.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  )
                ],
                flexibleSpace: HomeSlider(),
                expandedHeight: 300,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                        EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
                        child: Text(
                            '새로 도착한 상품',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        height: 240.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: imgList.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: 140.0,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/products',
                                            arguments: i);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 160,
                                            child: Hero(
                                              tag: '$i',
                                              child: Image.asset(
                                                i,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                                              ),
                                            ),
                                          ),

                                          ListTile(
                                            title: Text(
                                              '상품 111111',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            subtitle: Text('₩200,000',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme.secondary,
                                                    fontWeight:
                                                    FontWeight.w700)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding:
                          EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                          child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/banner/market3.png'),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            child: Text('카테고리별 쇼핑',
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.secondary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 8.0, left: 8.0),
                            child: ElevatedButton(
                                child: Text('전체 보기',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/categorise');
                                }),
                          )
                        ],
                      ),
                      Container(
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          padding: EdgeInsets.only(
                              top: 8, left: 6, right: 6, bottom: 12),
                          children: List.generate(4, (index) {
                            return Container(
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () {
                                    print('카드 탭');
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                        (MediaQuery.of(context).size.width /
                                            2) -
                                            70,
                                        width: double.infinity,
                                        child: Image.asset(
                                          imgList[index],
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                                        ),
                                      ),
                                      ListTile(
                                          title: Text(
                                            '상품 222222',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 6.0, left: 8.0, right: 8.0, bottom: 10),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/banner/banner1.jpg'),
                          ),
                        ),
                      )
                    ],
                  ),
                  childCount: 1,
                ),
              )
            ]),
      ),
    );
  }
}
