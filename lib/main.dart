/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/Home',
      routes: <String, WidgetBuilder>{
        '/Home': (context) => const MyHomePage(title: 'Home'),
        '/Downloads': (context) => const MyDownloadsPage(title: 'Downloads'),
        '/Favorites': (context) => const MyFavoritesPage(title: 'Favorites'),
        '/Uploads': (context) => const MyUploadsPage(title: 'Uploads'),
      
      },
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Text('Home Screen Content'),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6.0,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context, '/Home');
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.pushNamed(context, '/Favorites');
              },
            ),
            IconButton(
              icon: Icon(Icons.download),
              onPressed: () {
                Navigator.pushNamed(context, '/Downloads');
              },
            ),
            IconButton(
              icon: Icon(Icons.upload),
              onPressed: () {
                Navigator.pushNamed(context, '/Uploads');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyUploadsPage extends StatefulWidget {
  const MyUploadsPage({super.key, required this.title});

  final String title;

@override
  State<MyUploadsPage> createState() => _MyUploadsPageState();
}

class _MyUploadsPageState extends State<MyUploadsPage> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // Handle "more" button press
            },
            icon: Icon(Icons.upload),
          ),
        ],
      ),
      body: Center(
      child: Icon(Icons.upload, size: 48), // Adjust the size as per your preference
    ),
    );
  }
}

class MyFavoritesPage extends StatefulWidget {
  const MyFavoritesPage({super.key, required this.title});

  final String title;

@override
  State<MyFavoritesPage> createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // Handle "more" button press
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Center(
      child: Icon(Icons.favorite, size: 48), // Adjust the size as per your preference
    ),
    );
  }
}

class MyDownloadsPage extends StatefulWidget {
  const MyDownloadsPage({super.key, required this.title});


  
  final String title;

@override
  State<MyDownloadsPage> createState() => _MyDownloadsPageState();
}

class _MyDownloadsPageState extends State<MyDownloadsPage> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
       appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // Handle "more" button press
            },
            icon: Icon(Icons.download),
          ),
        ],
      ),
      body: Center(
      child: Icon(Icons.download, size: 48), // Adjust the size as per your preference
    )
    );
  }
}*/
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Icon(icon, size: 48), // Adjust the size as per your preference
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