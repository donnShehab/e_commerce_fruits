import 'package:equatable/equatable.dart';

abstract class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

class ReviewsInitial extends ReviewsState {}

class ReviewsLoading extends ReviewsState {}

class ReviewsLoaded extends ReviewsState {
  final List<Map<String, dynamic>> reviews;
  final double averageRating;
  final int totalReviews;
  final double recommendedPercentage;

  const ReviewsLoaded({
    required this.reviews,
    required this.averageRating,
    required this.totalReviews,
    required this.recommendedPercentage,
  });

  @override
  List<Object> get props => [
    reviews,
    averageRating,
    totalReviews,
    recommendedPercentage,
  ];
}

class ReviewsError extends ReviewsState {
  final String message;

  const ReviewsError(this.message);

  @override
  List<Object> get props => [message];
}
