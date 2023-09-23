import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GbSafFloor extends StatefulWidget {
  @override
  _GbSafFloorState createState() => _GbSafFloorState();
}

class _GbSafFloorState extends State<GbSafFloor > {
  List<Floor> floors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.add_to_photos, color: Colors.indigo),
                      Text(
                        '  Floor Details ',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AddFloorDialog(
                        onAddFloor: (floor) {
                          setState(() {
                            floors.add(floor);
                          });
                        },
                      ),
                    );
                  },
                  child: Text("Add Floor"),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: floors.length,
                itemBuilder: (context, index) {
                  return FloorWidget(
                    floor: floors[index],
                    onDelete: () {
                      setState(() {
                        floors.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddFloorDialog extends StatefulWidget {
  final Function(Floor) onAddFloor;

  AddFloorDialog({required this.onAddFloor});

  @override
  _AddFloorDialogState createState() => _AddFloorDialogState();
}

class _AddFloorDialogState extends State<AddFloorDialog> {
  TextEditingController floorNoController = TextEditingController();
  TextEditingController uptoDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //FLOOR NO
            Container(

              padding: EdgeInsets.all(15),
              child: Column(
                children: [

                  Row(
                    children: [
                      Text(
                        "Floor No",
                        style: TextStyle(color: Colors.black87),
                      ),
                      Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  TextField(),
                ],
              ),
            ),
            //USAGE TYPE
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Usage Type",
                        style: TextStyle(color: Colors.black87),
                      ),
                      Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  TextField(),
                ],
              ),
            ),
            //OCCUPANCY TYPE
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Occupancy Type",
                        style: TextStyle(color: Colors.black87),
                      ),
                      Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  TextField(),
                ],
              ),
            ),
            // CONSTRUCTION TYPE
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Construction Type",
                        style: TextStyle(color: Colors.black87),
                      ),
                      Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  TextField(),
                ],
              ),
            ),
            //BUILT UP AREA
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Built Up Area",
                        style: TextStyle(color: Colors.black87),
                      ),
                      Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  TextField(),
                ],
              ),
            ),
            //FROM DATE
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "From Date",
                        style: TextStyle(color: Colors.black87),
                      ),
                      Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  TextField(),
                ],
              ),
            ),
            //UPTO DATE
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Upto Date",
                        style: TextStyle(color: Colors.black87),
                      ),
                      Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  TextField(),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String floorNo = floorNoController.text;
                    String uptoDate = uptoDateController.text;

                    if (floorNo.isNotEmpty && uptoDate.isNotEmpty) {
                      widget.onAddFloor(Floor(floorNo, uptoDate));
                      Navigator.pop(context); // Close the dialog
                    }
                  },
                  child: Text("Add"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text("Cancel"),

                ),
              ],
            ),
          ],
        ),
      ),
    );}
}

class Floor {
  final String floorNo;
  final String uptoDate;

  Floor(this.floorNo, this.uptoDate);
}

class FloorWidget extends StatelessWidget {
  final Floor floor;
  final VoidCallback onDelete;

  FloorWidget({required this.floor, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Floor No: ${floor.floorNo}",
                style: TextStyle(color: Colors.black87),
              ),
              TextButton(
                onPressed: onDelete,
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text("Upto Date: ${floor.uptoDate}"),
        ],
      ),
    );
  }
}

