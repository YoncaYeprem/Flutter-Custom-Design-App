import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  var imgPath;
  DetailPage({Key? key, required this.imgPath}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color? baskinRenk;
  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    super.initState();
    baskinRengiBul();
  }

  void baskinRengiBul() async {
    Future<PaletteGenerator> fPaletGenerator =
        PaletteGenerator.fromImageProvider(AssetImage(widget.imgPath));
    await fPaletGenerator.then((value) {
      paletteGenerator = value;
      setState(() {
        baskinRenk = paletteGenerator!.vibrantColor?.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: widget.imgPath,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.imgPath), fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              left: 15,
              right: 15,
              bottom: 15,
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(4, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Brand Name",
                        style: TextStyle(
                            fontSize: 20,
                            color: baskinRenk ?? const Color(0xFF222c69),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Category : Wine",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        "80% Alcohol",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: Text(
                          "Vivamus porta dui nec mi consequat, ut euismod ante sagittis. Praesent justo risus, mollis vel mauris et, pharetra consequat metus. Vivamus vel semper metus. Quisque quis congue orci, a pretium leo. In hac habitasse platea dictumst. ",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - 30) / 2,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: baskinRenk ?? const Color(0xFF222c69),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ),
                              child: const Text("Contact"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
