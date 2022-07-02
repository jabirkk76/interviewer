import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class details extends StatelessWidget {
  var data;
  details({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'DETAILS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Card(
                elevation: 23,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          data.idDrink,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data.strDrink,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          data.strCategory,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          data.strAlcoholic,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          data.strGlass,
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Color.fromARGB(255, 197, 141, 227),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    height: 160,
                    width: 360,
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
