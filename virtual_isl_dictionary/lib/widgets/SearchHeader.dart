import 'package:flutter/material.dart';

class SearchHeader extends StatefulWidget {
  Widget child;
  SearchHeader({this.child});
  @override
  State<StatefulWidget> createState() => new _SearchHeaderState(this.child);
}

class _SearchHeaderState extends State<SearchHeader> {
  Widget child;
  _SearchHeaderState(this.child);
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: _SliverPersistentDelegate(
          child: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.white,
              child: child
              ),
            ),
          )
    );
  }
}

class _SliverPersistentDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;
  _SliverPersistentDelegate({this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}