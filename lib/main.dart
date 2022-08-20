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
    const Home(),
    const Stream(),
    const NotificationPage(),
    const Home()
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
            icon: Icon(Icons.flash_on),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
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

class Stream extends StatelessWidget {
  const Stream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverAppBar(
        pinned: true,
        expandedHeight: 110.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('Stream'),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          TrackStream(
              username: "User1",
              avatar: "avatar1.png",
              thumbnail: "22.jpg",
              title: "Taylor Swift - 22"),
          TrackStream(
              username: "User2",
              avatar: "avatar2.jpg",
              thumbnail: "12stones.jpg",
              title: "12stones - World So Cold"),
          TrackStream(
              username: "User3",
              avatar: "avatar2.jpg",
              thumbnail: "12stones.jpg",
              title: "12stones - World So Cold"),
          TrackStream(
              username: "User4",
              avatar: "avatar1.png",
              thumbnail: "arianaGrande.jpg",
              title: "Ariana Grande - No Tears Left To Cry"),
          TrackStream(
              username: "User5",
              avatar: "avatar1.png",
              thumbnail: "arianaGrande.jpg",
              title: "Ariana Grande - No Tears Left To Cry"),
        ]),
      ),
    ]);
  }
}

class TrackStream extends StatelessWidget {
  TrackStream(
      {Key? key,
      required this.username,
      required this.avatar,
      required this.thumbnail,
      required this.title})
      : super(key: key);
  String avatar, username, thumbnail, title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Ink(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      child: Image(
                    image: AssetImage("../images/$avatar"),
                  )),
                  const SizedBox(
                    width: 7.0,
                  ),
                  Text(username),
                  const Text(" posted a track . n months ago"),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Stack(
                children: [
                  Container(
                      constraints: const BoxConstraints(
                        minWidth: 370,
                        minHeight: 370,
                      ),
                      child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("../images/$thumbnail"))),
                  Positioned(
                      bottom: 25,
                      left: 25,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " $title ",
                              style: const TextStyle(
                                  backgroundColor: Colors.black,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Text(" $username ",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    backgroundColor: Colors.black,
                                    color: Colors.white,
                                    fontSize: 20)),
                            Container(
                              color: Colors.black,
                              child: Row(
                                children: const [
                                  Icon(Icons.play_arrow),
                                  Text(" 21633 ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ],
                              ),
                            ),
                          ] //views
                          ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LikesRepost(),
                  IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      showModalBottomSheet<dynamic>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return TrackMore(
                                title: title,
                                username: username,
                                avatar: avatar);
                          });
                    },
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class LikesRepost extends StatefulWidget {
  const LikesRepost({Key? key}) : super(key: key);

  @override
  State<LikesRepost> createState() => _LikesRepostState();
}

class _LikesRepostState extends State<LikesRepost> {
  int _likes = 0; //underscore for privacy
  int _reposts = 0;
  bool _liked = false;
  bool _reposted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              icon: _liked
                  ? const Icon(
                      Icons.thumb_up_alt,
                      color: Colors.orange,
                    )
                  : const Icon(Icons.thumb_up_alt_outlined),
              onPressed: () {
                setState(() {
                  _liked ? _likes -= 1 : _likes += 1;
                  _liked = !_liked;
                });
              },
            ),
            Text(_likes.toString()),
          ],
        ),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _reposted ? _reposts -= 1 : _reposts += 1;
                    _reposted = !_reposted;
                  });
                },
                icon: _reposted
                    ? const Icon(
                        Icons.share,
                        color: Colors.orange,
                      )
                    : const Icon(
                        Icons.share_outlined,
                      )),
            Text(_reposts.toString()),
          ],
        ),
      ],
    );
  }
}

class TrackMore extends StatelessWidget {
  TrackMore({
    Key? key,
    required this.avatar,
    required this.title,
    required this.username,
  }) : super(key: key);

  String avatar;
  String title;
  String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: CircleAvatar(
              child: Image(
                  fit: BoxFit.contain, image: AssetImage("../images/$avatar"))),
          title: Text(title),
          subtitle: Text(username),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            InkWell(
                onTap: () {},
                child: Ink(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.copy,
                        size: 45,
                      ),
                      Text("Copy Link")
                    ],
                  ),
                )),
            InkWell(
                onTap: () {},
                child: Ink(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.facebook,
                        size: 45,
                      ),
                      Text("Messenger")
                    ],
                  ),
                )),
            InkWell(
                onTap: () {},
                child: Ink(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.sms_outlined,
                        size: 45,
                      ),
                      Text("SMS")
                    ],
                  ),
                )),
            InkWell(
                onTap: () {},
                child: Ink(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.more_horiz,
                        size: 45,
                      ),
                      Text("More")
                    ],
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            InkWell(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(Icons.favorite_outline),
                    title: Text("Like"))),
            InkWell(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(Icons.playlist_add),
                    title: Text("Add to playlist"))),
            InkWell(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(Icons.playlist_play),
                    title: Text("Add to next up"))),
            InkWell(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(Icons.read_more_outlined),
                    title: Text("Repost on Soundcloud"))),
            InkWell(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(Icons.sensors),
                    title: Text("Start station"))),
            InkWell(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text("Go to artist profile"))),
            InkWell(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(Icons.waves_outlined),
                    title: Text("Behind this track"))),
            InkWell(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(Icons.comment_outlined),
                    title: Text("View comments"))),
            InkWell(
                onTap: () {},
                child: const ListTile(
                    leading: Icon(Icons.flag_outlined), title: Text("Report"))),
          ],
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
