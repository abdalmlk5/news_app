import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/models/article_model.dart';

import '../../../core/app_styles.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel article;

  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.onPrimary),
        color: AppColors.onPrimary.withAlpha(20),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(
              article.urlToImage ?? '',
              fit: .cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Column(
                    mainAxisSize: .min,
                    children: [
                      Icon(Icons.broken_image_outlined),
                      SizedBox(height: 10),
                      Text("No image"),
                    ],
                  ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
          Text(
            article.title ?? "",
            style: AppStyles.onPrimary16700,
            maxLines: 1,
            overflow: .ellipsis,
          ),
          SizedBox(height: 5),
          Text(
            article.description ?? "",
            style: AppStyles.onPrimary14500,
            maxLines: 2,
            overflow: .ellipsis,
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(
                child: Text(
                  // article.author?.split(" ").first ?? "",
                  article.author ?? "Unknown",
                  style: AppStyles.gray12500,
                  overflow: .ellipsis,
                ),
              ),
              SizedBox(width: 10),
              Text(
                article.publishedAt?.substring(0, 10) ?? "",
                style: AppStyles.gray12500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
