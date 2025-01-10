

class UserModel{
   String? email;
   String? uId;
   String? name;
   String? phone;


   UserModel({
     this.name,
     this.phone,
     this.uId,
     this.email,



});

   UserModel.fromjson(Map<String,dynamic>json){
     name=json['name'];
     phone=json['phone'];
     email=json['email'];
     uId=json['uId'];





   }
   Map<String,dynamic> Tomap(){
     return{
       'name':name,
       'phone':phone,
       'email':email,
       'uId':uId,





     };
   }


}