import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/review_cubit/review_cubit.dart';
import 'package:flutter/material.dart';

class ReviewsViewBody extends StatefulWidget {
  const ReviewsViewBody({
    super.key,
    required this.productId,
    required this.reviews,
    required this.averageRating,
    required this.totalReviews,
    required this.recommendedPercentage,
  });

  final String productId;
  final List<Map<String, dynamic>> reviews;
  final double averageRating;
  final int totalReviews;
  final double recommendedPercentage;

  @override
  State<ReviewsViewBody> createState() => _ReviewsViewBodyState();
}

class _ReviewsViewBodyState extends State<ReviewsViewBody> {
  final TextEditingController _reviewController = TextEditingController();
  double _selectedRating = 5.0;

  static const Color _primary = Color(0xFFF57C00);
  static const Color _bg = Color(0xFFFFFCF8);
  static const Color _card = Colors.white;
  static const Color _soft = Color(0xFFFFF3E6);
  static const Color _textDark = Color(0xFF2F3637);
  static const Color _textMuted = Color(0xFF7A7F80);
  static const Color _border = Color(0xFFF1E3D3);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _bg,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAddReviewCard(),
          const SizedBox(height: 20),
          _buildSummaryCard(),
          const SizedBox(height: 20),
          Text(
            'جميع المراجعات',
            style: TextStyles.bold19.copyWith(color: _textDark),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 12),
          ...widget.reviews.asMap().entries.map((entry) {
            return _buildReviewCard(entry.value, entry.key);
          }),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildAddReviewCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: _primary, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    Assets.imagesProfileAlwadi2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: _border),
                  ),
                  child: TextField(
                    controller: _reviewController,
                    minLines: 1,
                    maxLines: 3,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: 'اكتب تعليقك هنا...',
                      hintStyle: TextStyles.regular13.copyWith(
                        color: const Color(0xFFA0A7A8),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(5, (index) {
                    final selected = index < _selectedRating;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedRating = index + 1.0;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Icon(
                          selected
                              ? Icons.star_rounded
                              : Icons.star_border_rounded,
                          color: _primary,
                          size: 30,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {
                if (_reviewController.text.trim().isEmpty) return;

                getIt<ReviewsCubit>().addReview(
                  widget.productId,
                  _reviewController.text.trim(),
                  _selectedRating,
                );

                _reviewController.clear();
                setState(() {
                  _selectedRating = 5.0;
                });
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: _primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: const Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 18,
              ),
              label: Text(
                'إرسال المراجعة',
                style: TextStyles.semiBold13.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${widget.totalReviews} مراجعة',
            style: TextStyles.bold19.copyWith(color: _textDark),
          ),
          const SizedBox(height: 4),
          Text(
            'ملخص تقييمات المنتج',
            style: TextStyles.regular13.copyWith(color: _textMuted),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _buildRatingBar(5, 0.60),
                    const SizedBox(height: 8),
                    _buildRatingBar(4, 0.20),
                    const SizedBox(height: 8),
                    _buildRatingBar(3, 0.10),
                    const SizedBox(height: 8),
                    _buildRatingBar(2, 0.05),
                    const SizedBox(height: 8),
                    _buildRatingBar(1, 0.05),
                  ],
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: _soft,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.star_rounded, color: _primary, size: 26),
                          const SizedBox(width: 4),
                          Text(
                            widget.averageRating.toStringAsFixed(1),
                            style: TextStyles.bold28.copyWith(color: _textDark),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${widget.recommendedPercentage.toStringAsFixed(0)}% يوصون بهذا المنتج',
                        style: TextStyles.regular13.copyWith(
                          color: _textMuted,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int stars, double percentage) {
    return Row(
      children: [
        Text('$stars', style: TextStyles.regular13.copyWith(color: _textMuted)),
        const SizedBox(width: 6),
        Icon(Icons.star_rounded, color: _primary, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: _primary,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: _primary, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                Assets.imagesProfileAlwadi2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    PopupMenuButton<String>(
                      color: Colors.white,
                      onSelected: (value) {
                        if (value == 'delete') {
                          _showDeleteDialog(context, index);
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem<String>(
                          value: 'delete',
                          child: Text('حذف'),
                        ),
                      ],
                      icon: Icon(
                        Icons.more_vert_rounded,
                        color: _textMuted,
                        size: 20,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: _soft,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star_rounded, color: _primary, size: 15),
                          const SizedBox(width: 4),
                          Text(
                            '${review['rating']}',
                            style: TextStyles.semiBold13.copyWith(
                              color: _textDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        review['name'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.bold16.copyWith(color: _textDark),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  review['date'],
                  style: TextStyles.regular11.copyWith(
                    color: const Color(0xFFA0A7A8),
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 12),
                Text(
                  review['text'],
                  style: TextStyles.regular13.copyWith(
                    color: _textMuted,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'حذف المراجعة',
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
        content: Text(
          'هل أنت متأكد من حذف هذه المراجعة؟',
          textAlign: TextAlign.right,
          style: TextStyles.regular13,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'إلغاء',
              style: TextStyles.semiBold13.copyWith(color: _textMuted),
            ),
          ),
          TextButton(
            onPressed: () {
              getIt<ReviewsCubit>().deleteReview(widget.productId, index);
              Navigator.pop(context);
            },
            child: Text(
              'حذف',
              style: TextStyles.semiBold13.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
