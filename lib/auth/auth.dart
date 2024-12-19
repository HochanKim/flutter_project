import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sample/blocks/auth_block.dart';
import 'signin.dart';
import 'signup.dart';

class Auth extends StatelessWidget {
  final List<Widget> tabs = [
    SignIn(),
    SignUp()
  ];
  @override
  Widget build(BuildContext context) {
    final AuthBlock authBlock = Provider.of<AuthBlock>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(authBlock.currentIndex == 0 ? '로그인' : '회원가입'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_open),
            label: '로그인',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: '회원가입',
          ),
        ],
        currentIndex: authBlock.currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (num){
           authBlock.currentIndex = num;
        },
      ),
      body: tabs[authBlock.currentIndex],
    );
  }
}