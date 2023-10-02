import 'package:duqing/ui/refresh/page_provider.dart';
import 'package:duqing/ui/refresh/refresh_enum.dart';

class SplashProvider extends PageProvider<int> {
  @override
  Future<RefreshResponse<int>> request() async {
    final data = await generateNumbers(page);

    return RefreshResponse(data: data, over: page > 2);
  }

  Future<List<int>> generateNumbers(int page) async {
    int start = page * 100 + 1;

    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));

    List<int> numbers = List.generate(100, (index) => start + index);

    return numbers;
  }
}
