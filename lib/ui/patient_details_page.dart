import 'package:flutter/material.dart';

class PatientDetailsPage extends StatelessWidget {
  String patientId;
  PatientDetailsPage({Key key, @required this.patientId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("患者详情页"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text("sad"),
            ),
            PatientDetail()
          ],
        ),
      ),
    );
  }
}

class PatientDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PatientDetail();
  }
}

class _PatientDetail extends State<PatientDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            height: 200.0,
            width: double.infinity,
            color: Colors.cyanAccent,
            child: Column(
              ////将子控件放在主轴的开始位置
              //  start,
              //  //将子控件放在主轴的结束位置
              //  end,
              //  //将子控件放在主轴的中间位置
              //  center,
              //  //将主轴空白位置进行均分，排列子元素，手尾没有空隙
              //  spaceBetween,
              //  //将主轴空白区域均分，使中间各个子控件间距相等，首尾子控件间距为中间子控件间距的一半
              //  spaceAround,
              //  //将主轴空白区域均分，使各个子控件间距相等
              //  spaceEvenly,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //container 中内容对齐方式用alignment属性
                Container(height: 50.0,alignment: Alignment.center,width: double.infinity,color: Colors.pink, child: Text("第一个")),
                //在布局中，想让一个元素充满父布局的剩余空间，用Expand
                Expanded(
                  //double.infinity 会强制让一个元素充满
                  child: Container(width: double.infinity,color: Colors.yellow, child: Text("第二个")),
                )
              ],
            )),
      ],
    );
  }
}
