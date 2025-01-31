import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {

  final List<Map<dynamic, dynamic>> products = [
    {'name': '아이폰 123', 'rating': 3.0, 'image': 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80', 'price' : '10'},
    {'name': '갤럭시 S123', 'rating': 3.5, 'image': 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', 'price' : '10'},
    {'name': '좋은거', 'rating': 4.5, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80', 'price' : '20'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('장바구니'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Container(
                  child: Text(products.length.toString() + "개의 항목이 장바구니에 있습니다", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
              ),
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final item = products[index];
                    return Dismissible(
                      key: Key(UniqueKey().toString()),
                      onDismissed: (direction) {
                        if(direction == DismissDirection.endToStart) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(item['name'] + "이(가) 삭제되었습니다"), duration: Duration(seconds: 1)));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(item['name'] + "이(가) 장바구니에 추가되었습니다"), duration: Duration(seconds: 1)));
                        }
                        setState(() {
                          products.removeAt(index);
                        });
                      },
                      background: Container(
                        decoration: BoxDecoration(color: Colors.red),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      secondaryBackground: Container(
                        decoration: BoxDecoration(color: Colors.red),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          print('카드가 클릭되었습니다.');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Divider(
                              height: 0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: ListTile(
                                trailing: Text('\$ ${item['price']}'),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue
                                    ),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: item['image'],
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()
                                      ),
                                      errorWidget: (context, url, error) => new Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  item['name'],
                                  style: TextStyle(
                                      fontSize: 14
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 2.0, bottom: 1),
                                          child: Text('재고 있음', style: TextStyle(
                                            color: Theme.of(context).colorScheme.secondary,
                                            fontWeight: FontWeight.w700,
                                          )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text("총액", style: TextStyle(fontSize: 16, color: Colors.grey),)
                            ),
                            Text("\$40.00",  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text("소계", style: TextStyle(fontSize: 14))
                            ),
                            Text("\$34.00", style: TextStyle(fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text("배송비",  style: TextStyle(fontSize: 14))
                            ),
                            Text("\$2.00", style: TextStyle(fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text("세금",  style: TextStyle(fontSize: 14))
                            ),
                            Text("\$2.00", style: TextStyle(fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50, bottom: 10),
              child: ButtonTheme(
                buttonColor: Theme.of(context).primaryColor,
                minWidth: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "결제하기",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
