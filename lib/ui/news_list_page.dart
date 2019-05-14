import 'package:flutter/material.dart';
import 'patient_details_page.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class NewPage extends StatefulWidget {
  String groupId;

  @override
  State<StatefulWidget> createState() {
    return new _NewPage();
  }

  NewPage({Key key, @required this.groupId}) : super(key: key);
}

class _NewPage extends State<NewPage> with SingleTickerProviderStateMixin {
  GlobalKey<RefreshHeaderState> _globalKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _fooKey = new GlobalKey();
  ScrollController _scrollController = ScrollController();
  List data = new List();
  TabController mTabController;
  var mTabs = <Tab>[
    Tab(text: "TAB1"),
    Tab(text: "TAB2"),
    Tab(text: "TAB3"),
    Tab(text: "TAB4"),
    Tab(text: "TAB5"),
    Tab(text: "TAB6"),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        onLoad();
      }
    });
    mTabController =
        TabController(initialIndex: 2, length: mTabs.length, vsync: this);
    getData();
  }

  Future getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        data = List.generate(15, (i) => '哈喽,我是原始数据 $i');
      });
    });
  }


  Future<void> onRefresh()  async{
     await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        data = List.generate(20, (i) => '哈喽,我是新刷新的 $i');
      });
    });
  }

  Future<void> onLoad()  async{
     await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        data.addAll(List.generate(20, (i) => '哈喽,我是新加载的 $i'));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("患者列表"),
      ),
      body: Container(
        child: DefaultTabController(
            length: mTabs.length,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false, //去掉appbar左边的leading位置的图标
                backgroundColor: Colors.green,
                title: TabBar(
                  controller: mTabController,
                  tabs: mTabs,
                  isScrollable: true,
                  indicatorColor: Colors.red,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 1,
                  labelColor: Colors.red,
                  labelStyle: TextStyle(fontSize: 15.0),
                  unselectedLabelColor: Colors.brown,
                  unselectedLabelStyle: TextStyle(fontSize: 10.0),
                ),
              ),
              body: TabBarView(
                  controller: mTabController,
                  children: mTabs
                      .map((Tab tab) => Container(
                              child: EasyRefresh(
                                refreshHeader: ClassicsHeader(
                                  key: _globalKey,
                                  refreshedText: "刷新完成了..",
                                  refreshReadyText: "即将刷新了。。",
                                  refreshingText: "正在刷新啊..",
                                ),
                                refreshFooter: ClassicsFooter(
                                  key: _fooKey,
                                  loadedText: "加载完成了。。",
                                  loadingText: "正在加载啊。。",
                                  loadReadyText: "即将加载了。。",
                                ),
                                onRefresh: onRefresh,
                                loadMore: onLoad,
                                child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (BuildContext context,int pos){
                                  return getRow(tab.text, pos);
                                }),
                              )))
                      .toList()),
            )),
      ),
    );
  }

  Widget getRow(String name, int pos) {
    if(pos == data.length){
      return _getMoreWidget();
    }
    return new Padding(
      padding: const EdgeInsets.all(3.0),
      child: RaisedButton(
          child: Text(data[pos]),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) =>
                        PatientDetailsPage(patientId: "234567")));
          }),
    );
  }

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...     ',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(strokeWidth: 1.0,)
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    mTabController.dispose();
    _scrollController.dispose();
  }
}
