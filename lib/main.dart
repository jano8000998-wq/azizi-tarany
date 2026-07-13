import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const AziziTaranyApp());
}

class Tarana {
  const Tarana({
    required this.title,
    required this.url,
    required this.letter,
  });

  final String title;
  final String url;
  final String letter;
}

class LetterFolder {
  const LetterFolder({
    required this.letter,
    required this.title,
    required this.color,
  });

  final String letter;
  final String title;
  final Color color;
}

const String _baseUrl =
    'https://raw.githubusercontent.com/jano8000998-wq/azizi-tarany/main/assets/audio';

const List<Tarana> tarany = [
  Tarana(
    title: 'آخر مي درنه تاؤ کړله لاسونه شهادته',
    url: '$_baseUrl/01.mp3',
    letter: 'الف',
  ),
  Tarana(
    title: 'آفرين ګرانه په تاريخ دي جهان فخر',
    url: '$_baseUrl/02.mp3',
    letter: 'الف',
  ),
  Tarana(
    title: 'اتل اتل باتور باتور شهيد منصور',
    url: '$_baseUrl/03.mp3',
    letter: 'الف',
  ),
  Tarana(
    title: 'اتله قهرمانه غيرت من حاجي منانه',
    url: '$_baseUrl/04.mp3',
    letter: 'الف',
  ),
  Tarana(
    title: 'اختره چي راځې نو خوشحالي درسره',
    url: '$_baseUrl/05.mp3',
    letter: 'الف',
  ),
  Tarana(
    title: 'ازادی ستا د راتلو مبارک مبارک',
    url: '$_baseUrl/06.mp3',
    letter: 'الف',
  ),
  Tarana(
    title: 'الفتح عملياتو ته د خدای په نوم',
    url: '$_baseUrl/07.mp3',
    letter: 'الف',
  ),
  Tarana(
    title: 'انقلاب دی آوښتون دی مستقيم',
    url: '$_baseUrl/08.mp3',
    letter: 'الف',
  ),
  Tarana(
    title: 'اوښکي دي پر قبر تويوم چي تاته راغلم',
    url: '$_baseUrl/09.mp3',
    letter: 'الف',
  ),
  Tarana(
    title: 'اولس دي له اختر او ازادی خوندونه',
    url: '$_baseUrl/10.mp3',
    letter: 'الف',
  ),
];

const List<LetterFolder> folders = [
  LetterFolder(
    letter: 'الف',
    title: 'الف ترانې',
    color: Color(0xFF0B4A3A),
  ),
  LetterFolder(
    letter: 'ب',
    title: 'ب ترانې',
    color: Color(0xFF12624D),
  ),
  LetterFolder(
    letter: 'پ',
    title: 'پ ترانې',
    color: Color(0xFF17745B),
  ),
  LetterFolder(
    letter: 'ت',
    title: 'ت ترانې',
    color: Color(0xFF1E8568),
  ),
  LetterFolder(
    letter: 'ټ',
    title: 'ټ ترانې',
    color: Color(0xFF8A6A22),
  ),
  LetterFolder(
    letter: 'ث',
    title: 'ث ترانې',
    color: Color(0xFF0B4A3A),
  ),
  LetterFolder(
    letter: 'ج',
    title: 'ج ترانې',
    color: Color(0xFF12624D),
  ),
  LetterFolder(
    letter: 'چ',
    title: 'چ ترانې',
    color: Color(0xFF17745B),
  ),
  LetterFolder(
    letter: 'ح',
    title: 'ح ترانې',
    color: Color(0xFF1E8568),
  ),
  LetterFolder(
    letter: 'خ',
    title: 'خ ترانې',
    color: Color(0xFF8A6A22),
  ),
  LetterFolder(
    letter: 'د',
    title: 'د ترانې',
    color: Color(0xFF0B4A3A),
  ),
  LetterFolder(
    letter: 'ډ',
    title: 'ډ ترانې',
    color: Color(0xFF12624D),
  ),
  LetterFolder(
    letter: 'ر',
    title: 'ر ترانې',
    color: Color(0xFF17745B),
  ),
  LetterFolder(
    letter: 'ز',
    title: 'ز ترانې',
    color: Color(0xFF1E8568),
  ),
  LetterFolder(
    letter: 'ژ',
    title: 'ژ ترانې',
    color: Color(0xFF8A6A22),
  ),
  LetterFolder(
    letter: 'س',
    title: 'س ترانې',
    color: Color(0xFF0B4A3A),
  ),
  LetterFolder(
    letter: 'ش',
    title: 'ش ترانې',
    color: Color(0xFF12624D),
  ),
  LetterFolder(
    letter: 'ص',
    title: 'ص ترانې',
    color: Color(0xFF17745B),
  ),
  LetterFolder(
    letter: 'ض',
    title: 'ض ترانې',
    color: Color(0xFF1E8568),
  ),
  LetterFolder(
    letter: 'ط',
    title: 'ط ترانې',
    color: Color(0xFF8A6A22),
  ),
  LetterFolder(
    letter: 'ظ',
    title: 'ظ ترانې',
    color: Color(0xFF0B4A3A),
  ),
  LetterFolder(
    letter: 'ع',
    title: 'ع ترانې',
    color: Color(0xFF12624D),
  ),
  LetterFolder(
    letter: 'غ',
    title: 'غ ترانې',
    color: Color(0xFF17745B),
  ),
  LetterFolder(
    letter: 'ف',
    title: 'ف ترانې',
    color: Color(0xFF1E8568),
  ),
  LetterFolder(
    letter: 'ق',
    title: 'ق ترانې',
    color: Color(0xFF8A6A22),
  ),
  LetterFolder(
    letter: 'ک',
    title: 'ک ترانې',
    color: Color(0xFF0B4A3A),
  ),
  LetterFolder(
    letter: 'ګ',
    title: 'ګ ترانې',
    color: Color(0xFF12624D),
  ),
  LetterFolder(
    letter: 'ل',
    title: 'ل ترانې',
    color: Color(0xFF17745B),
  ),
  LetterFolder(
    letter: 'م',
    title: 'م ترانې',
    color: Color(0xFF1E8568),
  ),
  LetterFolder(
    letter: 'ن',
    title: 'ن ترانې',
    color: Color(0xFF8A6A22),
  ),
  LetterFolder(
    letter: 'و',
    title: 'و ترانې',
    color: Color(0xFF0B4A3A),
  ),
  LetterFolder(
    letter: 'ه',
    title: 'ه ترانې',
    color: Color(0xFF12624D),
  ),
  LetterFolder(
    letter: 'ی',
    title: 'ی ترانې',
    color: Color(0xFF17745B),
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

class AudioController {
  AudioController._();

  static final AudioPlayer player = AudioPlayer();
  static int? currentIndex;
  static bool loading = false;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _searchFocusNode = FocusNode();

  String _query = '';
  DateTime? _lastBackPressed;

  List<Tarana> get _searchedTarany {
    final q = _query.trim().toLowerCase();

    if (q.isEmpty) {
      return [];
    }

    return tarany.where((item) {
      return item.title.toLowerCase().contains(q);
    }).toList();
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);

    final opened = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!opened && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Link open نه شو',
            textDirection: TextDirection.rtl,
          ),
        ),
      );
    }
  }

  Future<void> _play(Tarana item) async {
    final index = tarany.indexOf(item);

    try {
      if (AudioController.currentIndex == index) {
        if (AudioController.player.playing) {
          await AudioController.player.pause();
        } else {
          await AudioController.player.play();
        }

        if (mounted) {
          setState(() {});
        }

        return;
      }

      setState(() {
        AudioController.loading = true;
        AudioController.currentIndex = index;
      });

      await AudioController.player.setUrl(item.url);
      await AudioController.player.play();
    } catch (e) {
      if (!mounted) {
        return;
      }

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
          AudioController.loading = false;
        });
      }
    }
  }

  String _formatDuration(Duration value) {
    final minutes = value.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');

    final seconds = value.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');

    return '$minutes:$seconds';
  }

  Future<bool> _onWillPop() async {
    if (_searchFocusNode.hasFocus) {
      _searchFocusNode.unfocus();
      return false;
    }

    final now = DateTime.now();

    if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) >
            const Duration(seconds: 2)) {
      _lastBackPressed = now;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'د وتلو لپاره بیا Back ووهئ',
            textDirection: TextDirection.rtl,
          ),
          duration: Duration(seconds: 2),
        ),
      );

      return false;
    }

    return true;
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardOpen =
        MediaQuery.of(context).viewInsets.bottom > 0;

    final searchedItems = _searchedTarany;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0B3D2E),
                Color(0xFF145A46),
                Color(0xFF081F19),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                if (!keyboardOpen)
                  Container(
                    width: double.infinity,
                    height: 210,
                    margin: const EdgeInsets.fromLTRB(
                      12,
                      12,
                      12,
                      6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0B4A3A),
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
                      fit: BoxFit.contain,
                    ),
                  ),

                if (!keyboardOpen)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      14,
                      8,
                      14,
                      4,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.92),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 6,
                            offset: Offset(0, 3),
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'دلته به تاسو ته د مولوي عبدالعزيز عزيزي ترانې ملاوېږي',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0B4A3A),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              _SocialButton(
                                label: 'Telegram',
                                icon: Icons.send_rounded,
                                color: const Color(0xFF229ED9),
                                onTap: () => _openLink(
                                  'https://t.me/azizi_998',
                                ),
                              ),
                              _SocialButton(
                                label: 'YouTube',
                                icon:
                                    Icons.play_circle_fill_rounded,
                                color: const Color(0xFFFF0000),
                                onTap: () => _openLink(
                                  'https://www.youtube.com/@islamic.visions.ai998',
                                ),
                              ),
                              _SocialButton(
                                label: 'Facebook',
                                icon: Icons.facebook_rounded,
                                color: const Color(0xFF1877F2),
                                onTap: () => _openLink(
                                  'https://www.facebook.com/profile.php?id=61591626821493&mibextid=ZbWKwL',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    14,
                    10,
                    14,
                    8,
                  ),
                  child: TextField(
                    focusNode: _searchFocusNode,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    onChanged: (value) {
                      setState(() {
                        _query = value;
                      });
                    },
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'ترانه ولټوئ...',
                      hintTextDirection: TextDirection.rtl,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _query.isEmpty
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  _query = '';
                                });

                                _searchFocusNode.unfocus();
                              },
                            ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: _query.trim().isNotEmpty
                      ? _TaranyList(
                          items: searchedItems,
                          emptyText:
                              'کومه ترانه ونه موندل شوه',
                          onPlay: _play,
                          refresh: () {
                            setState(() {});
                          },
                        )
                      : _FoldersGrid(
                          onFolderTap: (folder) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => FolderPage(
                                  folder: folder,
                                  onPlay: _play,
                                  formatDuration:
                                      _formatDuration,
                                ),
                              ),
                            ).then((_) {
                              setState(() {});
                            });
                          },
                        ),
                ),

                _BottomPlayer(
                  formatDuration: _formatDuration,
                  refresh: () {
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FolderPage extends StatefulWidget {
  const FolderPage({
    super.key,
    required this.folder,
    required this.onPlay,
    required this.formatDuration,
  });

  final LetterFolder folder;
  final Future<void> Function(Tarana item) onPlay;
  final String Function(Duration value) formatDuration;

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  String _query = '';

  List<Tarana> get _items {
    final q = _query.trim().toLowerCase();

    final letterItems = tarany
        .where(
          (item) => item.letter == widget.folder.letter,
        )
        .toList();

    if (q.isEmpty) {
      return letterItems;
    }

    return letterItems.where((item) {
      return item.title.toLowerCase().contains(q);
    }).toList();
  }

  Future<bool> _onWillPop() async {
    Navigator.pop(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final count = tarany
        .where(
          (item) => item.letter == widget.folder.letter,
        )
        .length;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0B3D2E),
                Color(0xFF145A46),
                Color(0xFF081F19),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    10,
                    10,
                    10,
                    8,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Text(
                          widget.folder.title,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.fromLTRB(
                    14,
                    0,
                    14,
                    8,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.92),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.library_music_rounded,
                        color: Color(0xFF0B4A3A),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        count == 0
                            ? 'دا فولډر اوس خالي دی'
                            : 'په دې فولډر کې $count ترانې شته',
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          color: Color(0xFF0B4A3A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    14,
                    4,
                    14,
                    8,
                  ),
                  child: TextField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    onChanged: (value) {
                      setState(() {
                        _query = value;
                      });
                    },
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText:
                          'په دې فولډر کې ترانه ولټوئ...',
                      hintTextDirection: TextDirection.rtl,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _query.isEmpty
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  _query = '';
                                });
                              },
                            ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: _TaranyList(
                    items: _items,
                    emptyText: count == 0
                        ? 'دا فولډر اوس خالي دی'
                        : 'کومه ترانه ونه موندل شوه',
                    onPlay: widget.onPlay,
                    refresh: () {
                      setState(() {});
                    },
                  ),
                ),

                _BottomPlayer(
                  formatDuration: widget.formatDuration,
                  refresh: () {
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FoldersGrid extends StatelessWidget {
  const _FoldersGrid({
    required this.onFolderTap,
  });

  final void Function(LetterFolder folder) onFolderTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(
            14,
            4,
            14,
            8,
          ),
          child: Text(
            'د حروفو د ترتیب سره ترانې دلته ولټوئ',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),

        Expanded(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(
                12,
                0,
                12,
                12,
              ),
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: folders.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.18,
              ),
              itemBuilder: (context, index) {
                final folder = folders[index];

                final count = tarany
                    .where(
                      (item) =>
                          item.letter == folder.letter,
                    )
                    .length;

                return InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    onFolderTap(folder);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: folder.color.withOpacity(
                        count == 0 ? 0.55 : 0.95,
                      ),
                      borderRadius:
                          BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFFD7B46A)
                            .withOpacity(0.85),
                        width: 1.2,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 8,
                          offset: Offset(0, 4),
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Icon(
                          count == 0
                              ? Icons.folder_open_rounded
                              : Icons
                                  .library_music_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          folder.title,
                          textDirection:
                              TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          count == 0
                              ? 'خالي'
                              : '$count ترانې',
                          textDirection:
                              TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.white
                                .withOpacity(0.9),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _TaranyList extends StatelessWidget {
  const _TaranyList({
    required this.items,
    required this.emptyText,
    required this.onPlay,
    required this.refresh,
  });

  final List<Tarana> items;
  final String emptyText;
  final Future<void> Function(Tarana item) onPlay;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          emptyText,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return ListView.separated(
      keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(
        12,
        4,
        12,
        12,
      ),
      itemCount: items.length,
      separatorBuilder: (_, __) {
        return const SizedBox(height: 6);
      },
      itemBuilder: (context, i) {
        final item = items[i];
        final index = tarany.indexOf(item);
        final active =
            AudioController.currentIndex == index;

        return Card(
          color: Colors.white.withOpacity(0.92),
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
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: active
                    ? FontWeight.bold
                    : FontWeight.w500,
              ),
            ),
            subtitle: const Text(
              'آنلاین آډیو',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
            trailing:
                active && AudioController.loading
                    ? const SizedBox(
                        width: 26,
                        height: 26,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                        ),
                      )
                    : StreamBuilder<bool>(
                        stream: AudioController
                            .player.playingStream,
                        builder: (context, snapshot) {
                          final playing = active &&
                              (snapshot.data ?? false);

                          return IconButton(
                            onPressed: () async {
                              await onPlay(item);
                              refresh();
                            },
                            icon: Icon(
                              playing
                                  ? Icons
                                      .pause_circle_filled
                                  : Icons
                                      .play_circle_fill,
                            ),
                            color:
                                const Color(0xFF0B4A3A),
                            iconSize: 38,
                          );
                        },
                      ),
            onTap: () async {
              await onPlay(item);
              refresh();
            },
          ),
        );
      },
    );
  }
}

class _BottomPlayer extends StatelessWidget {
  const _BottomPlayer({
    required this.formatDuration,
    required this.refresh,
  });

  final String Function(Duration value) formatDuration;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    if (AudioController.currentIndex == null) {
      return const SizedBox.shrink();
    }

    return StreamBuilder<Duration>(
      stream: AudioController.player.positionStream,
      builder: (context, posSnap) {
        final position =
            posSnap.data ?? Duration.zero;

        final duration =
            AudioController.player.duration ??
                Duration.zero;

        final maxMs = duration.inMilliseconds > 0
            ? duration.inMilliseconds.toDouble()
            : 1.0;

        final value = position.inMilliseconds
            .clamp(
              0,
              maxMs.toInt(),
            )
            .toDouble();

        return Material(
          elevation: 12,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              14,
              8,
              14,
              10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tarany[
                          AudioController.currentIndex!]
                      .title,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
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
                  onChanged:
                      duration.inMilliseconds <= 0
                          ? null
                          : (v) {
                              AudioController.player
                                  .seek(
                                Duration(
                                  milliseconds:
                                      v.round(),
                                ),
                              );
                            },
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatDuration(position),
                    ),
                    Text(
                      formatDuration(duration),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        width: 82,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.96),
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(0, 3),
              color: Colors.black12,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
