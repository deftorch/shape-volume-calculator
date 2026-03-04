import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Volume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

// HOME PAGE
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Volume'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Pilih Bangun Ruang:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _MenuButton(
              label: 'Kubus',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const KubusPage()),
              ),
            ),
            const SizedBox(height: 12),
            _MenuButton(
              label: 'Tabung',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TabungPage()),
              ),
            ),
            const SizedBox(height: 12),
            _MenuButton(
              label: 'Kerucut',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const KerucutPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _MenuButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(label, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

// KUBUS PAGE
class KubusPage extends StatefulWidget {
  const KubusPage({super.key});

  @override
  State<KubusPage> createState() => _KubusPageState();
}

class _KubusPageState extends State<KubusPage> {
  final _sisiController = TextEditingController();
  String _hasil = '';

  void _hitung() {
    final sisi = double.tryParse(_sisiController.text);
    if (sisi == null || sisi <= 0) {
      setState(() => _hasil = 'Masukkan nilai sisi yang valid!');
      return;
    }
    final volume = pow(sisi, 3);
    setState(() => _hasil = 'Volume = ${volume.toStringAsFixed(2)} cm³');
  }

  void _reset() {
    _sisiController.clear();
    setState(() => _hasil = '');
  }

  @override
  void dispose() {
    _sisiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Volume Kubus')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Rumus: V = s³',
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _sisiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Panjang Sisi (s) dalam cm',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _hitung,
              child: const Text('Hitung'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _reset,
              child: const Text('Reset'),
            ),
            const SizedBox(height: 20),
            if (_hasil.isNotEmpty)
              Text(
                _hasil,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// TABUNG PAGE
class TabungPage extends StatefulWidget {
  const TabungPage({super.key});

  @override
  State<TabungPage> createState() => _TabungPageState();
}

class _TabungPageState extends State<TabungPage> {
  final _jariController = TextEditingController();
  final _tinggiController = TextEditingController();
  String _hasil = '';

  void _hitung() {
    final r = double.tryParse(_jariController.text);
    final t = double.tryParse(_tinggiController.text);
    if (r == null || r <= 0 || t == null || t <= 0) {
      setState(() => _hasil = 'Masukkan nilai yang valid!');
      return;
    }
    final volume = pi * pow(r, 2) * t;
    setState(() => _hasil = 'Volume = ${volume.toStringAsFixed(2)} cm³');
  }

  void _reset() {
    _jariController.clear();
    _tinggiController.clear();
    setState(() => _hasil = '');
  }

  @override
  void dispose() {
    _jariController.dispose();
    _tinggiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Volume Tabung')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Rumus: V = π × r² × t',
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _jariController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jari-Jari (r) dalam cm',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tinggi (t) dalam cm',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _hitung,
              child: const Text('Hitung'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _reset,
              child: const Text('Reset'),
            ),
            const SizedBox(height: 20),
            if (_hasil.isNotEmpty)
              Text(
                _hasil,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// KERUCUT PAGE
class KerucutPage extends StatefulWidget {
  const KerucutPage({super.key});

  @override
  State<KerucutPage> createState() => _KerucutPageState();
}

class _KerucutPageState extends State<KerucutPage> {
  final _jariController = TextEditingController();
  final _tinggiController = TextEditingController();
  String _hasil = '';

  void _hitung() {
    final r = double.tryParse(_jariController.text);
    final t = double.tryParse(_tinggiController.text);
    if (r == null || r <= 0 || t == null || t <= 0) {
      setState(() => _hasil = 'Masukkan nilai yang valid!');
      return;
    }
    final volume = (1 / 3) * pi * pow(r, 2) * t;
    setState(() => _hasil = 'Volume = ${volume.toStringAsFixed(2)} cm³');
  }

  void _reset() {
    _jariController.clear();
    _tinggiController.clear();
    setState(() => _hasil = '');
  }

  @override
  void dispose() {
    _jariController.dispose();
    _tinggiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Volume Kerucut')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Rumus: V = ⅓ × π × r² × t',
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _jariController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jari-Jari Alas (r) dalam cm',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tinggi (t) dalam cm',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _hitung,
              child: const Text('Hitung'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _reset,
              child: const Text('Reset'),
            ),
            const SizedBox(height: 20),
            if (_hasil.isNotEmpty)
              Text(
                _hasil,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
