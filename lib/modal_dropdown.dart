import 'package:flutter/material.dart';

class ModalDropDown extends StatelessWidget {
  String label;
  String value;
  List<String> items;
  Function(String value) onSelected;

  ModalDropDown(
      {required this.label,
      required this.value,
      required this.items,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => showModal(context),
            child: Container(
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: Column(children: [
                Container(
                    width: double.infinity,
                    child: Text(label,
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.start)),
               
                   Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child:value.isEmpty?Text('Select'):Text('${value}'),
                      ),
                      Icon(Icons.keyboard_arrow_down_sharp)
                    ],
                  ),
                
              ]),
            ),
          ),
        ],
      ),
    );
  }

  void showModal(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(8),
            height: 200,
            alignment: Alignment.center,
            child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (context, int) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Text(items[index]),
                      onTap: () {
                        onSelected(items[index]);
                        Navigator.of(context).pop();
                      });
                }),
          );
        });
  }
}
