import 'package:appentus/Authors/authors_model.dart';
import 'package:appentus/imports.dart';
import 'package:dio/dio.dart';

class Authors extends StatefulWidget {
  static const route = "/authors";
  const Authors({Key? key}) : super(key: key);

  @override
  _AuthorsState createState() => _AuthorsState();
}

class _AuthorsState extends State<Authors> {
  List<AuthorModel> authors = [];
  @override
  void initState() {
    fetchAuthors();
    super.initState();
  }

  fetchAuthors() async {
    try {
      final response = await Dio().get(
        "https://picsum.photos/v2/list",
      );
      final res = response.data;
      res.forEach((f) => authors.add(AuthorModel.fromJson(f)));
      setState(() {});
    } catch (e) {
      Utils.printData("Error occured in https://picsum.photos/v2/list $e ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appBar(
          title: Text(
        "Authors",
        style: TextStyle(color: Colors.black),
      )),
      body: StaggeredGridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        crossAxisCount: MediaQuery.of(context).size.width > 900
            ? 6
            : MediaQuery.of(context).size.width > 600
                ? 3
                : 2,
        staggeredTiles: List.generate(authors.length, (index) {
          return StaggeredTile.fit(1);
        }),
        children: List.generate(authors.length, (index) {
          final author = authors[index];
          return Card(
            elevation: 5,
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Image.network(
                    author.downloadUrl.toString(),

                    // scale: author.height! / author.width!,
                  ),
                  Text(author.author.toString())
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
