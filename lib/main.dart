import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sample/auth/auth.dart';
import 'package:flutter_sample/blocks/auth_block.dart';
import 'package:flutter_sample/cart.dart';
import 'package:flutter_sample/categorise.dart';
import 'package:flutter_sample/home/home.dart';
// import 'package:flutter_sample/localizations.dart';
import 'package:flutter_sample/product_detail.dart';
import 'package:flutter_sample/settings.dart';
import 'package:flutter_sample/shop/shop.dart';
import 'package:flutter_sample/wishlist.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Locale locale = Locale('en');
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<AuthBlock>.value(value: AuthBlock())],
    child: MaterialApp(
      supportedLocales: [Locale('en'), Locale('ko')],
      locale: locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange.shade500,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.lightBlue.shade900),
        fontFamily: 'Lato',
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Home(),
        '/auth': (BuildContext context) => Auth(),
        '/shop': (BuildContext context) => Shop(),
        '/categorise': (BuildContext context) => Categorise(),
        '/wishlist': (BuildContext context) => WishList(),
        '/cart': (BuildContext context) => CartList(),
        '/settings': (BuildContext context) => Settings(),
        '/products': (BuildContext context) => Products()
      },
    ),
  ));
}
