import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newkhabar/components/searchbar.dart';
import 'package:newkhabar/utils/key.dart';

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=' +
            Keys.key +
            '&q=' +
            Searchbar.searchcontroller.text),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);
}
