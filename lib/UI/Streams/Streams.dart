import 'package:ecommerce/UI/utilities/AllProductPageUtilities.dart';
import 'package:ecommerce/UI/utilities/homePageUtilities.dart';
import 'package:ecommerce/bloc/laptop/laptop_bloc.dart';
import 'package:ecommerce/bloc/mobile/mobile_bloc.dart';
import 'package:ecommerce/bloc/mobile/mobile_state.dart';
import 'package:ecommerce/bloc/tablet/tablet_bloc.dart';
import 'package:ecommerce/bloc/tablet/tablet_state.dart';
import 'package:ecommerce/data/model/Tablet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget LaptopStream(){
  return  BlocBuilder<LaptopBloc,LaptopState>(builder:(context,state){
    if (state is LastLaptopLoading){
      return CircularProgressIndicator();
    }
    else if (state is LastLaptopLoaded){
      return  LaptopSlider(state.laptops,context);
    }
    else if (state is LastLaptopError ){
      return Text("cant load???");
    }
    else{
      return CircularProgressIndicator();
    }

  },
    buildWhen: (last,current){
      if(current is GetLastLaptopsState){return true;}
      else{return false;}
    },

  );
}
Widget MobileStream(){
  return  BlocBuilder<MobileBloc,MobileState>(builder:(context,state){
    if (state is LastMobileLoading){
      return CircularProgressIndicator();
    }
    else if (state is LastMobileLoaded){
      return  MobileSlider(state.Mobiles,context);
    }
    else if (state is LastMobileError ){
      return Text("cant load???");
    }
    else{
      return CircularProgressIndicator();
    }

  },
    buildWhen: (last,current){
      if(current is GetLastMobilesState){return true;}
      else{return false;}
    },

  );
}

Widget TabletStream(){
  return  BlocBuilder<TabletBloc,TabletState>(builder:(context,state){
    if (state is LastTabletLoading){
      return CircularProgressIndicator();
    }
    else if (state is LastTabletLoaded){
      return  TabletSlider(state.Tablets,context);
    }
    else if (state is LastTabletError ){
      return Text("cant load???");
    }
    else{
      return CircularProgressIndicator();
    }

  },
    buildWhen: (last,current){
      if(current is GetLastTabletsState){return true;}
      else{return false;}
    },

  );
}


//add these streams in procduct page

Widget AllMobileStream(){
  return BlocBuilder<MobileBloc,MobileState>(
    builder: (context,state){
        if (state is MobileLoading){
          return CircularProgressIndicator();
        }
        else if (state is MobileLoaded){
          return AllProductGrid(state.Mobiles,context);
        }
        else if (state is MobileError){
          return Text("cant load products");
        }
        else{
          return CircularProgressIndicator();
        }
    },
    buildWhen: (current,before){
        if (current is GetAllMobilesState){return true;}
        else{return false;}
    },
  );
}


Widget AllTabletStream(){
  return BlocBuilder<TabletBloc,TabletState>(
    builder: (context,state){
      if (state is TabletLoading){
        return CircularProgressIndicator();
      }
      else if (state is TabletLoaded){
        return AllProductGrid(state.Tablets,context);
      }
      else if (state is TabletError){
        return Text("cant load products");
      }
      else{
        return CircularProgressIndicator();
      }
    },
    buildWhen: (current,before){
      if (current is GetAllTabletsState){return true;}
      else{return false;}
    },
  );
}

Widget AllLaptopStream(){
  return BlocBuilder<LaptopBloc,LaptopState>(
    builder: (context,state){
      if (state is LaptopLoading){
        return CircularProgressIndicator();
      }
      else if (state is LaptopLoaded){
        return AllProductGrid(state.laptops,context);
      }
      else if (state is LaptopError){
        return Text("cant load products");
      }
      else{
        return CircularProgressIndicator();
      }
    },
    buildWhen: (current,before){
      if (current is GetAllLaptopsState){return true;}
      else{return false;}
    },
  );
}