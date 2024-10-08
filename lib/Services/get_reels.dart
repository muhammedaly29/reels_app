import 'package:spider_tech/Helper/api.dart';
import 'package:spider_tech/Models/content_model.dart';

class GetReels {
  final Uri url = Uri.parse('https://api.sawalef.app/api/v1/reels');
  final Api api = Api();

  Future<List<ContentModel>> fetchReels() async {
    Map<String, dynamic> data = await api.get(url);

    if (data['data'] != null) {
      List<dynamic> reelsData = data['data'];
      return reelsData.map((item) => ContentModel.fromJson(item)).toList();
    } else {
      throw Exception('No data found');
    }
  }
}