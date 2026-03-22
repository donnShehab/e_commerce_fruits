import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryOrange = Color(0xFFF57C00);
    const softOrange = Color(0xFFFFF3E6);
    const softGreen = Color(0xFFEAF7EE);
    const darkText = Color(0xFF2F3637);
    const bodyText = Color(0xFF6B7280);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF8),
      appBar: buildAppBar(context, title: 'من نحن', showNotification: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFFFFEDD8), Color(0xFFFFF7ED)],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFF6D7B8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'منذ 1978',
                      style: TextStyles.semiBold13.copyWith(
                        color: primaryOrange,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'الوادي للأغذية',
                    style: TextStyles.bold19.copyWith(
                      color: darkText,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'رحلة من الجودة والثقة والتميّز في عالم الأغذية، نضع فيها خبرتنا الطويلة لنقدّم منتجات تلبي تطلعات عملائنا كل يوم.',
                    style: TextStyles.regular13.copyWith(
                      color: bodyText,
                      height: 1.9,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            Text(
              'نبذة عنا',
              style: TextStyles.bold19.copyWith(color: darkText, height: 1.5),
            ),
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFF1E3D3)),
              ),
              child: Text(
                'في الوادي للأغذية، بدأت رحلتنا منذ عام 1978 بشغف كبير لتقديم الجودة الاستثنائية في كل منتج. نحن نفخر بكوننا من الشركات الرائدة في مجال الأغذية المجمدة والمبردة والمعلبة، ونلتزم بتقديم أفضل المكونات وأطيب النكهات لعملائنا.',
                style: TextStyles.regular13.copyWith(
                  color: bodyText,
                  height: 2,
                ),
                textAlign: TextAlign.right,
              ),
            ),

            const SizedBox(height: 14),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: softOrange,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFF8D6B4)),
              ),
              child: Text(
                'تضم منتجاتنا تشكيلة متنوعة تشمل اللحوم الباردة عالية الجودة، والمنتجات المغلفة والمقرمشة، بالإضافة إلى الأصناف المعلبة العملية، وكلها تُحضَّر وفق أعلى معايير الجودة والتميّز.',
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xFF8A4B08),
                  height: 1.9,
                ),
                textAlign: TextAlign.right,
              ),
            ),

            const SizedBox(height: 14),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFF1E3D3)),
              ),
              child: Text(
                'في الوادي، نؤمن بأن النجاح يبدأ من الثقة، لذلك نحرص دائمًا على تقديم منتجات موثوقة، وخدمة متميزة، والتزام حقيقي بالنزاهة والجودة في كل ما نقدمه.',
                style: TextStyles.regular13.copyWith(
                  color: bodyText,
                  height: 2,
                ),
                textAlign: TextAlign.right,
              ),
            ),

            const SizedBox(height: 22),

            Text(
              'قيمنا الأساسية',
              style: TextStyles.bold19.copyWith(color: darkText, height: 1.5),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                _ValueChip(
                  title: 'جودة عالية',
                  icon: Icons.verified_rounded,
                  bgColor: Color(0xFFFFF3E6),
                  iconColor: Color(0xFFF57C00),
                  textColor: Color(0xFF8A4B08),
                ),
                _ValueChip(
                  title: 'ثقة ومصداقية',
                  icon: Icons.handshake_rounded,
                  bgColor: Color(0xFFEAF7EE),
                  iconColor: Color(0xFF2E7D32),
                  textColor: Color(0xFF256029),
                ),
                _ValueChip(
                  title: 'خدمة استثنائية',
                  icon: Icons.support_agent_rounded,
                  bgColor: Color(0xFFFFF3E6),
                  iconColor: Color(0xFFF57C00),
                  textColor: Color(0xFF8A4B08),
                ),
                _ValueChip(
                  title: 'نزاهة في العمل',
                  icon: Icons.workspace_premium_rounded,
                  bgColor: Color(0xFFEAF7EE),
                  iconColor: Color(0xFF2E7D32),
                  textColor: Color(0xFF256029),
                ),
                _ValueChip(
                  title: 'التزام بالتميّز',
                  icon: Icons.star_rounded,
                  bgColor: Color(0xFFFFF3E6),
                  iconColor: Color(0xFFF57C00),
                  textColor: Color(0xFF8A4B08),
                ),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _ValueChip extends StatelessWidget {
  const _ValueChip({
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    required this.textColor,
  });

  final String title;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: iconColor),
          const SizedBox(width: 8),
          Text(title, style: TextStyles.semiBold13.copyWith(color: textColor)),
        ],
      ),
    );
  }
}
