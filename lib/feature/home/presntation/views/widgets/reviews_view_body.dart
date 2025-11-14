import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
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
  double _selectedRating = 5.0; // For adding review

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Add Review Box
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/images/profileImage.png',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _reviewController,
                        decoration: InputDecoration(
                          hintText: 'اكتب التعليق...',
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Rating selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < _selectedRating
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedRating = index + 1.0;
                        });
                      },
                    );
                  }),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.send, color: AppColors.primaryColor),
                    onPressed: () {
                      getIt<ReviewsCubit>().addReview(
                        // Using getIt for add action
                        widget.productId,
                        _reviewController.text,
                        _selectedRating,
                      );
                      _reviewController.clear();
                      setState(() {
                        _selectedRating = 5.0;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24),

        // Summary Section
        Text(
          '${widget.totalReviews} مراجعه',
          style: TextStyles.bold19,
          textAlign: TextAlign.right,
        ),
        Text(
          'الملخص',
          style: TextStyles.regular16.copyWith(color: Colors.grey),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 16),
        Row(
          children: [
            // Bar Chart
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  _buildRatingBar(5, 0.6),
                  _buildRatingBar(4, 0.2),
                  _buildRatingBar(3, 0.1),
                  _buildRatingBar(2, 0.05),
                  _buildRatingBar(1, 0.05),
                ],
              ),
            ),
            SizedBox(width: 16),
            // Average Rating and Recommended
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${widget.averageRating.toStringAsFixed(1)}',
                        style: TextStyles.bold28,
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.star, color: Colors.orange, size: 28),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${widget.recommendedPercentage.toStringAsFixed(0)}% موصى بها',
                    style: TextStyles.regular13.copyWith(color: Colors.grey),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 24),

        // Review List
        ...widget.reviews.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> review = entry.value;
          return _buildReviewCard(review, index);
        }).toList(),
      ],
    );
  }

  Widget _buildRatingBar(int stars, double percentage) {
    return Row(
      children: [
        Text('$stars', style: TextStyles.regular13),
        SizedBox(width: 8),
        Icon(Icons.star, color: Colors.orange, size: 16),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review, int index) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profileImage.png'),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(review['name'], style: TextStyles.bold16),
                      Row(
                        children: [
                          Text(
                            '${review['rating']}',
                            style: TextStyles.regular13,
                          ),
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          SizedBox(width: 8),
                          // Delete button on the right (RTL-friendly)
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                            onPressed: () {
                              _showDeleteDialog(context, index);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    review['date'],
                    style: TextStyles.regular11.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    review['text'],
                    style: TextStyles.regular13,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('حذف المراجعة', textAlign: TextAlign.right),
        content: Text(
          'هل أنت متأكد من حذف هذه المراجعة؟',
          textAlign: TextAlign.right,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              getIt<ReviewsCubit>().deleteReview(
                widget.productId,
                index,
              ); // Delete via cubit
              Navigator.pop(context);
            },
            child: Text('حذف', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
