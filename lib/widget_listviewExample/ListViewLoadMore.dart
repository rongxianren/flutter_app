import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  @override
  State createState() {
    return _ListViewState();
  }
}

class _ListViewState extends State<ListViewWidget> {
  List<int> items = List.generate(10, (i) => i);

  ScrollController _scrollController = ScrollController();
  bool isPerformingRequest = false;

  ///是否有请求正在进行

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() async {
    if (!isPerformingRequest) {
      setState(() {
        isPerformingRequest = true;
      });
      List<int> newEntries = await fakeRequest(items.length, items.length + 10);
      setState(() {
        items.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite ListView'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == items.length) {
            return _buildProgressIndicator();
          } else {
            return ListTile(
              title: Text("Number $index"),
            );
          }
        },
        itemCount: items.length + 1,
        controller: _scrollController,
      ),
    );
  }

  Future<List<int>> fakeRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
    });
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
