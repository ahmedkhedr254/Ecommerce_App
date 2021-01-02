import 'package:date_format/date_format.dart';
import 'package:ecommerce/UI/pages/ViewAllProduct.dart';
import 'package:ecommerce/UI/pages/ViewLaptop.dart';
import 'package:ecommerce/UI/pages/homePage.dart';
import 'package:ecommerce/UI/pages/Login.dart';
import 'package:ecommerce/bloc/auth/login/login_bloc.dart';
import 'package:ecommerce/bloc/auth/logout/logout_bloc.dart';
import 'package:ecommerce/bloc/auth/register/register_bloc.dart';
import 'package:ecommerce/bloc/mobile/mobile_event.dart';
import 'package:ecommerce/bloc/tablet/tablet_event.dart';
import 'package:ecommerce/data/repository/MobileRepository.dart';
import 'package:ecommerce/data/repository/TabletRerpository.dart';
import 'package:ecommerce/data/repository/TabletSaleRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'UI/pages/ViewTablet.dart';
import 'UI/pages/WebViewPage.dart';
import 'UI/pages/register.dart';
import 'UI/pages/test.dart';
import 'UI/pages/viewMobile.dart';
import 'bloc/auth/checkAuth/check_auth_bloc.dart';
import 'bloc/laptop/laptop_bloc.dart';
import 'bloc/mobile/mobile_bloc.dart';
import 'bloc/tablet/tablet_bloc.dart';
import 'bloc/userLaptopSales/user_laptop_sales_bloc.dart';
import 'bloc/userMobileSales/user_mobile_sales_bloc.dart';
import 'bloc/userTabletSales/user_tablet_sales_bloc.dart';
import 'data/repository/Auth.dart';
import 'data/repository/LaptopRepository.dart';
import 'data/repository/LaptopSaleRepository.dart';
import 'data/repository/MabileSaleRepository.dart';

void main() async{

runApp(app());


}
class app extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => LogoutBloc(Auth()),),
        BlocProvider(create:(context) => LoginBloc(Auth()),),
        BlocProvider(create:(context) => RegisterBloc(Auth()),),
        BlocProvider(create:(context) => CheckAuthBloc()..add(StrartApp()),),
        BlocProvider(create:(context) => UserLaptopSalesBloc(LaptopSaleRepositoryImpl())),
        BlocProvider(create:(context) => UserMobileSalesBloc(MobileSaleRepositoryImpl())),
        BlocProvider(create:(context) => UserTabletSalesBloc(TabletSaleRepositoryImpl())),
        BlocProvider(create:(context) => LaptopBloc(LaptopRerpositoryImpl()),),
        BlocProvider(create:(context) => MobileBloc(MobileRerpositoryImpl()),),
        BlocProvider(create:(context) => TabletBloc(TabletrpositoryImpl()),),

      ],
      child:MaterialApp(
        routes: {
          "home":(context){

            return homePage();
          },
          "login":(context){
            return Login();
          },
          "allmobiles":(context){
            return ViewAllProduct('mob');
          },
          "alltablets":(context){
            return ViewAllProduct('tab');
          },
          "alllaptops":(context){
            return ViewAllProduct('lap');
          },
          "register":(context){
            return Register();
          },


        },
        home:BlocBuilder<CheckAuthBloc,CheckAuthState>(
          builder: (context, state) {
            if (state is Authenticated){
              BlocProvider.of<LaptopBloc>(context).add(GetLastLaptops());
              BlocProvider.of<MobileBloc>(context).add(GetLastMobiles());
              BlocProvider.of<TabletBloc>(context).add(GetLastTablets());
              return homePage();
            }
            else{
              return Login();
            }
          }
          ) ,
      ),
    );

  }


}

