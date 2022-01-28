import 'package:daynight/theme-manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        title: 'Day Night',
        debugShowCheckedModeBanner: false,
        theme: theme.getThemeData(),
        themeMode: ThemeMode.system,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier theme = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  theme.setLightMode();
                },
                child: Text('Light 🌞'),
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  theme.setDarkMode();
                },
                child: Text('Dark 🌙'),
              ),
            ],
          ),
          TextButton(
              onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Next();
                  })),
              child: Text('Next 👉️'))
        ],
      ),
    );
  }
}

class Next extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeNotifier theme = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  theme.setLightMode();
                },
                child: Text('Light 🌞'),
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  theme.setDarkMode();
                },
                child: Text('Dark 🌙'),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back 👈️'),
          ),
        ],
      ),
    );
  }
}
