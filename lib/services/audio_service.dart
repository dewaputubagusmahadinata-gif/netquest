import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Layanan Audio untuk pemutaran backsound dan efek suara (SFX).
class AudioService {
  static final AudioService instance = AudioService._internal();

  /// Flag pengaktifan audio (dapat dimatikan pada unit test murni)
  static bool enableAudio = true;

  AudioPlayer? _bgmPlayer;
  AudioPlayer? _sfxPlayer;

  bool _isMuted = false;
  bool _isBgmPlaying = false;
  bool _isInitialized = false;

  AudioService._internal();

  bool get isMuted => _isMuted;
  bool get isBgmPlaying => _isBgmPlaying;

  void _ensureInitialized() {
    if (_isInitialized || !enableAudio) return;

    try {
      ServicesBinding.instance;

      // Konfigurasi agar SFX dan BGM dapat berbunyi bersamaan (mix with others)
      // tanpa mematikan / menginterupsi pemutaran musik latar.
      final audioContext = AudioContext(
        android: const AudioContextAndroid(
          isSpeakerphoneOn: true,
          stayAwake: false,
          contentType: AndroidContentType.music,
          usageType: AndroidUsageType.game,
          audioFocus: AndroidAudioFocus.none,
        ),
        iOS: AudioContextIOS(
          category: AVAudioSessionCategory.playback,
          options: const {
            AVAudioSessionOptions.mixWithOthers,
          },
        ),
      );

      AudioPlayer.global.setAudioContext(audioContext);

      _bgmPlayer = AudioPlayer();
      _sfxPlayer = AudioPlayer();

      _bgmPlayer?.setAudioContext(audioContext);
      _sfxPlayer?.setAudioContext(audioContext);

      _bgmPlayer?.setReleaseMode(ReleaseMode.loop);
      _bgmPlayer?.setVolume(0.55);

      // Loop listener: bila pemutar mencapai akhir durasi pada browser web
      _bgmPlayer?.onPlayerComplete.listen((_) {
        if (!_isMuted && _isBgmPlaying) {
          _bgmPlayer?.seek(Duration.zero);
          _bgmPlayer?.resume();
        }
      });

      _bgmPlayer?.onPlayerStateChanged.listen((state) {
        if ((state == PlayerState.completed || state == PlayerState.stopped) &&
            !_isMuted &&
            _isBgmPlaying) {
          _bgmPlayer?.seek(Duration.zero);
          _bgmPlayer?.resume();
        }
      });

      _isInitialized = true;
    } catch (e) {
      debugPrint('AudioService init bypassed: $e');
    }
  }

  /// Mengembalikan Source yang sesuai platform.
  Source _src(String assetPath) {
    if (kIsWeb) {
      return UrlSource('assets/$assetPath');
    }
    return AssetSource(assetPath);
  }

  /// Membuka kunci audio pada interaksi pertama pengguna (misal tap pertama)
  Future<void> unlockAndPlayBgm() async {
    if (_isMuted || !enableAudio) return;
    _ensureInitialized();
    final player = _bgmPlayer;
    if (player == null) return;

    if (player.state == PlayerState.playing && _isBgmPlaying) {
      return;
    }

    try {
      await player.setReleaseMode(ReleaseMode.loop);
      await player.setVolume(0.55);
      await player.play(_src('audio/bgm.mp3'), volume: 0.55);
      _isBgmPlaying = true;
    } catch (e) {
      debugPrint('unlockAndPlayBgm error: $e');
    }
  }

  /// Memulai pemutaran musik latar (loop)
  Future<void> playBgm() async {
    await unlockAndPlayBgm();
  }

  /// Menghentikan musik latar
  Future<void> stopBgm() async {
    if (!enableAudio) return;
    try {
      await _bgmPlayer?.stop();
      _isBgmPlaying = false;
    } catch (e) {
      debugPrint('Error stopping BGM: $e');
    }
  }

  /// Memainkan efek suara ketika jawaban BENAR
  Future<void> playCorrect() async {
    if (!enableAudio) return;
    _ensureInitialized();
    try {
      if (!_isMuted) {
        await _sfxPlayer?.stop();
        await _sfxPlayer?.setVolume(0.85);
        await _sfxPlayer?.play(_src('audio/correct.wav'), volume: 0.85);
      }
      _ensureBgmKeepsPlaying();
    } catch (e) {
      debugPrint('Error playing correct SFX: $e');
    }
  }

  /// Memainkan efek suara ketika jawaban SALAH
  Future<void> playWrong() async {
    if (!enableAudio) return;
    _ensureInitialized();
    try {
      if (!_isMuted) {
        await _sfxPlayer?.stop();
        await _sfxPlayer?.setVolume(0.85);
        await _sfxPlayer?.play(_src('audio/wrong.wav'), volume: 0.85);
      }
      _ensureBgmKeepsPlaying();
    } catch (e) {
      debugPrint('Error playing wrong SFX: $e');
    }
  }

  /// Memastikan BGM tetap berputar setelah SFX dibunyikan
  void _ensureBgmKeepsPlaying() {
    if (!_isMuted && _isBgmPlaying) {
      Future.delayed(const Duration(milliseconds: 100), () async {
        if (!_isMuted && _isBgmPlaying) {
          final state = _bgmPlayer?.state;
          if (state != PlayerState.playing) {
            try {
              await _bgmPlayer?.resume();
            } catch (_) {}
          }
        }
      });
    }
  }

  /// Beralih antara mode suara menyala dan bisu (mute)
  void toggleMute() {
    _isMuted = !_isMuted;
    if (_isMuted) {
      _bgmPlayer?.pause();
      _isBgmPlaying = false;
    } else {
      _isBgmPlaying = true;
      _bgmPlayer?.setVolume(0.55);
      _bgmPlayer?.resume();
      playBgm();
    }
  }

  /// Bersihkan resource jika diperlukan
  void dispose() {
    _bgmPlayer?.dispose();
    _sfxPlayer?.dispose();
  }
}
