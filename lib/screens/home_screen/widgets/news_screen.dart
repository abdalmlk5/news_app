import 'package:flutter/material.dart';
import 'package:news_app/core/api/api_manager.dart';

class NewsScreen extends StatelessWidget {
  final String sourcesID;

  const NewsScreen({super.key, required this.sourcesID});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewsData(sourcesID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == .waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("some thing went wrong");
        } else {
          var articles = snapshot.data?.articles ?? [];
          return articles.isEmpty
              ? Center(child: Text("No data"))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            articles[index].urlToImage ?? '',
                            height: 200,
                            width: double.infinity,
                            fit: .cover,
                          ),
                          Text(
                            articles[index].title ?? "",
                            maxLines: 1,
                            overflow: .ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            articles[index].description ?? "",
                            maxLines: 2,
                            overflow: .ellipsis,
                          ),
                          SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(articles[index].author ?? ""),
                              // Text(
                              //   articles[index].author?.split(" ").first ?? "",
                              // ),
                              Text(
                                articles[index].publishedAt?.substring(0, 10) ??
                                    "",
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: articles.length,
                );
        }
      },
    );
  }
}
