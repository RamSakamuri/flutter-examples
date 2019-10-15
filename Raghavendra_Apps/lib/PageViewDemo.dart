import 'package:flutter/material.dart';

void main() => runApp(PageViewDemo());

class PageViewDemo extends StatelessWidget {
  List<String> images = [
    "https://lh3.googleusercontent.com/-AQ5cvxRlDeM/UnCm4WAN7oI/AAAAAAABWUU/Rivz5v13rUU/Portraits%2525209.jpg",
    "https://lh4.googleusercontent.com/-G15e_ZAvDvo/UnCl095YsxI/AAAAAAABVcY/kZESeMBcjGE/Portraits%25252010.jpg",
    "https://lh3.googleusercontent.com/-LZpnV-4zrEk/UnCmCb3lUZI/AAAAAAABWT4/9sJnjxLL18Y/Portraits%25252017.jpg",
    "https://lh4.googleusercontent.com/-uIyX8hxLboI/UnCmI-8gy_I/AAAAAAABWVc/deMOxBDuVsk/Portraits%25252020.jpg"
  ];
  PageController _controller =
      PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    final appTitle = "Sri Babuji";

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        backgroundColor: Colors.white,
        body:  SafeArea(child: buildFutureBuilderWidget()),
      ),
    );
  }

  PageView buildPageView() {
    return PageView(
      reverse: false,
      onPageChanged: (pageNumber) {
        print("page ${pageNumber + 1}");
      },
      scrollDirection: Axis.horizontal,
      controller: _controller,
      physics: BouncingScrollPhysics(),
      pageSnapping: true,
      children: <Widget>[
        Image.network(images[0]),
        Image.network(images[1]),
        Image.network(images[2]),
        Image.network(images[3])
      ],
    );
  }

  PageView buildPageViewUsingBuilder() {
    return PageView.builder(
      itemBuilder: (context, index) => Image.network(images[index]),
      itemCount: images.length,
      scrollDirection: Axis.horizontal,
      onPageChanged: (pageNum) {
        print("page ${pageNum + 1}");
      },
    );
  }

  Future<String> getDataFromRemote(){

    return Future.delayed(Duration(seconds: 3),()=>"Sample data");
  }

  Widget buildFutureBuilderWidget() {

    return FutureBuilder(

      future: getDataFromRemote(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done){
          return Center(
            child: Text(snapshot.data, style: TextStyle(
              fontSize: 35
            ),),
          );

        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
