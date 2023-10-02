import 'package:duqing/ui/refresh/refresh_enum.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'refresh_extension.dart';

abstract class PageProvider<M> extends ChangeNotifier {
  ///加载状态
  LoadState loadState = LoadState.first;

  ///分页数
  int page = 0;

  ///数据
  List<M> data = [];

  ///是否为初次加载
  bool isInit = true;

  ///控制器
  late RefreshController controller;

  ///加载成功展示页面
  showSuccess(List data) {
    loadState = data.isNotEmpty ? LoadState.success : LoadState.empty;
    notifyListeners();
  }

  ///加载失败展示页面
  showError() {
    loadState = LoadState.error;
    notifyListeners();
  }

  ///重新加载
  reload() {
    loadState = LoadState.first;
    notifyListeners();
  }

  ///初次加载
  initLoad(RefreshController controller) {
    if (isInit) {
      this.controller = controller;
      isInit = false;
      _requestData(controller);
    }
  }

  ///加载更多
  loadMore(RefreshController controller) {
    page++;
    _requestData(controller, refresh: Refresh.pullUp);
  }

  ///刷新
  refreshData(RefreshController controller) {
    page = 0;
    _requestData(controller, refresh: Refresh.pullDown);
  }

  ///获取数据
  _requestData(RefreshController controller,
      {Refresh refresh = Refresh.first}) async {
    final resp = await request();
    if (resp.error != null) {
      showError();
      RefreshExtension.onError(controller, refresh, resp.error!);
    } else {
      RefreshExtension.onSuccess(controller, refresh, resp.over);
      if (refresh == Refresh.pullDown) {
        this.data.clear();
      }
      this.data.addAll(resp.data);
      showSuccess(data);
    }
  }

  Future<RefreshResponse<M>> request();
}
