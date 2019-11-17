import 'package:asistencia/asistentes_detalle.dart';
import 'package:asistencia/footer.dart';
import 'package:asistencia/home.dart';
import 'package:asistencia/login.dart';
import 'package:asistencia/models/user.dart';
import 'package:asistencia/profile.dart';
import 'package:asistencia/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:permission/permission.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UserProvider(
      user: UserModel(nombre: "Pepito", esInstructor: true),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.orange,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          ),
        ),
        // home: MyHomePage(title: 'Asistencias'),
        home: LoginPage(),
        routes: {
          '/home': (context) => MyHomePage(title: "Asistencia"),
          '/asistentes': (context) => AsistentesDetallePage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _position = 0;

  PageController _pageController = PageController(initialPage: 0);

  List<Widget> _views = [
    Home(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.alarm),
            onPressed: () {},
          ),
        ],
        // tr: IconButton(icon: Icon(Icons.alarm), onPressed: (){},),
      ),

      body: PageView.builder(
        controller: _pageController,
        itemCount: _views.length,
        onPageChanged: (position) async {
          print("$position");
          setState(() {
            _position = position;
          });
          if (position == 1) {
            var status =
                await Permission.getPermissionsStatus([PermissionName.Camera]);

            if (status.first.permissionStatus == PermissionStatus.deny ||
                status.first.permissionStatus == PermissionStatus.notDecided) {
              var status2 =
                  await Permission.requestPermissions([PermissionName.Camera]);

              if (status2.first.permissionStatus == PermissionStatus.deny) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Neceisto la camara"),
                ));
              }
            }
          }
        },
        itemBuilder: (buildContext, position) {
          switch (position) {
            case 0:
              return Home();
            case 1:
              return Profile();
            default:
              return Home();
          }
        },
      ),

      floatingActionButton: Visibility(
        visible: _position == 0 && UserProvider.of(context).user.esInstructor,
        child: Footer(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        onTap: (position) {
          setState(() {
            _position = position;
            _pageController.animateToPage(
              _position,
              duration: Duration(seconds: 1),
              curve: ElasticInCurve(),
            );
          });
        },
        currentIndex: _position,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), title: Text("Profile")),
        ],
      ),
    );
  }
}
