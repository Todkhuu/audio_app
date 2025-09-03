import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class AudioDownloadScreen extends StatefulWidget {
  const AudioDownloadScreen({super.key});

  @override
  State<AudioDownloadScreen> createState() => _AudioDownloadScreenState();
}

class _AudioDownloadScreenState extends State<AudioDownloadScreen> {
  final urlController = TextEditingController();
  bool isLoading = false;
  double progress = 0.0;
  List<FileSystemEntity> audioFiles = [];
  String? playingFilePath;
  final AudioPlayer player = AudioPlayer();
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  @override
  void dispose() {
    urlController.dispose();
    player.dispose();
    super.dispose();
  }

  Future<void> _playPause() async {
    if (isPlaying) {
      await _player.pause();
    } else {
      await _player.setAsset('assets/audio/good.mp3');
      await _player.play();
    }
    setState(() => isPlaying = !isPlaying);
  }

  Future<File> _downloadAudio(String url) async {
    final dir = await getApplicationDocumentsDirectory();
    final fileName = path.basename(url);
    final file = File('${dir.path}/$fileName');
    final dio = Dio();

    if (await file.exists()) return file;

    await dio.download(
      url,
      file.path,
      options: Options(responseType: ResponseType.bytes),
      onReceiveProgress: (received, total) {
        if (total != -1) {
          setState(() {
            progress = received / total;
          });
        }
      },
    );
    return file;
  }

  Future<void> _submit() async {
    final url = urlController.text.trim();
    if (url.isEmpty) return;

    setState(() {
      isLoading = true;
      progress = 0.0;
    });

    try {
      final file = await _downloadAudio(url);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Audio saved at: ${file.path}')));
      await _loadFiles();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _loadFiles() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir.listSync().where((f) {
      return f.path.endsWith('.mp3') ||
          f.path.endsWith('.flac') ||
          f.path.endsWith('.wav');
    }).toList();

    setState(() {
      audioFiles = files;
    });
  }

  Future<void> _playAudio(String fullPath) async {
    try {
      if (fullPath.isEmpty) {
        log('Path empty');
        return;
      }

      if (playingFilePath == fullPath && player.playing) {
        await player.pause();
        setState(() => playingFilePath = null);
      } else {
        await player.setFilePath(fullPath);
        await player.play();
        setState(() => playingFilePath = fullPath);
      }
    } catch (e) {
      print('Error playing audio: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Audio тоглуулахад алдаа гарлаа')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Downloader')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: 'MP3 or FLAC URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? Column(
                    children: [
                      LinearProgressIndicator(value: progress),
                      const SizedBox(height: 10),
                      Text('${(progress * 100).toStringAsFixed(0)}%'),
                    ],
                  )
                : ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Download & Save'),
                  ),
            const SizedBox(height: 20),
            const Text(
              "Downloaded Files:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: audioFiles.length,
                itemBuilder: (context, index) {
                  final file = audioFiles[index];
                  final fileName = path.basename(file.path);
                  final isPlaying =
                      playingFilePath == file.path && player.playing;

                  return ListTile(
                    leading: const Icon(Icons.music_note),
                    title: Text(fileName),
                    trailing: IconButton(
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      onPressed: () async => await _playAudio(file.path),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _playPause,
              child: Text(isPlaying ? 'Pause' : 'Play'),
            ),
          ],
        ),
      ),
    );
  }
}
