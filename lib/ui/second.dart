import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_lxxfirst/entity/Animal.dart';
import 'package:flutter_lxxfirst/entity/patient.dart';
import 'news_list_page.dart';

// ignore: must_be_immutable
class SecondPage extends StatefulWidget {
  String message;

  SecondPage({Key key, @required this.message}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SecondPage();
  }
}

class _SecondPage extends State<SecondPage> {
  var msg = "";

  @override
  void initState() {
    super.initState();
    getHttpInstance(context);
    print("====11" + msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Router页面"),
      ),
      body: Container(
          width: double.infinity, height: double.infinity, child: MyWidget()),
    );
  }

  getHttpInstance(BuildContext context) async {
    Dio dio = Dio();
    Response response = await dio.get("http://www.baidu.com");
    print("====22" + msg);
    setState(() {
      msg = response.toString().substring(0, 10);
    });
  }
}

class MyWidget extends StatelessWidget {
  final String mes;
  final String name;

  MyWidget({this.mes = "", this.name = "x"});

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(color: Colors.blue),
        child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 10.0, color: Colors.black38),
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0))),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "$mes",
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.pinkAccent),
                        ))),
              ),
              RaisedButton(
                  child: Text("返回第一页"),
                  onPressed: () {
                    Navigator.pop(context, "这是返回结果");
                  }),
              RaisedButton(
                child: Text("点击去详情页面"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPage(groupId: "123456"),
                      ));
                },
              )
            ]));
  }
}

class Http {
  var context;

  Http(BuildContext context) {
    this.context = context;
  }

  void getJson() {
    Patient p = Patient("sss", "192843442", "123512545", Animal("ttt", "sss"),
        Tiger("tiger333", "tiger55"));
    String pJson = json.encode(p);
    var patient = Patient.fromJson(json.decode(pJson));
    print("phont =" +
        patient.phone +
        " id=" +
        patient.id +
        " name=" +
        patient.name +
        " animal name=" +
        patient.animal.name +
        " animal sex =" +
        patient.animal.sex +
        " tiger yyy =" +
        patient.tiger.yyy +
        " tiger sss=" +
        patient.tiger.sss);
  }

  void postHttp(BuildContext context) async {
    Dio dio = Dio();
    var list = List();
    for (int i = 0; i <= 10; i++) {
      list[i] = i.toString() + "sad";
    }
    list.add("String");
    var map = Map<int, String>();
    for (int i = 0; i < 10; i++) {
      map[i] = "asd" + i.toString();
    }
    map[9] = "sad";
    int.parse("asd");
    var map2 = Map.castFrom(map);
    for (int i = 0; i <= 10; i++) {
      map2[i] = i.toString() + "sad";
    }
    Response res = await dio.post("/patient...", data: map);
  }
}
