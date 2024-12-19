import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 상세'),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 260,
                child: Hero(
                  tag: 'assets/images/iu1.jpg',
                  child: Image.asset(
                    'assets/images/iu1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          '상품 제목',
                          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '\$90',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                  '\$190',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough
                                  )
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              RatingStars(
                                value: 5,
                                starSize: 16,
                                valueLabelColor: Colors.amber,
                                starColor: Colors.amber,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                            alignment: Alignment(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                '상품 설명',
                                style: TextStyle(color: Colors.black, fontSize: 20,  fontWeight: FontWeight.w600),
                              ),
                            )
                        ),
                        Container(
                            alignment: Alignment(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "로렘 입숨은 인쇄 및 조판 업계에서 사용되는 더미 텍스트입니다. 그러나 전자 조판으로의 도약 이후로도 로렘 입숨은 업계의 표준 더미 텍스트로 사용되고 있으며, 1500년대에 알 수 없는 인쇄업자가 타이프 갤러리를 가져와서 그것을 섞어서 타이프 샘플 책을 만들었을 때부터 사용되었습니다. 그것은 5세기를 넘어 전자 조판으로도 도약하여 본질적으로 변경되지 않았습니다.",
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            )
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
