import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sounfcloud clone',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/notif': (context) => const NotificationPage(),
        });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _pages = <Widget>[
    Home(),
    NotificationPage(),
    NotificationPage(),
    Home()
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _onItemTapped(index);
        },
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home_outlined,
              ),
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: "Stream",
            icon: Icon(Icons.thunderstorm_outlined),
            activeIcon: Icon(Icons.thunderstorm),
          ),
          BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.screen_search_desktop_outlined),
              activeIcon: Icon(Icons.screen_search_desktop_rounded)),
          BottomNavigationBarItem(
              label: "Library",
              icon: Icon(Icons.library_music_outlined),
              activeIcon: Icon(Icons.library_music_rounded)),
        ],
      ),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 110.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.downloading_outlined),
              onPressed: () {
                //Navigator.pushNamed(context, '/download');
              },
            ),
            const SizedBox(
              width: 10.0,
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none_outlined),
              onPressed: () {
                Navigator.pushNamed(context, '/notif');
              },
            ),
            const SizedBox(
              width: 10.0,
            ),
          ],
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('Home'),
          ),
        ),
        const SliverFixedExtentList(
          itemExtent: 340.0,
          delegate: SliverChildListDelegate.fixed([
            Recent(),
            Recent(),
            Recent(),
            Recent(),
            Recent(),
            Recent(),
            Recent(),
            Recent(),
            Recent(),
          ]),
        )
      ],
    );
  }
}

class Track extends StatelessWidget {
  const Track(
      {Key? key,
      required this.thumbnail,
      required this.title,
      required this.category})
      : super(key: key);

  final String thumbnail;
  final String title;
  final String category;

  @override
  Widget build(BuildContext context) {
    return (InkWell(
      onTap: () {},
      child: Ink(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                fit: BoxFit.cover,
                width: 170,
                height: 170,
                image: AssetImage(thumbnail),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Text(category)
        ]),
      ),
    ));
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text('Notifications',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0)),
          const SizedBox(
            height: 12.0,
          ),
          ListTile(
            leading: const CircleAvatar(backgroundColor: Colors.red),
            title: const Text('Ali followed you'),
            subtitle: const Text('3 months ago'),
            onTap: () {},
          ),
          ListTile(
            leading: const CircleAvatar(backgroundColor: Colors.blue),
            title: const Text('Maria mentioned you'),
            subtitle: const Text('2 weeks ago'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class Recent extends StatelessWidget {
  const Recent({Key? key}) : super(key: key);

  final String _category = "Recently Played";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12.0),
          child: Text(_category,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        (ListTracks(
          tracks: [
            Track(
              thumbnail: "../images/12stones.jpg",
              category: _category,
              title: "World So Cold",
            ),
            Track(
              thumbnail: "../images/22.jpg",
              category: _category,
              title: "World So Cold",
            ),
            Track(
              thumbnail: "../images/arianaGrande.jpg",
              category: _category,
              title: "No Tears Left To Cry",
            ),
            Track(
              thumbnail: "../images/imagineDragons.jpg",
              category: _category,
              title: "Radioactive",
            ),
            Track(
              thumbnail: "../images/la la la la.jpg",
              category: _category,
              title: "La La La La",
            ),
            Track(
              thumbnail: "../images/arianaGrande.jpg",
              category: _category,
              title: "One Last Time (accoustic cover)",
            ),
            Track(
              thumbnail: "../images/arianaGrande.jpg",
              category: _category,
              title: "One Last Time",
            ),
            Track(
              thumbnail: "../images/imagineDragons.jpg",
              category: _category,
              title: "Believers",
            ),
            Track(
              thumbnail: "../images/imagineDragons.jpg",
              category: _category,
              title: "Thunder",
            ),
            Track(
              thumbnail: "../images/imagineDragons.jpg",
              category: _category,
              title: "Natural",
            ),
          ],
        )),
      ],
    );
  }
}

class ListTracks extends StatelessWidget {
  const ListTracks({Key? key, required this.tracks}) : super(key: key);

  final List<Widget> tracks;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: tracks,
      ),
    );
  }
}
