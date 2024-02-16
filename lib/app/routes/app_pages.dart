import 'package:get/get.dart';

import '../modules/emoji_picker/bindings/emoji_picker_binding.dart';
import '../modules/emoji_picker/views/emoji_picker_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.EMOJI_PICKER;

  static final routes = [
    GetPage(
      name: _Paths.EMOJI_PICKER,
      page: () => const EmojiPickerView(),
      binding: EmojiPickerBinding(),
    ),
  ];
}
