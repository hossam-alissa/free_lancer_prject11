import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
// class SettingScreen extends StatefulWidget {
//   const SettingScreen({Key? key}) : super(key: key);
//
//   @override
//   _SettingScreenState createState() => _SettingScreenState();
// }
//
// class _SettingScreenState extends State<SettingScreen> {
//
//   String imgUrl = "https://alfaruq.de/wp-content/uploads/2020/08/Gebet_4Webseite.jpg";
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xff19233E),
//         appBar: AppBar(
//           title: Text("Settings",style: TextStyle(color: Color(0xff39719F)),),
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: Color(0xff19233E),
//         ),
//         body: Container(
//           padding: const EdgeInsets.all(50.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Center(child: profileImage(imgURL: imgUrl ,radius: 55.0)),
//                   SizedBox(height: 25.0,),
//                   Text("OMAR NASSER",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
//                   Text("GOLDEN PLAN",style: TextStyle(color: Color(0xff39719F) ,fontSize: 14),),
//                   SizedBox(height: 50.0,),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text("Email : ",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
//                       Text("INFO@METAFORTECH.COM",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500)),
//                     ],
//                   ),
//                   SizedBox(height: 15.0,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text("PHONE : ",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
//                       Text("+962 780997333",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500)),
//                     ],
//                   ),
//                   SizedBox(height: 15.0,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text("COUNTRY : ",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
//                       Text("JORDAN",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500)),
//                     ],
//                   ),
//                   SizedBox(height: 15.0,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text("ACCOUNT TYPE : ",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
//                       Text("PERSONAL",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500)),
//                     ],
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Container(
//                     padding:EdgeInsets.symmetric(vertical: 0,horizontal: 10.0) ,
//                     height: 30.0,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.white,width: 1.0),
//                         borderRadius: BorderRadius.circular(120.0)
//                     ),
//                     child: MaterialButton(onPressed: (){},
//                       // padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10.0),
//                       child: Text(" Change Language",style: TextStyle(
//                           color: Colors.white
//                       ),),),
//                   ),
//                   SizedBox(height: 10.0,),
//                   Text("version 4.8.15.16.23.42",style: TextStyle(
//                       color: Color(0xff39719F)
//                   ))
//                 ],
//               )
//
//
//
//             ],
//           ),
//         ) ,
//
//       ),
//     );
//   }
//
//   Widget profileImage({required String imgURL, double radius = 30.0}){
//     return CachedNetworkImage(imageUrl: imgURL,
//       imageBuilder: (context,image){
//         return Stack(
//           alignment: Alignment.bottomRight,
//           children: [
//             CircleAvatar(
//               radius: radius,
//               backgroundImage: image,
//             ),
//             InkWell(
//               onTap: (){},
//               child: CircleAvatar(
//                 radius: 25.0,
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.edit,color: Colors.black,),
//               ),
//             )
//           ],);
//       },
//       placeholder: (context, url) => buildProfileShimmer(context),
//       errorWidget: (context, url, error) => Icon(Icons.error),
//     );
//   }
//
//
//
//
//
//   Widget buildProfileShimmer(BuildContext context) {
//     return
//       Container(
//         child: Shimmer.fromColors(
//             child: CircleAvatar(
//               radius: 30.0,
//               backgroundColor: Colors.grey[400],
//             ),
//
//             baseColor: Color(0xffCCCCCC),
//             highlightColor: Colors.white),
//       );
//   }
//
//
//
//
// }
