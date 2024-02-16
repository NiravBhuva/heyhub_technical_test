import 'package:get/get.dart';

import '../controllers/emoji_picker_controller.dart';

class EmojiPickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmojiPickerController>(
      () => EmojiPickerController(),
    );
  }
}
