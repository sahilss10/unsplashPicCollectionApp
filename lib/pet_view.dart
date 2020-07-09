import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PetView extends StatefulWidget {
  @override
  _PetViewState createState() => _PetViewState();
}

class _PetViewState extends State<PetView> {
  List data = [];
  List<String> imgURL = [];
  List<String> imgDes = [];
  bool showImg = false;
  //creating fetch data function
  getData() async {
    http.Response response = await http.get(
        'https://api.unsplash.com/collections/139386/photos?client_id=r0qksAQ41R_iRU9pGhqtr6rbtvw58vRwuX6zCgQy56Y');
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      for (int i = 0; i < data.length; i++) {
        imgURL.add(data.elementAt(i)['urls']['small']);
        imgDes.add(data.elementAt(i)['description']);
        print(imgURL[i]);
        print(imgDes[i]);
      }
      setState(() {
        showImg = true;
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.white,
      ),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 200,
          width: 200,
          child: Column(
            children: <Widget>[
              Expanded(
                child: !showImg
                    ? CircularProgressIndicator
                    : Image(
                        image: NetworkImage(
                          imgURL.elementAt(index),
                        ),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${imgDes.elementAt(index)}',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'iOS',
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
