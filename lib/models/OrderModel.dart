class OrderModel{
  String? username;
  String? phone;
  String? email;

  String? name;
  String? price;
  String? area;
  String? location;
  String? type;
  String? date;



  OrderModel({

    this.phone,
    this.username,
    this.email,
    this.name,
    this.area,
    this.price,
    this.location,
    this.type,  this.date,




  });

  OrderModel.fromjson(Map<String,dynamic>json){
    phone=json['phone'];
    username=json['username'];
    email=json['email'];

    area=json['area'];
    price=json['price'];
    location=json['location'];
    type=json['type'];
    name=json['name'];
    date=json['date'];





  }
  Map<String,dynamic> Tomap(){
    return{

      'username':username,
      'email':email,
      'phone':phone,

      'name':name,
      'area':area,
      'price':price,
      'location':location,
      'type':type,
      'date':date,





    };
  }


}