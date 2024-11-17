import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MusicPage(
                      onFavorite: (album) {
                        setState(() {
                          _favorites.add(album);
                        });
                      },
                    ),
                  ),
                );
              },
              child: const Text('Home'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesPage(favorites: _favorites),
                  ),
                );
              },
              child: const Text('Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}

class MusicPage extends StatefulWidget {
  final Function(String) onFavorite;

  const MusicPage({super.key, required this.onFavorite});

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final List<String> _albums = [
    '"Dark Side of the Moon" by Pink Floyd',
    '"Abbey Road" by The Beatles',
    '"Thriller" by Michael Jackson',
    '"Back in Black" by AC/DC',
    '"Rumours" by Fleetwood Mac',
    '"The Wall" by Pink Floyd',
    '"Led Zeppelin IV" by Led Zeppelin',
    '"Hotel California" by Eagles',
    '"The Joshua Tree" by U2',
    '"Born to Run" by Bruce Springsteen',
    '"Nevermind" by Nirvana',
    '"A Night at the Opera" by Queen',
    '"Appetite for Destruction" by Guns N\' Roses',
    '"1989" by Taylor Swift',
    '"To Pimp a Butterfly" by Kendrick Lamar',
    '"DAMN." by Kendrick Lamar',
    '"Random Access Memories" by Daft Punk',
    '"The Eminem Show" by Eminem',
    '"Future Nostalgia" by Dua Lipa',
    '"Lemonade" by Beyoncé'
  ];
  int _currentIndex = 0;

  void _likeAlbum() {
    widget.onFavorite(_albums[_currentIndex]);
  }

  void _nextAlbum() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _albums.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _albums[_currentIndex],
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: _likeAlbum,
              child: const Text('Like'),
            ),
            ElevatedButton(
              onPressed: _nextAlbum,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  final List<String> favorites;

  const FavoritesPage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favorites[index]),
          );
        },
      ),
    );
  }
}
