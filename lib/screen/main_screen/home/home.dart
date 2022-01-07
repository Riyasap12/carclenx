import 'package:carclenx/constant/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> cardImage = [
    ImageAssets.card1,
    ImageAssets.card2,
    ImageAssets.card3,
    ImageAssets.card4,
    ImageAssets.card5,
    ImageAssets.card6,
    ImageAssets.card1,
    ImageAssets.card2,
    ImageAssets.card3,
    ImageAssets.card4,
    ImageAssets.card5,
    ImageAssets.card6,
  ];
  @override
  Widget build(BuildContext context) {
    final width =  MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: Image.asset(
                    ImageAssets.banner,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16, right: 16),
                            child: Text(
                              "Car Shoppe",
                              style: Theme.of(context).textTheme.headline4?.copyWith(
                                color:
                                Colors.white,fontSize: 30,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Spacer(),
                          Image.asset(IconAssets.profile,height: 30,width: 30,color: Colors.white,),
                          Image.asset(IconAssets.history,height: 30,width: 30,color: Colors.white,),
                          SizedBox(width: 16,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {

                          },
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 24
                          ),
                          cursorColor: Colors.red,
                          decoration: InputDecoration(prefixIcon: Icon(Icons.notifications,color: Colors.white,),
                            suffixIcon: Icon(Icons.search,color: Colors.white,),
                            counterText: "",
                            contentPadding: EdgeInsets.fromLTRB(
                              16,
                              20,
                              12,
                              12,
                            ),
                            fillColor:  Colors.transparent,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: "Search",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                color: Colors.grey,
                                letterSpacing: .2),
                          ),
                          onChanged: (value) {
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 268,
                    child: Container(
                  color: Colors.black.withOpacity(0.3),
                  height: 78,
                      width: width,
                      child: Row(
                        children: [
                          SizedBox(width: 16,),
                        Text("Enter car details",style: TextStyle(color: Colors.white,fontSize: 20),)
                      ],),
                )),
                Positioned(
                  top:326,
                  child: Container(height: 24,
                    width:width,
                    decoration: BoxDecoration(
                        color:  Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24))
                    ),),
                ),
              ],
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                  color:  Colors.white,
              ),
            padding: EdgeInsets.only(left: 16,right: 16,bottom: 16),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    width: width,
                    decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(16)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        item(width,IconAssets.history,"Hitory"),
                        item(width,IconAssets.profile,"Car spa"),
                        item(width,IconAssets.home,"wash"),
                        item(width,IconAssets.share,"setup"),

                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shoppe",style: Theme.of(context).textTheme.subtitle1,),
                      Row(
                        children: [
                          Text("More",style: Theme.of(context).textTheme.subtitle1,),
                          SizedBox(width: 6,),
                          Icon(Icons.arrow_forward_ios_sharp,size: 18,)
                        ],
                      ),

                    ],
                  ),
                  GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    itemCount: cardImage.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemBuilder: (BuildContext context, int index) {
                      return card(width, cardImage[index], "title", "rate", "category");
                  }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 16,mainAxisSpacing: 16),)

                ],
              ),
            ),

          ],
        ),
      ),
    );

  }
  Widget item(width,image,title){
    return Container(
  padding: EdgeInsets.all(12),
  width: 80,
  decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16)
  ),
      child: Column(
        children: [
          Image.asset(image),
          Text(title,style: Theme.of(context).textTheme.subtitle1,maxLines: 1,),
        ],
      ),
  );
}

  Widget card(width,image,title,rate,category){
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(16),
      child: Image.asset(image,fit: BoxFit.cover,),)
      // Column(crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Center(child: Image.asset(image,height: 60,)),
      //     Text(title,style: Theme.of(context).textTheme.subtitle1,maxLines: 1,),
      //     Text("rs ${rate}",style: Theme.of(context).textTheme.bodyText2,maxLines: 1,),
      //   ],
      // ),
    );
  }

}
