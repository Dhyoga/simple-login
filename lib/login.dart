import 'package:flutter/material.dart';
import 'package:submission/dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  bool _hidePassword=true;
  String? pw;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: const TextStyle(
                color: Colors.blue,
              ),
              obscureText: _hidePassword,
              decoration: InputDecoration(
                hintText: 'Enter Password',
                hintStyle: const TextStyle(
                  color: Colors.blue
                ),
                suffixIcon: IconButton(
                  color: Colors.blue,
                  icon: Icon(_hidePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: (){
                    setState(() {
                      _hidePassword=!_hidePassword;
                    });
                  },
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)
                )
              ),
              onChanged: (String value){
                setState(() {
                  pw=value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: OutlinedButton(
                onPressed: (){
                  return loginPassword(pw);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.blue)
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                )
              ),
            ),
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  bool isPassword(pw){
    if(pw.length<8) return false;
    if(!pw.contains(RegExp(r"[a-z]"))) return false;
    if(!pw.contains(RegExp(r"[A-Z]"))) return false;
    if(!pw.contains(RegExp(r"[0-9]"))) return false;
    return true;
  }

  void loginPassword(pw){
    if(isPassword(pw)){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Dashboard();
          }
        )
      );
    }
  }
}