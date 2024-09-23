import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/routes/routes_name.dart';
import 'package:klambi_ta/Pages/payment/components/test2.dart';
import '../components/CartOrderResponseModel.dart';
import '../components/test3.dart';
import '../controller/payment_controller.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.find<PaymentController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.orderData.value == null) {
          return Center(child: Text('No data available'));
        } else {
          final order = controller.orderData.value!;

          return ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              Text('Order ID: ${order.id}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('User ID: ${order.userId}', style: TextStyle(fontSize: 16)),
              Text('Address ID: ${order.addressId}', style: TextStyle(fontSize: 16)),
              Text('Payment Method: ${order.paymentMethod}', style: TextStyle(fontSize: 16)),
              Text('Shipping Method: ${order.shippingMethod}', style: TextStyle(fontSize: 16)),
              Text('Handling Fee: ${order.handlingFee}', style: TextStyle(fontSize: 16)),
              Text('Shipping Fee: ${order.shippingFee}', style: TextStyle(fontSize: 16)),
              Text('Discount: ${order.discount}', style: TextStyle(fontSize: 16)),
              Text('Total Price: ${order.totalPrice}', style: TextStyle(fontSize: 16)),
              Text('Quantity: ${order.quantity}', style: TextStyle(fontSize: 16)),
              Text('Status: ${order.status}', style: TextStyle(fontSize: 16)),
              Text('Payment Confirmed At: ${order.paymentConfirmedAt}', style: TextStyle(fontSize: 16)),
              Text('Estimated Delivery: ${order.estimatedDelivery}', style: TextStyle(fontSize: 16)),
              Text('Payment Due Time: ${order.paymentDueTime}', style: TextStyle(fontSize: 16)),
              Text('Created At: ${order.createdAt}', style: TextStyle(fontSize: 16)),
              Text('Updated At: ${order.updatedAt}', style: TextStyle(fontSize: 16)),
              Test2(),
              Test3(),
              SizedBox(height: 20),
              Text('Products:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...?order.products?.map((product) => ListTile(
                leading: product.image != null
                    ? Image.network(product.image!)
                    : Icon(Icons.image_not_supported),
                title: Text(product.title ?? 'No Title'),
                subtitle: Text('Price: ${product.price}\nQuantity: ${product.quantity}\nSize: ${product.size}'),
              )),

              ElevatedButton(onPressed: (){
                controller.addHistory();
                Get.off(RouteName.design);
              }, child: Text("lanjutkan"))
            ],
          );
        }
      }),
    );
  }
}
