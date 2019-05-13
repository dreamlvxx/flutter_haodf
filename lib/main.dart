import 'package:flutter/material.dart';
import 'package:flutter_lxxfirst/ui/second.dart';
import 'dart:developer';

void main() => runApp(MyApp());

String secondName = "";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        "one": (BuildContext context) => new MyApp(),
        "two": (BuildContext context) => new SecondPage(message: secondName),
      },
      title: '111Welcome to Flutter',
      home: Scaffold(
          bottomNavigationBar: BottomNavigatorWidget(),
          appBar: AppBar(
            title: Text('X_Demo'),
          ),
          body: Container(
            child: ListView(
              //使用这个保证小手机展示不下，自动滑动
              children: <Widget>[
                Image.asset(
                  "images/first.jpg",
                  width: 600.0,
                  height: 240.0,
                  fit: BoxFit.cover,
                ),
                FirstRow(),
                SecondRow(),
                SecondRow(),
                SecondRow(),
                SecondRow(),
                SixthRow(),
              ],
            ),
          )),
    );
  }
}

class BottomNavigatorWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BottomNavigatorWidget();
  }
}

class _BottomNavigatorWidget extends State<BottomNavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    Column buildBottomBtn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: new Icon(icon, color: color),
            padding: const EdgeInsets.all(3.0),
          ),
          new Container(
            padding: const EdgeInsets.all(3.0),
            margin: const EdgeInsets.only(top: 1.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      color: Colors.cyanAccent,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          buildBottomBtn(Icons.email, "邮件"),
          buildBottomBtn(Icons.phone, "通讯录"),
          buildBottomBtn(Icons.account_balance_wallet, "钱包")
        ],
      ),
    );
  }
}

class SixthRow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SixthRow();
  }
}

class _SixthRow extends State<SixthRow> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "这是提示文案"),
        ),
        RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              child: AlertDialog(
                title: Text("this is title"),
                content: Text(controller.text),
              ),
            );
          },
          child: Text("done"),
        )
      ],
    );
  }
}

class FourRow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FourRowState("s");
  }
}

class _FourRowState extends State<FourRow> {
  _FourRowState(String id);

  List<Container> list = List<Container>.generate(
      20,
      (int index) => Container(
            child: Icon(Icons.access_alarms),
          ));

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list,
    );
  }
}

class ThirdRow extends StatefulWidget {
  List<Widget> buildList(int num) {
    return List<Container>.generate(
        num,
        (int index) => Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xffffff00), width: 3.0)),
              child: Image.asset("images/first.jpg"),
            ));
  }

  @override
  State<StatefulWidget> createState() {
    return _ThirdRowState();
  }
}

class _ThirdRowState extends State<ThirdRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
        ],
      ),
    );
  }
}

class SecondRow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondRowState();
  }
}

class _SecondRowState extends State<SecondRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black26),
      margin: const EdgeInsets.all(8.0),
      child: Row(
        //平均分配空间
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              child: RaisedButton(
            child: Text("点击调第二页"),
            onPressed: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => SecondPage(message: "给你数据")));
              secondName = "newName";
              startSecond();
            },
          )),
          Expanded(flex: 1, child: Text("asd")),
          Expanded(
            flex: 1,
            child: Text("sf"),
          ),
        ],
      ),
    );
  }

  void startSecond() async {
    var result = await Navigator.of(context).pushNamed("two");
    Scaffold.of(context)
        .showSnackBar(new SnackBar(content: new Text("$result")));
  }

  void startSecond2() {
    Navigator.of(context).pushNamed("two").then((result) {
      Scaffold.of(context)
          .showSnackBar(new SnackBar(content: new Text("$result")));
    });
  }
}

class FirstRow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstRowState();
  }
}

class _FirstRowState extends State<FirstRow> {
  bool isFavorite = true;
  int num = 10;

  void clickFavorite() {
    setState(() {
      if (isFavorite) {
        ++num;
        isFavorite = false;
      } else {
        --num;
        isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(8.0),
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //Expand会使空间尽量利用父布局中的剩余空间
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(left: 10.0, bottom: 8.0, top: 10.0),
                  child: Text(
                    "this is ths first time i learn flutter",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: const Color(0xffff7800),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Text(
                    "i found that flutter is funny",
                    style: TextStyle(
                        fontSize: 20.0, color: const Color(0xff00ffff)),
                  ),
                ),
              ],
            ),
          ),
          new Container(
              margin: new EdgeInsets.only(left: 20.0),
              child: new IconButton(
                  icon: (isFavorite
                      ? Icon(Icons.star_border)
                      : new Icon(Icons.star)),
                  color: Colors.red,
                  onPressed: clickFavorite)),
          new Container(
            width: 50.0,
            margin: new EdgeInsets.only(right: 20.0),
            child: Row(
              children: <Widget>[
                new Text(
                  "$num",
                  style: new TextStyle(
                      fontSize: 30.0, color: const Color(0xff000000)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//---------------------------------------------------------------------------------------------------------------
class MyFirstWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyFirstWidgetState();
  }
}

class MyFirstWidgetState extends State<MyFirstWidget> {
  String textToShow = "I Like Flutter";

  //方法写在build里面是无法生效的!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  void _updateText() {
    setState(() {
      // update the text
      textToShow = "Flutter is Awesome!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("title"),
      ),
      body: new Center(child: new Text(textToShow)),
      floatingActionButton: new FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'hahaaha',
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  void initState() {
    super.initState();
  }

  void _toggleFavorite() {
    setState(() {
      // If the lake is currently favorited, unfavorite it.
      if (_isFavorited) {
        //利用debugger断点
        debugger(when: _isFavorited);
        _favoriteCount -= 1;
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_isFavorited
                ? new Icon(Icons.star)
                : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}

class TapBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TapBoxState();
  }
}

class _TapBoxState extends State<TapBox> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style:
                new TextStyle(fontSize: 32.0, color: const Color(0xfff5655f)),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        margin: const EdgeInsets.only(),
      ),
    );
  }
}
