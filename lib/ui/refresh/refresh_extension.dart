import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../utils/toast_util.dart';
import 'refresh_enum.dart';

class RefreshExtension {
  ///刷新加载失败
  ///[controller] RefreshController
  ///[refresh] 加载类型 第一次、上拉、下拉
  static onError(RefreshController controller, Refresh refresh, String msg) {
    if (refresh == Refresh.pullDown) {
      controller.refreshFailed();
    } else if (refresh == Refresh.pullUp) {
      controller.loadFailed();
    }
    ToastUtil.show(msg);
  }

  ///刷新加载成功
  ///[controller] RefreshController
  ///[refresh] 加载类型 第一次、上拉、下拉
  ///[over] 是否为最后一页
  static onSuccess(RefreshController controller, Refresh refresh, bool over) {
    ///加载成功，重置刷新状态
    if (refresh == Refresh.pullDown) {
      controller.refreshCompleted();
    } else if (refresh == Refresh.pullUp) {
      controller.loadComplete();
    }

    ///最后一页了，无更多数据
    if (over) {
      controller.loadNoData();
    } else {
      controller.loadComplete();
    }
    if (refresh == Refresh.pullDown) {
      ToastUtil.show("刷新成功");
    }
  }
}
