import 'package:flutter/material.dart';
import 'package:invoice/modal.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  List<modelpage> Product = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("INVOICE"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: Product.length,
                itemBuilder: (context, index) {
                  return raj(index, Product[index].name!, Product[index].price!);
                },
              ),
            ),
            ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, 'invoice',arguments: Product);
            }, child: Text("creat",))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: name,
                        decoration: InputDecoration(hintText: "enter item"),
                      ),
                      TextField(
                        controller: price,
                        decoration: InputDecoration(hintText: "enter price"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          modelpage m1 =
                          modelpage(name: name.text, price: price.text);
                          setState(() {
                            Product.add(m1);
                          });
                          Navigator.pop(context);
                        },
                        child: Text("Add"),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget raj(int indx, String name, String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.all(Radius.circular(15))),
        child: ListTile(
          leading: Text("${indx + 1}"),
          title: Text("$name"),
          subtitle: Text("$price"),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                Product.removeAt(indx);
              });
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
