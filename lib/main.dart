import 'package:bloc_example/main_app_bar/main_app_bar_btn.dart';
import 'package:bloc_example/model/search/search_word.dart';
import 'package:bloc_example/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SearchWordAdapter());
  await Hive.openBox<SearchWord>('search_word');
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(title: 'Home Page')),
  GoRoute(path: '/search', builder: (context, state) => const SearchPage()),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
    return Scaffold(
      appBar: AppBar(
        //상단 로고의 WIDTH
        leadingWidth: 100,
        backgroundColor: Colors.green,
        leading: const Center(
          child: Text(
            '상단 로고',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        title: const Center(
          child: Text(
            '프라임배송 / 바로배달',
            style: TextStyle(fontSize: 15),
          ),
        ),
        actions: [
          MainAppBarBtn(
            Icons.search,
            onTap: () => context.push('/search'),
          ),
          MainAppBarBtn(
            Icons.shopping_cart_outlined,
            onTap: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
