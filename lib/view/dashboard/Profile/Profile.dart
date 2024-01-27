import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tech_media/res/color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ref = FirebaseDatabase.instance.ref('User');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:StreamBuilder(
            builder: (context,sanpshot){
              if(!sanpshot .hasData){
                
              }else{
                
              }
             return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.secondaryColor,
                        width: 05,

                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(

                            'https://media.licdn.com/dms/image/C5603AQGlrieFsdP0Uw/profile-displayphoto-shrink_800_800/0/1659569343161?e=1711584000&v=beta&t=VzChufp-9YOU7HXZvEo_jDxhq1HCFq-eyo9CD5lW5MM'),
                        loadingBuilder: (context, child, loadingProgress) {
                          if(loadingProgress == null)return child;
                          return Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, object, stack) {
                          return Container(
                            child: Icon(Icons.error_outline, color: Colors.amber),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }, stream: null,
          ),


          ),
        ),
    );

  }
}
