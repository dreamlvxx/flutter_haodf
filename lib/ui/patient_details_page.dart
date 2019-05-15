import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
        width: double.infinity,//最大化
        height: double.infinity,//最大化
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //靠左右两边绘制
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text("sad"),
            ),
            PatientDetail(),
            Stack(//可以重叠组件的view，类似于relativelayout
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  color: const Color(0xff666666),
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("stack",
                          style: TextStyle(
                              fontSize: 20, color: const Color(0xffff00ff)))),
                )
              ],
            )
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
  bool ifOff = true;
  var imageFile;
  Future getImage () async{
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = file;
    });
  }
  Future tajePhoto () async{
    var file = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = file;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,//从两边开始绘制
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
                Container(
                    height: 50.0,
                    alignment: Alignment.center,//内容对齐方式
                    width: double.infinity,
                    color: Colors.pink,
                    child: FlatButton(//扁平化的按钮
                        onPressed: () {
                          setState(() {
                            ifOff = !ifOff;
                          });
                        },
                        child: Text("第二个消失吧"))),
                Divider(//专用分割线
                  height: 1.0,
                  color: const Color(0xff00ffff),
                ),
                //在布局中，想让一个元素充满父布局的剩余空间，用Expand
                Expanded(
                  child: AnimatedOpacity(//可设置透明度的组件
                    opacity: ifOff ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        color: Colors.pink,
                        child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text("会消失的组件"))),
                  ),
                ),
                getImageView(imageFile),
                Row(
                  children: <Widget>[
                    FlatButton(
                      color: Colors.pink,
                      child: Text("相册选择"),
                      onPressed: (){
                        getImage();
                      },
                    ),
                    FlatButton(
                      color: Colors.pink,
                      child: Text("拍照"),
                      onPressed: (){
                        tajePhoto();
                      },
                    ),
                  ],
                ),


              ],
            )),
      ],
    );
  }
  Widget getImageView(imagepath){
    if(null == imagepath){
      return Center(
        child: Text("请选择照片"),
      );
    }else{
      return Center(
        child: Image.file(imagepath,height: 50),
      );
    }
  }
}
