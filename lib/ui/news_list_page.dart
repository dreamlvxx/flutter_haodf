import 'package:flutter/material.dart';
import 'patient_details_page.dart';

class NewPage extends StatefulWidget {
  String groupId;

  @override
  State<StatefulWidget> createState() {
    return new _NewPage();
  }

  NewPage({Key key, @required this.groupId}) : super(key: key);
}

class _NewPage extends State<NewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("患者列表"),
      ),
      body: new ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int pos) {
            return getRow(pos);
          }),
    );
  }

  Widget getRow(int pos) {
    return new Padding(
      padding: const EdgeInsets.all(3.0),
      child: RaisedButton(
          child: Text("患者" + pos.toString()),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => PatientDetailsPage(patientId: "234567")));
          }),
    );
  }
}
