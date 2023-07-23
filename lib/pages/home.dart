import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newkhabar/backend/functions.dart';
import 'package:newkhabar/components/newsbox.dart';
import 'package:newkhabar/drawer/business.dart';
import 'package:newkhabar/drawer/entertainment.dart';
import 'package:newkhabar/drawer/general.dart';
import 'package:newkhabar/drawer/health.dart';
import 'package:newkhabar/drawer/science.dart';
import 'package:newkhabar/drawer/sports.dart';
import 'package:newkhabar/drawer/technology.dart';
import 'package:newkhabar/utils/colors.dart';
import 'package:newkhabar/utils/constants.dart';
import 'package:newkhabar/utils/text.dart';
import '../components/appbar.dart';
import '../components/searchbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.black45,
            child: ListView(
              children: [
                DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    //  color: Colors.red,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        boldText(text: 'N', size: 30, color: AppColors.primary),
                        modifiedText(
                            text: 'K', size: 30, color: AppColors.lightwhite)
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.business),
                  title: Text(
                    'Business',
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Business(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.movie),
                  title: Text(
                    'Entertainment',
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Entertainment(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.newspaper),
                  title: Text(
                    'General',
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => General(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.health_and_safety_rounded),
                  title: Text(
                    'Health',
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => health(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.science),
                  title: Text(
                    'Science',
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Science(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.sports_cricket),
                  title: Text(
                    'Sports',
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sports(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.computer),
                  title: Text(
                    'Technology',
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Technology(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        backgroundColor: AppColors.black,
        appBar: appbar(),
        body: Column(
          children: [
            Searchbar(),
            Expanded(
              child: Container(
                  //   color: Colors.black54,
                  width: w,
                  child: FutureBuilder<List>(
                    future: fetchnews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return NewsBox(
                                url: snapshot.data![index]['url'],
                                imageurl:
                                    snapshot.data![index]['urlToImage'] != null
                                        ? snapshot.data![index]['urlToImage']
                                        : Constants.imageurl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]
                                        ['description']
                                    .toString(),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ));
                    },
                  )),
            ),
          ],
        ));
  }
}
