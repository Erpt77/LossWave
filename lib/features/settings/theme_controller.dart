import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/storage/prefs.dart';

/// Noctune's curated theme catalog, inspired by LiMusic's clean, high-contrast
/// music UI while keeping the desktop Fluent surface system.
class NoctuneThemePreset {
  final String id;
  final String name;
  final Color accent;
  final bool isLight;
  const NoctuneThemePreset(this.id, this.name, this.accent, {this.isLight = false});
}

const noctuneThemePresets = <NoctuneThemePreset>[
  NoctuneThemePreset('limusic-green', 'LiMusic Green', Color(0xFF1DB954)),
  NoctuneThemePreset('nocturne-violet', 'Nocturne Violet', Color(0xFF9B87F5)),
  NoctuneThemePreset('rose-quartz', 'Rose Quartz', Color(0xFFE879A9)),
  NoctuneThemePreset('ocean-blue', 'Ocean Blue', Color(0xFF45B7D1)),
  NoctuneThemePreset('sunset-amber', 'Sunset Amber', Color(0xFFFFB454)),
  NoctuneThemePreset('midnight', 'Midnight', Color(0xFFF5F4F0)),
  NoctuneThemePreset('pearl', 'Pearl', Color(0xFF1DB954), isLight: true),
];

class ThemeState {
  final Color accent;
  final bool amoled;
  final String uiLayout;
  final bool isLight;
  final String hazeMaterial;
  final String hazeIntensity;
  final String accentSource;
  final String presetId;
  final List<Map<String, dynamic>> customThemes;
  const ThemeState({
    required this.accent,
    required this.amoled,
    this.uiLayout = 'standard',
    this.isLight = false,
    this.hazeMaterial = 'automatic',
    this.hazeIntensity = 'medium',
    this.accentSource = 'custom',
    this.presetId = 'limusic-green',
    this.customThemes = const [],
  });
}

class ThemeController extends StateNotifier<ThemeState> {
  final Prefs _prefs;
  ThemeController(this._prefs) : super(_readState(_prefs));

  static ThemeState _readState(Prefs prefs) => ThemeState(
        accent: Color(prefs.accentColor),
        amoled: prefs.amoled,
        uiLayout: prefs.uiLayout,
        isLight: prefs.isLight,
        hazeMaterial: prefs.hazeMaterial,
        hazeIntensity: prefs.hazeIntensity,
        accentSource: prefs.accentSource,
        presetId: prefs.themePreset,
        customThemes: prefs.customThemes,
      );

  void refresh() => state = _readState(_prefs);

  Future<void> setThemeMode(bool light) async {
    await _prefs.setThemeMode(light ? 'light' : 'dark');
    refresh();
  }

  Future<void> applyPreset(NoctuneThemePreset preset) async {
    await _prefs.setThemePreset(preset.id);
    await _prefs.setAccentColor(preset.accent.toARGB32());
    // Palette selection is independent of the light/dark color scheme.
    await _prefs.setAccentSource('custom');
    refresh();
  }

  Future<void> saveCustomTheme({
    required String name,
    required Color accent,
    required bool isLight,
  }) async {
    final themes = [..._prefs.customThemes];
    final entry = <String, dynamic>{
      'id': 'custom-${DateTime.now().microsecondsSinceEpoch}',
      'name': name.trim(),
      'accent': accent.toARGB32(),
      'isLight': isLight,
    };
    themes.add(entry);
    await _prefs.setCustomThemes(themes);
    await _prefs.setThemePreset(entry['id'] as String);
    await _prefs.setAccentColor(accent.toARGB32());
    await _prefs.setAccentSource('custom');
    refresh();
  }

  Future<void> applyCustomTheme(Map<String, dynamic> theme) async {
    final id = theme['id']?.toString() ?? 'custom';
    final accent = (theme['accent'] as num?)?.toInt() ?? 0xFF1DB954;
    final isLight = theme['isLight'] == true;
    await _prefs.setThemePreset(id);
    await _prefs.setAccentColor(accent);
    // Ignore legacy isLight values on saved palettes.
    await _prefs.setAccentSource('custom');
    refresh();
  }

  Future<void> deleteCustomTheme(String id) async {
    final themes = _prefs.customThemes.where((t) => t['id'] != id).toList();
    await _prefs.setCustomThemes(themes);
    if (state.presetId == id) {
      await applyPreset(noctuneThemePresets.first);
    } else {
      refresh();
    }
  }
}

final themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeState>((ref) {
  return ThemeController(ref.watch(prefsProvider));
});
