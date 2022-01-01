import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/models/genre.dart';
import 'package:netflix_ui/services/api_service.dart';

class GenreList extends StatefulWidget {
  const GenreList({Key? key}) : super(key: key);

  @override
  _GenreListState createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  late Future<Movie> categoryList;

  @override
  void initState() {
    categoryList = ApiManager().getGenre();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey.shade900,
          onPressed: () => Get.back(),
          child: const Icon(Icons.close, color: Colors.white,size: 30,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.transparent,
        body: FutureBuilder<Movie>(
          future: categoryList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data!);
              return ListView.builder(
                  itemCount: snapshot.data!.genres.length,
                  itemBuilder: (context, index) {
                    var genre = snapshot.data!.genres[index];
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          genre.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
