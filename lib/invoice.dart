import 'package:flutter/material.dart';
import 'package:invoice/modal.dart';

class invoice extends StatefulWidget {
  const invoice({Key? key}) : super(key: key);

  @override
  State<invoice> createState() => _invoiceState();
}

class _invoiceState extends State<invoice> {
  List? p1;

  @override
  Widget build(BuildContext context) {
    List<modelpage> p1 =
        ModalRoute.of(context)?.settings.arguments as List<modelpage>;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("SHOP RECEIPT",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Text("Supermarket"),
            Text("katargam"),
            SizedBox(height: 10,),
            Text("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
            // SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Your Item",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text("Price", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Text("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: p1.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(
                        "${p1[index].name}...................................",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "${p1[index].price}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(child: SizedBox(height: 20,)),
            Text("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total.........................................",style: TextStyle(fontSize: 20,),),
                  Expanded(child: SizedBox()),
                  Text("120",style: TextStyle(fontSize: 20,),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
