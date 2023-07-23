import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newkhabar/components/drawerbox.dart';
import 'package:newkhabar/components/searchbar.dart';
import 'package:newkhabar/utils/key.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';

Future<List> fetchscience() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=science&pageSize=100&apiKey=' +
            Keys.key +
            '&q=' +
            Searchbar.searchcontroller.text),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);
}

class Science extends StatelessWidget {
  const Science({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List>(
        future: fetchscience(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return DrawerBox(
                  imageurl: snapshot.data![index]['urlToImage'] != null
                      ? snapshot.data![index]['urlToImage']
                      : Constants.imageurl,
                  description: snapshot.data![index]['description'].toString(),
                  title: snapshot.data![index]['title'],
                  time: snapshot.data![index]['publishedAt'],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        },
      ),
    );
  }
}
