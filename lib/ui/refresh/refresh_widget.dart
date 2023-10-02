import 'package:duqing/gen/assets.gen.dart';
import 'package:duqing/ui/dialog/page_loading.dart';
import 'package:duqing/ui/refresh/page_provider.dart';
import 'package:duqing/ui/refresh/refresh_enum.dart';
import 'package:duqing/ui/refresh/refresh_header.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../res/style.dart';
import 'behavior.dart';
import 'refresh_footer.dart';

class RefreshWidget<P extends PageProvider> extends StatefulWidget {
  const RefreshWidget({
    super.key,
    this.enablePullUp = true,
    this.enablePullDown = true,
    required this.child,
    required this.context,
  });

  ///是否启用上拉加载
  final bool enablePullUp;

  ///是否启用下拉刷新
  final bool enablePullDown;

  final Widget child;

  final BuildContext context;

  @override
  State<RefreshWidget> createState() => _MyWidgetState<P>();
}

class _MyWidgetState<P extends PageProvider> extends State<RefreshWidget>
    with AutomaticKeepAliveClientMixin {
  late P provider;

  ///刷新控制器
  RefreshController controller = RefreshController();

  @override
  void initState() {
    provider = widget.context.read<P>();
    super.initState();
    provider.initLoad(controller);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ///刷新控件
          _refreshWidget(),

          ///加载中
          _loadingWidget(),

          ///空页面
          _emptyWidget(),

          ///错误页面
          _errorWidget(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  _selector({required LoadState state, required Widget child}) {
    return Selector<P, LoadState>(
      selector: (_, provider) => provider.loadState,
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, loadState, _) {
        return Visibility(
          visible: provider.loadState == state,
          child: child,
        );
      },
    );
  }

  _refreshWidget() {
    return _selector(
      state: LoadState.success,
      child: ScrollConfiguration(
        behavior: OverScrollBehavior(),
        child: SmartRefresher(
          controller: controller,
          header: const RefreshHeader(),
          footer: const RefreshFooter(),
          enablePullDown: widget.enablePullDown,
          enablePullUp: widget.enablePullUp,
          onRefresh: () => provider.refreshData(controller),
          onLoading: () => provider.loadMore(controller),
          child: widget.child,
        ),
      ),
    );
  }

  _loadingWidget() {
    return _selector(
      state: LoadState.first,
      child: const PageLoading(),
    );
  }

  _emptyWidget() {
    return _selector(
      state: LoadState.empty,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            Assets.lotties.refreshEmptyPage,
            width: 200,
            animate: true,
            repeat: false,
          ),
          Text(
            '暂无数据',
            style: Style.b8c0d414.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }

  _errorWidget() {
    return _selector(
      state: LoadState.error,
      child: Lottie.asset(
        Assets.lotties.refreshError,
        width: 200,
        animate: true,
      ),
    );
  }
}
