import 'package:flutter/material.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomeviewState();
}


class _HomeviewState extends State<Homeview> {

  TextEditingController txtName = TextEditingController();
  TextEditingController txtid = TextEditingController();
  TextEditingController txtstd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text("Data"),
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.white)),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtName,
                decoration: InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtid,
                decoration: InputDecoration(
                  label: Text("id"),
                  border: OutlineInputBorder(
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtstd,
                decoration: InputDecoration(
                  label: Text("std"),
                  border: OutlineInputBorder(
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (
                txtid.clear();
                txtName.clear();
                txtstd.clear();
                ) ,{},
              child: Text("ADD"),style: ElevatedButton.styleFrom(backgroundColor: Colors.black87)),
          ],
        ),
      ),

    );
  }
}
