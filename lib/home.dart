import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var nameValue = 'No value saved';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    const String keyName = "name";
    // var nameValue = 'No value saved';
    @override
    void initState() {
      super.initState();
      getValue(String keyName) {
        keyName = keyName;
      }

      ;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Store and Retrieve data'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11))),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  // var name = namecontroller.text.toString();
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString(keyName, namecontroller.text.toString());
                },
                child: Text('save')),
            SizedBox(
              height: 11,
            ),
            Text(nameValue)
          ],
        ),
      ),
    );
  }

  void getValue(String keyName) async {
    var prefs = await SharedPreferences.getInstance();
    //  prefs.getString(keyName);
    var getName = prefs.getString(keyName);
    nameValue = getName ?? "No value saved";
    setState(() {});
  }
}
