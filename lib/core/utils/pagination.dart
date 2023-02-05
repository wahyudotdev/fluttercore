import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Pagination<T> {
  late PagingController<int, T> _controller;
  late int _pageSize;
  late int _firstPage;

  Pagination({int firstPage = 1, int pageSize = 10}) {
    _pageSize = pageSize;
    _firstPage = firstPage;
    _controller = PagingController(firstPageKey: firstPage);
  }

  PagingController<int, T> get controller => _controller;

  int get firstPage => _firstPage;

  int get pageSize => _pageSize;

  void fetchData(Future<List<T>> func) async {
    try {
      final result = await func;
      final isLastPage = result.length < pageSize;
      if (isLastPage) {
        controller.appendLastPage(result);
      } else {
        final now = controller.nextPageKey ?? firstPage;
        final nextPageKey = now + (result.length / pageSize);
        controller.appendPage(result, nextPageKey.toInt());
      }
    } catch (e) {
      controller.error = e;
    }
  }
}