import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyhub_technical_test/app/modules/emoji_picker/controllers/emoji_picker_controller.dart';
import 'package:heyhub_technical_test/app/modules/emoji_picker/views/recent_emojis_widget.dart';

class EmojiPickerDialogWidget extends GetView<EmojiPickerController> {
  const EmojiPickerDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Emoji Picker'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const RecentEmojisWidget(),
                      const SizedBox(height: 20),
                      ...controller.categories.keys.map((category) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: controller.categories[category]!.map((emoji) {
                                return GestureDetector(
                                  onTap: () => controller.saveRecentEmoji(emoji.toString()),
                                  child: Text(
                                    emoji.toString(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                );
                              }).toList(),
                            ),
                            const Divider(),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: FilledButton(
                          onPressed: () => controller.resetSelection(),
                          child: const Text('Reset'))),
                  const SizedBox(width: 15),
                  Expanded(child: FilledButton(onPressed: () => Get.back(), child: const Text('Done'))),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
