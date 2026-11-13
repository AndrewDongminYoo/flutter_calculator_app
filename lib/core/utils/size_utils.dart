// 📦 Package imports:
import 'package:material_ui/material_ui.dart';

extension ContextSize on BuildContext {
  /// 현재 [MediaQuery]의 너비를 반환합니다.
  ///
  /// 이 메서드는 `MediaQuery.of(context).size.width`를 호출하지 않아도 되는 편리한 메서드입니다.
  double getWidth() => MediaQuery.sizeOf(this).width;

  /// 현재 [MediaQuery]의 높이를 반환합니다.
  ///
  /// 이 메서드는 `MediaQuery.of(context).size.height`를 호출하지 않아도 되는 편리한 메서드입니다.
  double getHeight() => MediaQuery.sizeOf(this).height;

  /// 현재 화면의 하단 인셋을 반환하며, 일반적으로 키보드가 보이는 경우 키보드의 높이입니다.
  ///
  /// 키보드와 겹치지 않도록 UI의 레이아웃을 조정하는 데 사용할 수 있습니다.
  double getBottom() => MediaQuery.viewInsetsOf(this).bottom;
}
