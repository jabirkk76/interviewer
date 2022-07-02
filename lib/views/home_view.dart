import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview/MODELS/Model.dart';
import 'package:interview/CONTROLLERS/controller.dart';
import 'package:interview/views/details_view.dart';

class homescreen extends StatefulWidget {
  homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  ControllingClass a = ControllingClass();
  @override
  void initState() {
    a.controller();
    // TODO: implement initState
    super.initState();
  }

  List data = [];

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: a.controller(),
        builder: (BuildContext context, AsyncSnapshot<ModelClass> snapshot) {
          search(text) {
            data.clear();
            for (int i = 0; i < (snapshot.data?.drinks?.length ?? 0); i++) {
              var searchText = snapshot.data?.drinks?[i].idDrink;
              if (searchText!.toLowerCase().contains(text.toLowerCase())) {
                data.add(searchText);
                setState(() {});
                print(data[i]);
              }
            }
          }

          return Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: TextField(
                      controller: controller,
                      onChanged: (val) {
                        search(val);
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          )),
                    ),
                    height: 50,
                    width: 360,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        color: Color.fromARGB(255, 220, 219, 215),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 55, top: 15),
                  child: ListView.builder(
                      itemBuilder: ((context, index) {
                        //      print("jjj${data[index]}");
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (ctx) {
                                  return details(
                                    data: controller.text.isNotEmpty
                                        ? data[index]
                                        : snapshot.data?.drinks?[index] ?? "",
                                  );
                                }));
                              },
                              child: Text(controller.text.isNotEmpty
                                  ? data[index]
                                  : snapshot.data?.drinks?[index].idDrink ??
                                      ""),
                            ),
                            SizedBox(height: 15)
                          ],
                        );
                      }),
                      itemCount: controller.text.isNotEmpty
                          ? data.length
                          : snapshot.data?.drinks?.length),
                ),
              )
            ],
          );
        },
      ),
      appBar: AppBar(
        title: Text(
          'INTERVIEW ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
    );
  }
}
