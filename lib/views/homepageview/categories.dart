import 'package:flutter/material.dart';
import 'package:netflix_ui/models/genre.dart';
import 'package:netflix_ui/services/list_fetch.dart';

class GenreList extends StatefulWidget {
  const GenreList({Key? key}) : super(key: key);

  @override
  _GenreListState createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  late Future<Genre> futureList;

  @override
  void initState() {
    futureList = fetchList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.transparent,
        body: FutureBuilder<Genre>(
          future: futureList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (context, index){
                return Text(snapshot.data!.name);
              });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ));
  }
}
