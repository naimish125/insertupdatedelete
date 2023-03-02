import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insertupdatedelete/screen/update/provider.dart';
import 'package:provider/provider.dart';

import 'modal.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtstd = TextEditingController();
  TextEditingController txtid = TextEditingController();

  TextEditingController atxtname = TextEditingController();
  TextEditingController atxtstd = TextEditingController();
  TextEditingController atxtid = TextEditingController();

  studentdata_provider? data;

  @override
  Widget build(BuildContext context) {
    data = Provider.of<studentdata_provider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Student Information"),backgroundColor: Colors.black, centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtname,
              decoration: InputDecoration(
                label: Text("Name"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtid,
              decoration: InputDecoration(
                label: Text("id"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtstd,
              decoration: InputDecoration(
                label: Text("std"),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                student_model s1 = student_model(
                    Id: txtid.text, Name: txtname.text, Std: txtstd.text);
                data!.add(s1);
                txtstd.clear();
                txtname.clear();
                txtid.clear();
              },
              child: Text("ADD"),style: ElevatedButton.styleFrom(backgroundColor: Colors.black87)),
          Expanded(
            child: Consumer<studentdata_provider>(
              builder: (context, value, child) => ListView.builder(
                itemCount: data!.storeStudentData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${data!.storeStudentData[index].Id}"),
                    title: Text("${data!.storeStudentData[index].Name}"),
                    subtitle: Text("${data!.storeStudentData[index].Std}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              data!.remove(index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                        IconButton(
                            onPressed: () {
                              atxtid = TextEditingController(
                                  text:
                                      "${data!.storeStudentData[index].Id}");
                              atxtname = TextEditingController(
                                  text:
                                      "${data!.storeStudentData[index].Name}");
                              atxtstd = TextEditingController(
                                  text:
                                      "${data!.storeStudentData[index].Std}");
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: atxtid,
                                      ),
                                      TextField(
                                        controller: atxtname,
                                      ),
                                      TextField(
                                        controller: atxtstd,
                                      ),
                                    ],
                                  ),
                                  actions: [

                                    ElevatedButton(
                                        onPressed: () {
                                          student_model s1 = student_model(
                                              Std: atxtstd.text,
                                              Name: atxtname.text,
                                              Id: atxtid.text);
                                          data!.update(index, s1);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Update"),style: ElevatedButton.styleFrom(backgroundColor: Colors.black87)),
                                  ],
                                ),
                              );
                            },
                            icon: Icon(Icons.edit),
                          color: Colors.green,
                        )

                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}
