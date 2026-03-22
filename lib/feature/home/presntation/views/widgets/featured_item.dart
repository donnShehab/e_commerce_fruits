import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.isSvg = false,
  });

  final String imagePath;
  final String title;
  final String subtitle;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 342 / 175,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFFFFFAF5), Color(0xFFFFF1E4), Color(0xFFFFE3BF)],
          ),
          border: Border.all(color: const Color(0xFFF3DDC6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Stack(
            children: [
              Positioned(
                left: 2,
                top: 2,
                bottom: 2,
                right: 140,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: isSvg
                      ? SvgPicture.asset(
                          imagePath,
                          fit: BoxFit.contain,
                          alignment: Alignment.centerLeft,
                        )
                      : Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                          alignment: Alignment.centerLeft,
                        ),
                ),
              ),

              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withOpacity(0.04),
                        Colors.black.withOpacity(0.10),
                      ],
                      stops: const [0.0, 0.45, 0.75, 1.0],
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 14,
                left: 14,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.92),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.local_fire_department_rounded,
                        size: 15,
                        color: Color(0xFFF57C00),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'لفترة محدودة',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF8D4B00),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 16,
                bottom: 16,
                right: 8,
                child: Container(
                  width: 138,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF57C00),
                    borderRadius: BorderRadius.circular(26),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFF57C00).withOpacity(0.50),
                        blurRadius: 20,
                        offset: const Offset(3, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyles.regular16.copyWith(
                          color: Colors.white.withOpacity(0.95),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        subtitle,
                        style: TextStyles.bold19.copyWith(
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFFF57C00),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'تسوق الآن',
                            style: TextStyles.bold13.copyWith(
                              color: const Color(0xFFF57C00),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
