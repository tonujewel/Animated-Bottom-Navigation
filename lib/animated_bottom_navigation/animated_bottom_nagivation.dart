import 'package:flutter/material.dart';

class AnimatedBottomNagivation extends StatefulWidget {
  const AnimatedBottomNagivation({
    super.key,
    required this.itemList,
    this.background,
    this.buttonBgColor,
    required this.onChanged,
    this.iconColor,
    this.mainBoxShadow,
  });

  final List<IconData> itemList;
  final Color? background;
  final Color? iconColor;
  final BoxDecoration? buttonBgColor;
  final ValueChanged<int> onChanged;
  final List<BoxShadow>? mainBoxShadow;

  @override
  State<AnimatedBottomNagivation> createState() =>
      _AnimatedBottomNagivationState();
}

class _AnimatedBottomNagivationState extends State<AnimatedBottomNagivation> {
  double position = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.itemList.length > 6) {
      throw "Bottom navigation item max 6";
    }
    return Container(
      decoration: BoxDecoration(
        boxShadow: widget.mainBoxShadow ??
            [
              BoxShadow(
                color:
                    Theme.of(context).colorScheme.primary.withOpacity(.3), //New
                blurRadius: 3.0,
                spreadRadius: 1,
              )
            ],
        color: widget.background ?? Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      height: 60,
      child: Stack(
        children: [
          AnimatedPositioned(
            left: position,
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              // color: Colors.amber,
              height: 60,
              width:
                  (MediaQuery.of(context).size.width / widget.itemList.length),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: widget.buttonBgColor ??
                    BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.primary.withOpacity(.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
              ),
            ),
          ),
          ListView.builder(
              itemCount: widget.itemList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BottomItem(
                  icon: widget.itemList[index],
                  onTap: () {
                    doAnimation(index, context);
                    widget.onChanged(index);
                  },
                  width: (MediaQuery.of(context).size.width /
                      widget.itemList.length),
                );
              })
        ],
      ),
    );
  }

  void doAnimation(int index, BuildContext context) {
    double width = (MediaQuery.of(context).size.width / widget.itemList.length);

    setState(() {
      position = (width * index);
    });
  }
}

class BottomItem extends StatelessWidget {
  const BottomItem({
    super.key,
    required this.icon,
    required this.onTap,
    required this.width,
    this.iconColor,
  });

  final IconData icon;
  final Function() onTap;
  final double width;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Icon(icon),
      ),
    );
  }
}
