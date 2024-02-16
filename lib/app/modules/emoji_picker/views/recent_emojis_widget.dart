import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyhub_technical_test/app/modules/emoji_picker/controllers/emoji_picker_controller.dart';

class RecentEmojisWidget extends GetView<EmojiPickerController> {
  const RecentEmojisWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Emojis',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: controller.recentEmojis.map((emoji) {
              return GestureDetector(
                onTap: () {
                  controller.saveRecentEmoji(emoji);
                },
                child: Text(
                  emoji,
                  style: const TextStyle(fontSize: 24),
                ),
              );
            }).toList(),
          ),
          Visibility(
            visible: controller.recentEmojis.isEmpty,
            child: const Text("No Emoji's Selected"),
          ),
        ],
      );
    });
  }
}
