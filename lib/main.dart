import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MyScreen(title: 'Home', icon: Icons.home),
    const MyScreen(title: 'Downloads', icon: Icons.download),
    const MyScreen(title: 'Favorites', icon: Icons.favorite),
    const MyScreen(title: 'Uploads', icon: Icons.upload),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: MyBottomAppBar(
        notchMargin: 6.0,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key, required this.title, required this.icon}) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Scaffold(
          appBar: AppBar(
            title: Text(title , textAlign: TextAlign.center,),
            centerTitle: true,
          ),
          body: Center(
            child: Icon(icon, size: 48), // Adjust the size as per your preference
          ),
      ),
    );
  }
}

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({Key? key, required this.currentIndex, required this.onTap, required double notchMargin, required CircularNotchedRectangle shape, required Clip clipBehavior}) : super(key: key);

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 6.0,
      shape: CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => onTap(0),
            color: currentIndex == 0 ? Theme.of(context).primaryColor : null,
          ),
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () => onTap(1),
            color: currentIndex == 1 ? Theme.of(context).primaryColor : null,
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => onTap(2),
            color: currentIndex == 2 ? Theme.of(context).primaryColor :
               null,
          ),
          IconButton(
            icon: Icon(Icons.upload),
            onPressed: () => onTap(3),
            color: currentIndex == 3 ? Theme.of(context).primaryColor : null,
          ),
        ],
      ),
    );
  }
}