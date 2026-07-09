';
import 'package:just_audio/just_audio.dart';

void main() => runApp(const AziziTaranyApp());

class Tarana {
  const Tarana({required this.title, required this.asset});
  final String title;
  final String asset;
}

const tarany = <Tarana>[
  Tarana(title: 'آخر مي درنه تاؤ کړله لاسونه شهادته', asset: 'assets/audio/01.mp3'),
  Tarana(title: 'آفرين ګرانه په تاريخ دي جهان فخر', asset: 'assets/audio/02.mp3'),
  Tarana(title: 'اتل اتل باتور باتور شهيد منصور', asset: 'assets/audio/03.mp3'),
  Tarana(title: 'اتله قهرمانه غيرت من حاجي منانه', asset: 'assets/audio/04.mp3'),
  Tarana(title: 'اختره چي راځې نو خوشحالي درسره', asset: 'assets/audio/05.mp3'),
  Tarana(title: 'ازادی ستا د راتلو مبارک مبارک', asset: 'assets/audio/06.mp3'),
  Tarana(title: 'الفتح عملياتو ته د خدای په نوم', asset: 'assets/audio/07.mp3'),
  Tarana(title: 'انقلاب دی آوښتون دی مستقيم', asset: 'assets/audio/08.mp3'),
  Tarana(title: 'اوښکي دي پر قبر تويوم چي تاته راغلم', asset: 'assets/audio/09.mp3'),
  Tarana(title: 'اولس دي له اختر او ازادی خوندونه', asset: 'assets/audio/10.mp3'),
];

class AziziTaranyApp extends StatelessWidget {
  const AziziTaranyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Azizi Tarany',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F5B46)),
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
    return tarany.asMap().entries.where((e) {
      return q.isEmpty || e.value.title.toLowerCase().contains(q);
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
        setState(() {});
        return;
      }

      setState(() {
        _loading = true;
        _currentIndex = index;
      });
      await _player.setAsset(tarany[index].asset);
      await _player.play();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Audio error: $e')),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
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
            Text('Azizi Tarany', style: TextStyle(fontWeight: FontWeight.bold)),
            
