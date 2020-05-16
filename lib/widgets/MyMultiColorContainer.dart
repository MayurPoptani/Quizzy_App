import 'package:flutter/material.dart';

class MultiColorContainer extends StatelessWidget {
  
  const MultiColorContainer({Key key,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    //deviceSize = Size(deviceSize.width, deviceSize.height*0.85);
    return Container(
      child: Stack(
        children: [
          Container(color: Colors.blue.shade900),
          Positioned(
            top: -(deviceSize.height*0.60), right: -(deviceSize.width*0.75), 
            child: Container(
              height: deviceSize.height*1.5,
              width: deviceSize.height*1.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                boxShadow: [
                  BoxShadow(offset: Offset(0, 5), color: Colors.black26, blurRadius: 10, spreadRadius: 0),
                ],
              ),
            )
          ),
          Positioned(
            top: -(deviceSize.height*0.60), right: -(deviceSize.width*0.50), 
            child: Container(
              height: deviceSize.height*1.25,
              width: deviceSize.height*1.25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
                boxShadow: [
                  BoxShadow(offset: Offset(0, 5), color: Colors.black26, blurRadius: 10, spreadRadius: 0),
                ],
              ),
            )
          ),
          Positioned(
            top: -(deviceSize.height*0.60), right: -(deviceSize.width*0.25), 
            child: Container(
              height: deviceSize.height*1.0,
              width: deviceSize.height*1.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
                boxShadow: [
                  BoxShadow(offset: Offset(0, 5), color: Colors.black26, blurRadius: 10, spreadRadius: 0),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}