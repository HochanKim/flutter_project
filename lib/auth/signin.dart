import 'package:flutter/material.dart';
import 'package:flutter_sample/blocks/auth_block.dart';
import 'package:flutter_sample/models/user.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final UserCredential userCredential =
  UserCredential(usernameOrEmail: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '아이디 또는 이메일을 입력해주세요';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        userCredential.usernameOrEmail = value!;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: '아이디 또는 이메일을 입력하세요',
                      labelText: '아이디/이메일',
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '비밀번호를 입력해주세요';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      userCredential.password = value!;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: '비밀번호를 입력하세요',
                    labelText: '비밀번호',
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Consumer<AuthBlock>(
                      builder: (BuildContext context, AuthBlock auth,
                          Widget? child) {
                        return ElevatedButton(
                          child: Text(
                            '로그인',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                !auth.loading) {
                              _formKey.currentState!.save();
                              auth.login(userCredential);
                            }
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
