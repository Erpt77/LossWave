import 'package:flutter_test/flutter_test.dart';
import 'package:lastwave_desktop/features/feed/feed_repository.dart';

void main() {
  group('DailyMix', () {
    test('keeps its title, seed artist, and generated tracks', () {
      const track = GeneratedTrack(
        name: 'Example Song',
        artist: 'Example Artist',
        videoId: 'video123',
      );
      const mix = DailyMix(
        title: 'Daily Mix 1',
        seedArtist: 'Example Artist',
        tracks: [track],
      );

      expect(mix.title, 'Daily Mix 1');
      expect(mix.seedArtist, 'Example Artist');
      expect(mix.tracks, hasLength(1));
      expect(mix.tracks.single.name, 'Example Song');
      expect(mix.tracks.single.videoId, 'video123');
    });

    test('supports an empty track list while loading or when no results exist', () {
      const mix = DailyMix(
        title: 'Daily Mix 2',
        seedArtist: 'Another Artist',
        tracks: [],
      );

      expect(mix.tracks, isEmpty);
    });
  });
}
