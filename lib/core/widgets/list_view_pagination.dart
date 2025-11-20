import 'package:flutter/material.dart';

class ListViewPagination extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final void Function() addEvent;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  const ListViewPagination({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.addEvent,
    this.shrinkWrap = false,
    this.separatorBuilder,
    this.physics = const AlwaysScrollableScrollPhysics(),
  });

  @override
  State<ListViewPagination> createState() => _ListViewPaginationState();
}

class _ListViewPaginationState extends State<ListViewPagination> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      controller: _scrollController,
      shrinkWrap: widget.shrinkWrap,
      separatorBuilder: widget.separatorBuilder ??
          (_, index) => const SizedBox(
                height: 16,
              ),
      physics: widget.physics,
      primary: false,
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
    );
  }

  void _onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (maxScroll == currentScroll) {
      widget.addEvent();
    }
  }
}
