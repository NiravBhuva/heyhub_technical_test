import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:heyhub_technical_test/app/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmojiPickerController extends GetxController {
  final RxList<dynamic> emojis = RxList<dynamic>([]);
  final RxMap<String, List<dynamic>> categories =
      RxMap<String, List<dynamic>>({});
  final RxList<String> recentEmojis = RxList<String>([]);

  @override
  void onInit() {
    super.onInit();
    fetchEmojis();
    loadRecentEmojis();
  }

  void fetchEmojis() {
    try {
      emojis.value = json.decode(AppConstants.EMOJI_DATA);
      categorizeEmojis();
    } catch (e) {
      log('Failed to fetch emojis: $e');
    }
  }

  void categorizeEmojis() {
    String? currentCategory;
    for (var item in emojis) {
      if (item is List && item.isNotEmpty) {
        if (item.length == 1) {
          currentCategory = item.first.toString();
          categories.putIfAbsent(currentCategory, () => []);
        } else if (currentCategory != null) {
          categories[currentCategory]?.add(item[2]);
        }
      }
    }
  }

  Future<void> loadRecentEmojis() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedRecentEmojis = prefs.getStringList('recent_emojis');
    if (savedRecentEmojis != null) {
      recentEmojis.value = savedRecentEmojis;
    }
  }

  Future<void> saveRecentEmoji(String emoji) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedRecentEmojis = List.from(recentEmojis);

    if (updatedRecentEmojis.contains(emoji)) {
      updatedRecentEmojis.remove(emoji);
    }
    updatedRecentEmojis.insert(0, emoji);
    if (updatedRecentEmojis.length > 10) {
      updatedRecentEmojis.removeLast();
    }

    recentEmojis.value = updatedRecentEmojis;
    await prefs.setStringList('recent_emojis', updatedRecentEmojis);
  }

  Future<void> resetSelection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    recentEmojis.clear();
    await prefs.clear();
  }
}
