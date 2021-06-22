import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class PaymentWindow extends StatefulWidget {
  @override
  _PaymentWindowState createState() => _PaymentWindowState();
}

class _PaymentWindowState extends State<PaymentWindow> {

  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() async{
    var options = {
      "key" : "rzp_test_ILi5yR6lm2tpe2",
      "amount" : num.parse(textEditingController.text)*100,
      "name" : "Sample App",
      "description" : "Payment for the some random product",
      "prefill" : {
        "contact" : "6969696969",
        "email" : "xyz@abc.com"
      },
      "external" : {
        "wallets" : ["paytm"]
      }
    };

    try{
     await razorpay.open(options);
    }catch(e){
      print(e.toString());

    }

  }

  void handlerPaymentSuccess(){
    print("Pament success");
    Toast.show("Pament success", context, duration: 100, gravity: Toast.BOTTOM);

  }

  void handlerErrorFailure(){
    print("Pament error");
    Toast.show("Pament error", context);
  }

  void handlerExternalWallet(){
    print("External Wallet");
    Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Razorpay Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "Enter Amount"
              ),
            ),
            SizedBox(height: 12,),
            RaisedButton(
              color: Colors.amber,
              child: Text("Pay Now", style: TextStyle(
                color: Colors.white
              ),),
              onPressed: (){
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}
