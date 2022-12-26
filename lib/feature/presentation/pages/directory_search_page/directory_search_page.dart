
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sniper/feature/presentation/widgets/button_widget.dart';
import 'package:sniper/feature/presentation/widgets/custom_box.dart';
import 'package:sniper/feature/presentation/widgets/getre.dart';
import 'package:sniper/feature/presentation/widgets/text_field_widget.dart';
import '../../../datamodel/model.dart';
import '../../widgets/text_widget.dart';
import 'package:http/http.dart' as http;
import 'package:regexed_validator/regexed_validator.dart';

class DirectorySearchPage extends StatefulWidget {
  const DirectorySearchPage({Key? key}) : super(key: key);

  @override
  State<DirectorySearchPage> createState() => _DirectorySearchPageState();
}

class _DirectorySearchPageState extends State<DirectorySearchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  TextEditingController data = TextEditingController();

  bool? isCheeked = false;
  bool? isCheekedp = false;
  bool? isloaded = false;
  late DataModel dataModel;
  List<DataModel> getData =[];
  List out =[];



  fetchAlbum(String url)async {
    var x = {
      "url": url.toString(),
      "type":"d"
    };
    var response = await http.post(Uri.parse("http://192.168.0.102:2000"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(x),

    );
    var jsonBody = json.decode(response.body);
    getData.clear();
    for (var data in jsonBody) {
      setState(() {
        getData.add(DataModel(statusCode: data["a"], path: data["b"]));
      });
    }
    isloaded = true;
  }



  void _fetchData(BuildContext context) async {
    // show the loading dialog
    showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  // The loading indicator
                  SizedBox(height: 300,width: MediaQuery.of(context).size.width,
                    child:  Lottie.asset('assets/lottie/lodercat.json'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Loading...')
                ],
              ),
            ),
          );
        });

    // Your asynchronous computation here (fetching data from an API, processing files, inserting something to the database, etc)
    await Future.delayed(const Duration(seconds: 6));
    // Close the dialog programmatically
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
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
                    }, icon:const Icon( Icons.arrow_back_ios,color: Colors.white,size: 35,)) ,

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
                          child:const TextLtdWidget(title: "Directory Search",color: Colors.black,weight: FontWeight.w600,size: 18,),
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
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Checkbox(value: isCheeked,
              //           activeColor: Colors.green,
              //           checkColor: Colors.white,
              //           tristate: false,
              //           onChanged: (newBool){
              //         setState(() {
              //           isCheeked = newBool;
              //         });
              //           }
              //       ),
              //       const TextLtdWidget(title: "Get Request\nonly",line: 2,weight: FontWeight.w700,),
              //       const Expanded(child: SizedBox(width: 1,)),
              //       Checkbox(value: isCheekedp,
              //           activeColor: Colors.green,
              //           checkColor: Colors.white,
              //           tristate: false,
              //           onChanged: (newBool){
              //             setState(() {
              //               isCheekedp = newBool;
              //             });
              //           }
              //       ),
              //       const TextLtdWidget(title: "Auto Switch(GET/\nPOST)",line: 2,weight: FontWeight.w700,),
              //     ],
              //   ),
              // ),

              const SizedBox(height: 20,),
              ButtonLTDWidget(widget: const TextLtdWidget(title: "Start",
                weight: FontWeight.w500,size: 17.0,color: Colors.white,
              ),bgColor: Colors.deepPurple,
                onTap: ()async{
                  isloaded = false;
                  if(validator.url(data.text)){
                    _fetchData(context);
                    getData.clear();
                    fetchAlbum(data.text);
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pleaser Enter valid Url')),
                    );
                  }

                },
              ),

              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(10),
                child:  Container(
                  height: h*0.6,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5.00),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children:  [
                      const TextLtdWidget(title: "Testing Result",size: 19.00,weight: FontWeight.w600,),

                      Expanded(
                        child:getData.isNotEmpty? ListView.builder(
                            itemCount: getData.length,
                            itemBuilder: (context,index){
                              return  TextLtdWidget(title: "${getData[index].statusCode}    ----   ${getData[index].path}",size: 14.00,weight: FontWeight.w600,);
                            }): loder(),
                      )
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
