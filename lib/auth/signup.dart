import 'package:flutter/material.dart';
import 'package:flutter_sample/blocks/auth_block.dart';
import 'package:flutter_sample/models/user.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final User user = User(password: '', username: '', email: '');
  late String confirmPassword;

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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '아이디를 입력해주세요';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        user.username = value!;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: '아이디를 입력하세요',
                      labelText: '아이디',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '이메일을 입력해주세요';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        user.email = value!;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: '이메일을 입력하세요',
                      labelText: '이메일',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '비밀번호를 입력해주세요';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          user.password = value!;
                        });
                      },
                      onChanged: (text) {
                        user.password = text;
                      },
                      decoration: InputDecoration(
                        hintText: '비밀번호를 입력하세요',
                        labelText: '비밀번호',
                      ),
                      obscureText: true),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '비밀번호 확인을 입력해주세요';
                    } else if (value != user.password) {
                      return '비밀번호가 일치하지 않습니다';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    confirmPassword = text;
                  },
                  decoration: InputDecoration(
                    hintText: '비밀번호를 다시 입력하세요',
                    labelText: '비밀번호 확인',
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Consumer<AuthBlock>(builder:
                        (BuildContext context, AuthBlock auth, Widget? child) {
                      return ElevatedButton(
                        child: Text(
                          '회원가입',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              !auth.loading) {
                            _formKey.currentState!.save();
                            auth.register(user);
                          }
                        },
                      );
                    }),
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
