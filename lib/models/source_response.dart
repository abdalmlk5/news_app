import 'package:news_app/models/source_model.dart';

class SourceResponse {
  String? status;
  List<SourceModel>? sources;

  SourceResponse({this.status, this.sources});

  SourceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = <SourceModel>[];
      json['sources'].forEach((v) {
        sources!.add(SourceModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (sources != null) {
      data['sources'] = sources!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
