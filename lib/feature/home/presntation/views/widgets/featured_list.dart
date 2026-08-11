import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  static const double _gap = 8;
  static const int _count = 3;

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder يعطي العرض الفعلي المتاح بدل تخمينه من MediaQuery.
    // كل بطاقة تملأ العرض المرئي تمامًا، مع فاصل 8 بين البطاقات.
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = constraints.maxWidth;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              _count,
              (index) => Padding(
                padding: EdgeInsetsDirectional.only(
                  end: index == _count - 1 ? 0 : _gap,
                ),
                child: FeaturedItem(width: itemWidth),
              ),
            ),
          ),
        );
      },
    );
  }
}
