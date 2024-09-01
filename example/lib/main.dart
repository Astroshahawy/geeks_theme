import 'package:flutter/material.dart';
import 'package:geeks_theme/geeks_theme.dart';
import 'package:geeks_theme/theme/theme_initialize.dart';

import 'color_extention.dart';

var colorDark = const ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFd0bcff),
  onPrimary: Color(0xFF381e73),
  primaryContainer: Color(0xFF4f378b),
  onPrimaryContainer: Color(0xFFeaddff),
  secondary: Color(0xFFcbc2db),
  onSecondary: Color(0xFF332d41),
  secondaryContainer: Color(0xFF4a4458),
  onSecondaryContainer: Color(0xFFe8def8),
  tertiary: Color(0xFFefb8c8),
  onTertiary: Color(0xFF4a2532),
  tertiaryContainer: Color(0xFF633b48),
  onTertiaryContainer: Color(0xFFffd8e4),
  error: Color(0xFFf2b8b5),
  onError: Color(0xFF601410),
  errorContainer: Color(0xFF8c1d18),
  onErrorContainer: Color(0xFFf9dedc),
  background: Colors.red,
  onBackground: Color(0xFFe6e1e5),
  surface: Color(0xFF1c1b1e),
  onSurface: Color(0xFFe6e1e5),
  surfaceVariant: Color(0xFF49454f),
  onSurfaceVariant: Color(0xFFcac4cf),
  outline: Color(0xFF948f99),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeInitialize.instance;
  runApp(GeeksThemeProvider(
      themeDataProvider: GeeksTheme(
        // useMaterial3: true,
        useSeed: true,
        // darkSeedSchemeColor: ColorScheme.fromSeed(seedColor: Colors.red).fromColorSchemeTo(colorDark),

        // lightColorScheme: const ColorScheme.light(),
        darkColorScheme: colorDark,
        // textTheme: (textTheme) => GoogleFonts.tajawalTextTheme(textTheme),
        themeChangeApp: (color) => ThemeData(
          extensions: [
            ColorTheme(
              primaryColor: color.primary,
              secondaryColor: color.secondary,
            )
          ],
          appBarTheme: AppBarTheme(backgroundColor: color.primary),
        ),
      ),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: context.readTheme().themeDataProvider.darkTheme,
      theme: context.readTheme().themeDataProvider.lightTheme,
      themeMode: context.readTheme().currentThemeMode,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const bottomNavPages = <Widget>[
      Scaffold(),
      Scaffold(),
      Scaffold(),
      Scaffold(),
    ];
    // final ColorTheme myColors = Theme.of(context).extension<ColorTheme>()!;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 60,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dark_mode),
            label: 'data',
          ),
          NavigationDestination(
            icon: Icon(Icons.dark_mode),
            label: 'data',
          ),
          NavigationDestination(
            icon: Icon(Icons.dark_mode),
            label: 'data',
          ),
          NavigationDestination(
            icon: Icon(Icons.dark_mode),
            label: 'data',
          ),
        ],
        onDestinationSelected: (r) {},
        selectedIndex: 0,
      ),
      appBar: AppBar(
        // backgroundColor: myColors.primaryColor,
        title: IconButton(
          icon: const Icon(Icons.account_tree_outlined),
          onPressed: () {
            context.readTheme().updateThemeMode(ThemeMode.dark);
            // GeeksThemeRead.of(context)?.updateThemeMode(ThemeMode.light);
          },
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
