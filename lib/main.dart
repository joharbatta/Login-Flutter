import 'package:flutter/material.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.bluel
      ),
    );
  }
}

class LoginPage extends StatefulWidget
{
  @override
  State createState() => ne w LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin
{
  AnimationController _iconAnimatiomController;
  Animation<double> _iconAnimation;
  @override
  void initState()
  {
    super.initState();
    _iconAnimatiomController=new AnimationController(
        vsync: this,
      duration: new Duration(milliseconds: 500)

    );
    _iconAnimation=new CurvedAnimation(
      parent: _iconAnimatiomController,
      curve: Curves.easeOut
    );
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimatiomController.forward();
  }


  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
      backgroundColor: Colors.blueAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/bg.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value*100,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal,
                        fontSize: 20
                      )
                    )
                  ),
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center ,
                    children: <Widget>[
                       new TextFormField(
                         decoration: new InputDecoration(
                          labelText: "Enter Email",

                        ),
                        keyboardType: TextInputType.emailAddress ,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Password",

                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true ,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                      ),
                      new MaterialButton(
                        height: 40,
                        minWidth: 60,
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: new Text("Login") ,
                        onPressed: ()=>{},
                        splashColor: Colors.redAccent,
                      )
                    ],
              ),
                  ),
                ),

              )
            ],
          )

        ],
      ),
    );
  }

}

