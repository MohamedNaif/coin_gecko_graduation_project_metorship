import 'package:flutter/material.dart';

class ResponsiveForm {
  static const mobileSize = 400;

  static Widget responsiveForm({
    required List<Widget> children,
    double horizontalSpacing = 8,
    double verticalSpacing = 8,
    double sizeForElement = .8,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var count = (constraints.maxWidth ~/ (mobileSize * sizeForElement)) == 0
            ? 1
            : (constraints.maxWidth ~/ (mobileSize * sizeForElement));
        var mod = children.length % count;
        List<Widget> list = List.generate(
          (children.length ~/ count),
          (index) => Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              count,
              (index2) {
                int i = index2 + (index * count);
                return Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      // right: index2 == count - 1 ? 0 : horizontalSpacing,
                      end: index2 == count - 1 ? 0 : horizontalSpacing,
                      top: verticalSpacing,
                    ),
                    child: children[i],
                  ),
                );
              },
            ),
          ),
        );
        if (mod > 0) {
          list.add(Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(count, (index) {
              if (mod == 0) {
                return const Spacer();
              }
              var widget = children[children.length - mod];
              mod--;
              return Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: horizontalSpacing,
                    top: verticalSpacing,
                  ),
                  child: widget,
                ),
              );
            }),
          ));
        }
        return Column(
          children: list,
        );
      },
    );
  }
}
