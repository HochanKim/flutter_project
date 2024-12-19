import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import 'search.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final List<Map<dynamic, dynamic>> products = [
    {'name': '아이폰 123', 'rating': 3.0, 'image': 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'},
    {'name': '갤럭시 S123', 'rating': 3.5, 'image': 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'},
    {'name': '좋은거', 'rating': 4.5, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': '노트북 1212', 'rating': 5.0, 'image': 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'},
  ];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {
                scaffoldKey.currentState!
                    .showBottomSheet((context) => ShopSearch());
              },
            )
          ],
          title: Text('쇼핑'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(maxHeight: 150.0),
                    child: Material(
                      color: Theme.of(context).colorScheme.secondary,
                      child: TabBar(
                        indicatorColor: Colors.blue,
                        tabs: [
                          Tab(icon: Icon(Icons.view_list)),
                          Tab(icon: Icon(Icons.grid_on)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: products.map((product) {
                              return InkWell(
                                onTap: () {
                                  print('Card tapped.');
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Divider(
                                      height: 0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, bottom: 10.0),
                                      child: ListTile(
                                        trailing: Icon(Icons.navigate_next),
                                        leading: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(5.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blue),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: product['image'],
                                              placeholder:
                                                  (context, url) =>
                                                  Center(
                                                      child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                              new Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          product['name'],
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 2.0,
                                                      bottom: 1),
                                                  child: Text('\$200',
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 6.0),
                                                  child: Text('(\$400)',
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontStyle:
                                                          FontStyle.italic,
                                                          color: Colors.grey,
                                                          decoration:
                                                          TextDecoration
                                                              .lineThrough)),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                RatingStars(
                                                  value: product['rating'],
                                                  starSize: 16,
                                                  valueLabelColor:
                                                  Colors.amber,
                                                  starColor: Colors.amber,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          padding: EdgeInsets.only(
                              top: 8, left: 6, right: 6, bottom: 12),
                          children: List.generate(products.length, (index) {
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
                                        height: (MediaQuery.of(context)
                                            .size
                                            .width /
                                            2 -
                                            20),
                                        width: double.infinity,
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: products[index]['image'],
                                          placeholder:
                                              (context, url) => Center(
                                              child:
                                              CircularProgressIndicator()),
                                          errorWidget:
                                              (context, url, error) =>
                                          new Icon(Icons.error),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0),
                                        child: ListTile(
                                          title: Text(
                                            '제품 111',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 2.0,
                                                        bottom: 1),
                                                    child: Text('\$200',
                                                        style: TextStyle(
                                                          color: Theme.of(context)
                                                              .colorScheme
                                                              .secondary,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 6.0),
                                                    child: Text('(\$400)',
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontStyle:
                                                            FontStyle.italic,
                                                            color: Colors.grey,
                                                            decoration:
                                                            TextDecoration
                                                                .lineThrough)),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  RatingStars(
                                                    value: products[index]
                                                    ['rating'],
                                                    starSize: 16,
                                                    valueLabelColor:
                                                    Colors.amber,
                                                    starColor: Colors.amber,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
