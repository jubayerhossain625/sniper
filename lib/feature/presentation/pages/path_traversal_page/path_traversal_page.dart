

import 'package:flutter/material.dart';
import 'package:sniper/feature/presentation/widgets/button_widget.dart';
import 'package:sniper/feature/presentation/widgets/custom_box.dart';
import 'package:sniper/feature/presentation/widgets/text_field_widget.dart';

import '../../widgets/text_widget.dart';

class PathTraversalPage extends StatefulWidget {
  const PathTraversalPage({Key? key}) : super(key: key);

  @override
  State<PathTraversalPage> createState() => _PathTraversalPageState();
}

class _PathTraversalPageState extends State<PathTraversalPage> {

  TextEditingController data = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBox(
        widget: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon:Icon( Icons.arrow_back_ios,color: Colors.white,size: 35,)) ,

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white
                          ),
                          child:const TextLtdWidget(title: "Path Traversal",color: Colors.black,weight: FontWeight.w600,size: 18,),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,)
                  ],
                ),
              ),
              const  SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  height: 50,
                  child: TextFieldLTDWidget(controller: data, inputType:TextInputType.text,hint: "Target URL",),
                ),
              ),
              const  SizedBox(height: 20,),

              const SizedBox(height: 20,),
              ButtonLTDWidget(widget: const TextLtdWidget(title: "BROWSE",
                weight: FontWeight.w500,size: 17.0,color: Colors.white,
              ),bgColor: Colors.deepPurple,
                onTap: (){},
              ),

              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(10),
                child:  Container(
                  height: 400,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5.00),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: const [
                      TextLtdWidget(title: "Testing Result",size: 19.00,weight: FontWeight.w600,),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
