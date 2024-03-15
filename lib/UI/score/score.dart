//  import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:miniproject/UI/controller/controller.dart';
//
// class Scoree extends StatelessWidget {
//   const Scoree({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final queController _qnController = Get.put(queController());
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//            Image.asset(
//             "assets/images/p.jpeg",
//             fit: BoxFit.fill,
//             height: double.infinity,
//             width: double.infinity,
//             alignment: Alignment.center,
//           ),
//           Column(
//             children: [
//               SizedBox(height: 100,),
//                Text(
//                 "Score",
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline3
//                     ?.copyWith(color: Colors.white),
//               ),
//                SizedBox(height: 30,),
//                Text(
//                 "${_qnController.correctanswer * 10}/${_qnController.questions.length * 10}",
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline3
//                     ?.copyWith(color: Colors.white),
//               ),
//              ],
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/UI/controller/controller.dart';

class Scoree extends StatelessWidget {
  const Scoree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final queController _qnController =  Get.put(queController());
    final TextStyle? _scoreTextStyle = Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/p.jpeg",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Column(
            children: [
              SizedBox(height: 100),
              Text(
                "Score",
                style: _scoreTextStyle,
              ),
              SizedBox(height: 30),
              Text(
                "${_qnController.correctanswer * 10}/${_qnController.questions.length * 10}",
                style: _scoreTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
