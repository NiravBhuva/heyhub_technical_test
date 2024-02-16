import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyhub_technical_test/app/modules/emoji_picker/views/emoji_picker_dialog_widget.dart';
import 'package:heyhub_technical_test/app/modules/emoji_picker/views/recent_emojis_widget.dart';

import '../controllers/emoji_picker_controller.dart';

class EmojiPickerView extends GetView<EmojiPickerController> {
  const EmojiPickerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Emoji Picker',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RecentEmojisWidget(),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => controller.resetSelection(),
                child: const Text('Reset'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.emoji_emotions_outlined),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const EmojiPickerDialogWidget(),
          );
        },
      ),
    );
  }
}
