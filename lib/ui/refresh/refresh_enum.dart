enum LoadState {
  ///首次加载中
  first,

  ///加载成功
  success,

  ///加载为空
  empty,

  ///加载失败
  error,
}

enum Refresh {
  ///初次加载
  first,

  ///下拉刷新
  pullDown,

  ///上拉加载
  pullUp,
}

class RefreshResponse<M> {
  final List<M> data;
  final bool over;
  final String? error;

  RefreshResponse({
    required this.data,
    required this.over,
    this.error,
  });

  @override
  String toString() {
    return 'data--->$data===over--->$over';
  }
}
