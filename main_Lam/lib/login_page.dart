import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();  // _formKey Để lưu trữ trạng thái của TextFormField
  var _userNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // Xử lý khi có tai thỏ
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value){ // Dùng để xác thực, kiểm tra dữ liệu
                  if(value==null || value.isEmpty)
                    return "Tên đăng nhập rỗng!";
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nhập tên đăng nhập.",
                  label: Text("Tên đăng nhập"),
                  prefixIcon: Icon(Icons.person),
                ),
                controller: _userNameController,
              ),
              TextFormField(
                validator: (value){ // Dùng để xác thực, kiểm tra dữ liệu
                  if(value==null || value.isEmpty)
                    return "Nhập mật khẩu";
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Mật Khẩu",
                  label: Text("Nhập mật Khẩu"),
                  prefixIcon: Icon(Icons.person),
                ),
                controller: _userNameController,
              ),
              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate())  {
                    var snackBar = SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.person, color: Colors.white,),
                            Text("Xin chào: ${_userNameController.text}"),
                          ],
                        )
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text("Đăng nhập"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}