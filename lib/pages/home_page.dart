import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:localization1/localization/locales.dart';
import 'package:localization1/pages/register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      // supportedLocales: Loc3.all,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late FlutterLocalization _flutterLocalization;
  late String _currentLocale;

  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //App design and logo
            const Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.location_on_outlined, size: 90),
                    SizedBox(width: 20),
                    Text("FindSport", style: TextStyle(fontSize: 60)),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(LocalData.title.getString(context)),
                    Text(context.formatString(LocalData.body, ["FindSport"]), style: TextStyle(fontSize: 20)),
                  ],
                ),

                //To select languages, dropdown button
                DropdownButton<String>(
                  value: _currentLocale,
                  items: const [
                    DropdownMenuItem(
                      value: "en",
                      child: Text("English"),
                    ),
                    DropdownMenuItem(
                      value: "ru",
                      child: Text("Russian"),
                    ),
                    DropdownMenuItem(
                      value: "uz",
                      child: Text("Uzbek"),
                    ),
                  ],
                  onChanged: (String? value) {
                    _setLocale(value);
                  },
                ),
                const SizedBox(height: 20),
                //Icon button to open register page
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage(showLoginPage: () {  },)));
                  },
                  icon: const Icon(Icons.arrow_circle_right_outlined, size: 80),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //To choose and set language
  void _setLocale(String? value) {
    if (value == 0) return;
    if (value == "en") {
      _flutterLocalization.translate("en");
    } else if (value == "ru") {
      _flutterLocalization.translate("ru");
    } else if (value == "uz") {
      _flutterLocalization.translate("uz");
    } else {
      return;
    }
    setState(() {
      _currentLocale = value!;
    });
  }
}
