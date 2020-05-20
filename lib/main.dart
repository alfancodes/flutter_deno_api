import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deno_api/quote_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Quote quote;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'Flutter Deno API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          onTap: () async => {
            await Quote.connectToAPI().then((value) {
              print('Tapped');
              quote = value;
              setState(() {});
            })
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.orangeAccent),
            padding: EdgeInsets.all(11.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    (quote != null) ? quote.quote : 'No data',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 28,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 21.0),
                    child: Text(
                      '"' + quote.author + '"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
