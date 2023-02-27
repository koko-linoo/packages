import 'package:flutter/material.dart';

class PScrollList<T> extends StatelessWidget {
  const PScrollList({
    super.key,
    this.loading = true,
    this.isFetching = false,
    this.isLast = false,
    this.list = const [],
    required this.buildItem,
    required this.fetchMore,
    required this.refresh,
  });

  final bool loading;
  final bool isFetching;
  final bool isLast;
  final List<T> list;
  final Widget Function(T) buildItem;
  final void Function() fetchMore;
  final Future<void> Function() refresh;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final direction = notification.metrics.axisDirection;
        final fetch = !isFetching && !isLast && direction == AxisDirection.down;
        if (fetch) fetchMore();
        return true;
      },
      child: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (T item in list) buildItem(item),
              if (isFetching)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
