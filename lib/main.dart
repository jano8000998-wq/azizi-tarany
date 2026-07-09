import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(const AziziTaranyApp());

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

const tarany = <Tarana>[
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
          seedColor: const Color(0xFF0F5B46),
        ),
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
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'آډیو ونه چلېده. انټرنېټ وګورئ او بیا هڅه وکړئ.',
            textDirection: TextDirection.rtl,
          ),
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
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Azizi Tarany',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'د عزيزي ترانې',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                12,
                16,
                8,
              ),
              child: TextField(
                textDirection: TextDirection.rtl,
                onChanged: (value) {
                  setState(() {
                    _query = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'ترانه ولټوئ...',
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      18,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: items.isEmpty
                  ? const Center(
                      child: Text(
                        'کومه ترانه ونه موندل شوه',
                        textDirection: TextDirection.rtl,
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemCount: items.length,
                      separatorBuilder: (_, __) {
                        return const SizedBox(
                          height: 6,
                        );
                      },
                      itemBuilder: (context, i) {
                        final entry = items[i];
                        final index = entry.key;
                        final item = entry.value;
                        final active =
                            _currentIndex == index;

                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                '${index + 1}',
                              ),
                            ),
                            title: Text(
                              item.title,
                              textDirection:
                                  TextDirection.rtl,
                            ),
                            subtitle: const Text(
                              'آنلاین آډیو',
                              textDirection:
                                  TextDirection.rtl,
                            ),
                            trailing:
                                active && _loading
                                    ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child:
                                            CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : StreamBuilder<bool>(
                                        stream:
                                            _player.playingStream,
                                        builder:
                                            (context, snapshot) {
                                          final playing =
                                              active &&
                                                  (snapshot.data ??
                                                      false);

                                          return IconButton(
                                            onPressed: () {
                                              _play(index);
                                            },
                                            icon: Icon(
                                              playing
                                                  ? Icons.pause_circle
                                                  : Icons.play_circle,
                                            ),
                                            iconSize: 36,
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

            if (_currentIndex != null)
              StreamBuilder<Duration>(
                stream: _player.positionStream,
                builder: (context, posSnap) {
                  final position =
                      posSnap.data ?? Duration.zero;

                  final duration =
                      _player.duration ?? Duration.zero;

                  final maxMs =
                      duration.inMilliseconds > 0
                          ? duration.inMilliseconds
                              .toDouble()
                          : 1.0;

                  final value =
                      position.inMilliseconds
                          .clamp(
                            0,
                            maxMs.toInt(),
                          )
                          .toDouble();

                  return Material(
                    elevation: 8,
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(
                        16,
                        8,
                        16,
                        12,
                      ),
                      child: Column(
                        children: [
                          Text(
                            tarany[_currentIndex!]
                                .title,
                            textDirection:
                                TextDirection.rtl,
                            maxLines: 1,
                            overflow:
                                TextOverflow.ellipsis,
                          ),

                          Slider(
                            min: 0,
                            max: maxMs,
                            value: value,
                            onChanged:
                                duration.inMilliseconds <= 0
                                    ? null
                                    : (v) {
                                        _player.seek(
                                          Duration(
                                            milliseconds:
                                                v.round(),
                                          ),
                                        );
                                      },
                          ),

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            children: [
                              Text(
                                _formatDuration(
                                  position,
                                ),
                              ),
                              Text(
                                _formatDuration(
                                  duration,
                                ),
                              ),
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
