import 'package:flutter/material.dart';
import 'package:interns1/screen/provider.dart';
import 'package:provider/provider.dart';
import '../modelservice/modelservice.dart';

class FetchApiScreen1 extends StatefulWidget {
  const FetchApiScreen1({super.key});

  @override
  State<FetchApiScreen1> createState() => _FetchApiScreen1State();
}

class _FetchApiScreen1State extends State<FetchApiScreen1> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<providercall>(context, listen: false).futureData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final change = Provider.of<providercall>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Data'),
        actions: [
          TextButton(
              onPressed: () {
                change.colorchange();
              },
              child: Text('Theme button',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white))),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://t3.ftcdn.net/jpg/03/55/60/70/360_F_355607062_zYMS8jaz4SfoykpWz5oViRVKL32IabTP.jpg'),
                fit: BoxFit.cover)),
        child: Consumer<providercall>(
          builder: (context, value, child) {
            final data = value.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                JsonApi datas = data[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        datas.title,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      subtitle: Text(
                        datas.des,
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(218, 134, 109, 71)),
                      ),
                      trailing: CircleAvatar(child: Text('${datas.id}')),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
