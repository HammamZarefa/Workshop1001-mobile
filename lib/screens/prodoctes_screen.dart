import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/preoducts_controller.dart';
import 'package:coda_workshop/screens/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 239, 239),
      appBar: AppBar(title: Text("Products",),centerTitle: true,
      
      backgroundColor: const Color.fromARGB(255, 241, 239, 239),
      ),
      
      body:
      
       GetBuilder<ProductController>(
        init: ProductController(), // تشغيل الكونترولر
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: 
            
            
            GridView.builder(
              itemCount: controller.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 280,
              ),
              itemBuilder: (context, index) {
                final item = controller.products[index];

                return 
                
                
                
                
                GestureDetector(
                  onTap: () => Get.to(() => ProductDetails(product: item)),
                  child: Card(
 color: Colors.transparent,
  elevation: 0,
  shadowColor: Colors.transparent,
  





                 //  color: Colors.green,
                    //elevation: 30,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                    child: ListView(
                      children: [




                        
                        ClipRRect(
                          
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30),top: Radius.circular(30)),
                          child:
                        Container(
                         // padding: EdgeInsets.all(3),
                          height: 180,
//color: Colors.orange,


                          child: 


                           Image.asset(
                            item.image,
                            height: 130,
                            width: double.infinity,
                            fit: BoxFit.fill,
                            //color: Colors.grey,
                          ),
                        ),),
                        SizedBox(height: 8),
                        Text(
                          item.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),

                        Row(children: [
                        Text(
                          "${item.price} \$",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      
SizedBox(width: 70,),

IconButton(onPressed:() {

  controller.changeFavorite(index);
}, 


icon:Icon(  item.favorite== false ? Icons.favorite_border


 : Icons.favorite

)
   
),

//  ? button_title.value = "Next"


//         : button_title.value = "Containue"; )



                       ]),
                       
                      ]
                        ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}