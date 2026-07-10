import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const AziziTaranyApp());
}

class Tarana {
  const Tarana({
    required this.title,
    required this.url,
  });

  final String title;
  final String url;
}

const String _baseUrl =
    'https://raw.githubusercontent.com/jano8000998-wq/azizi-tarany/main/assets/audio';

const List<Tarana> tarany = [
  Tarana(
    title: 'آخر مي درنه تاؤ کړله لاسونه شهادته',
    url: '$_baseUrl/01.mp3',
  ),
  Tarana(
    title: 'آفرين ګرانه په تاريخ دي جهان فخر',
    url: '$_baseUrl/02.mp3',
  ),
  Tarana(
    title: 'اتل اتل باتور باتور شهيد منصور',
    url: '$_baseUrl/03.mp3',
  ),
  Tarana(
    title: 'اتله قهرمانه غيرت من حاجي منانه',
    url: '$_baseUrl/04.mp3',
  ),
  Tarana(
    title: 'اختره چي راځې نو خوشحالي درسره',
    url: '$_baseUrl/05.mp3',
  ),
  Tarana(
    title: 'ازادی ستا د راتلو مبارک مبارک',
    url: '$_baseUrl/06.mp3',
  ),
  Tarana(
    title: 'الفتح عملياتو ته د خدای په نوم',
    url: '$_baseUrl/07.mp3',
  ),
  Tarana(
    title: 'انقلاب دی آوښتون دی مستقيم',
    url: '$_baseUrl/08.mp3',
  ),
  Tarana(
    title: 'اوښکي دي پر قبر تويوم چي تاته راغلم',
    url: '$_baseUrl/09.mp3',
  ),
  Tarana(
    title: 'اولس دي له اختر او ازادی خوندونه',
    url: '$_baseUrl/10.mp3',
  ),
];

class AziziTaranyApp extends StatelessWidget {
  const AziziTaranyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Azizi Tarany',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0B4A3A),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7F6),
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
  final AudioPlayer _player = AudioPlayer();

  String _query = '';
  int? _currentIndex;
  bool _loading = false;

  List<MapEntry<int, Tarana>> get _filtered {
    final q = _query.trim().toLowerCase();

    return tarany.asMap().entries.where((entry) {
      return q.isEmpty ||
          entry.value.title.toLowerCase().contains(q);
    }).toList();
  }

  Future<void> _play(int index) async {
    try {
      if (_currentIndex == index) {
        if (_player.playing) {
          await _player.pause();
        } else {
          await _player.play();
        }

        if (mounted) {
          setState(() {});
        }
        return;
      }

      setState(() {
        _loading = true;
        _currentIndex = index;
      });

      await _player.setUrl(tarany[index].url);
      await _player.play();
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'آډیو ونه چلېده: $e',
            textDirection: TextDirection.rtl,
          ),
          duration: const Duration(seconds: 6),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  String _formatDuration(Duration value) {
    final minutes =
        value.inMinutes.remainder(60).toString().padLeft(2, '0');

    final seconds =
        value.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = _filtered;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // COVER PHOTO
            Container(
              width: double.infinity,
              height: 190,
              margin: const EdgeInsets.fromLTRB(12, 12, 12, 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 12,
                    offset: Offset(0, 5),
                    color: Colors.black26,
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/images/cover.png',
                fit: BoxFit.cover,
              ),
            ),

            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 8),
              child: TextField(
                textDirection: TextDirection.rtl,
                onChanged: (value) {
                  setState(() {
                    _query = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'ترانه ولټوئ...',
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // TARANY LIST
            Expanded(
              child: items.isEmpty
                  ? const Center(
                      child: Text(
                        'کومه ترانه ونه موندل شوه',
                        textDirection: TextDirection.rtl,
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                      itemCount: items.length,
                      separatorBuilder: (_, __) {
                        return const SizedBox(height: 6);
                      },
                      itemBuilder: (context, i) {
                        final entry = items[i];
                        final index = entry.key;
                        final item = entry.value;
                        final active = _currentIndex == index;

                        return Card(
                          elevation: active ? 4 : 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            leading: CircleAvatar(
                              backgroundColor: active
                                  ? const Color(0xFF0B4A3A)
                                  : const Color(0xFFE2ECE8),
                              foregroundColor:
                                  active ? Colors.white : Colors.black87,
                              child: Text('${index + 1}'),
                            ),
                            title: Text(
                              item.title,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontWeight: active
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                              ),
                            ),
                            subtitle: const Text(
                              'آنلاین آډیو',
                              textDirection: TextDirection.rtl,
                            ),
                            trailing: active && _loading
                                ? const SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                    ),
                                  )
                                : StreamBuilder<bool>(
                                    stream: _player.playingStream,
                                    builder: (context, snapshot) {
                                      final playing =
                                          active && (snapshot.data ?? false);

                                      return IconButton(
                                        onPressed: () {
                                          _play(index);
                                        },
                                        icon: Icon(
                                          playing
                                              ? Icons.pause_circle_filled
                                              : Icons.play_circle_fill,
                                        ),
                                        color: const Color(0xFF0B4A3A),
                                        iconSize: 38,
                                      );
                                    },
                                  ),
                            onTap: () {
                              _play(index);
                            },
                          ),
                        );
                      },
                    ),
            ),

            // BOTTOM PLAYER
            if (_currentIndex != null)
              StreamBuilder<Duration>(
                stream: _player.positionStream,
                builder: (context, posSnap) {
                  final position = posSnap.data ?? Duration.zero;
                  final duration = _player.duration ?? Duration.zero;

                  final maxMs = duration.inMilliseconds > 0
                      ? duration.inMilliseconds.toDouble()
                      : 1.0;

                  final value = position.inMilliseconds
                      .clamp(0, maxMs.toInt())
                      .toDouble();

                  return Material(
                    elevation: 12,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tarany[_currentIndex!].title,
                            textDirection: TextDirection.rtl,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Slider(
                            min: 0,
                            max: maxMs,
                            value: value,
                            onChanged: duration.inMilliseconds <= 0
                                ? null
                                : (v) {
                                    _player.seek(
                                      Duration(
                                        milliseconds: v.round(),
                                      ),
                                    );
                                  },
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_formatDuration(position)),
                              Text(_formatDuration(duration)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
