import 'package:dars4_2/user.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = 'home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin(){
    String username = usernameController.text;
    String password = passwordController.text;

    var user1 = User(username: username, password: password);
    final box = GetStorage();
    box.write("user", user1.toJson());
    var user2 = User.fromJson(box.read("user"));
    print(user2.username);
    print(user2.password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Username'
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _doLogin, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
