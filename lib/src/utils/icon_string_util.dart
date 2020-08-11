import 'package:app_invernadero_trabajador/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';

final double icon_height =12;
final Color icon_color = Colors.white;


final _icons = <String,IconData>{
  'sun_o'             : LineIcons.sun_o,
  'bug'               : LineIcons.bug,
  'money'             : LineIcons.money,
  'question_circle'   : LineIcons.question_circle,
  'sign_in'           : LineIcons.sign_in,
  'key'               : LineIcons.key
};

final _icons_svg = <String,String>{ 
  'insumo.svg'        :   'assets/icons/insumo.svg',
  'tools_icon.svg'    :   'assets/icons/tools_icon.svg',
  'task_icon.svg'     :   'assets/icons/task_icon.svg',
  'order_icon.svg'    :   'assets/icons/order_icon.svg',
  'sale_icon.svg'     :   'assets/icons/sale_icon.svg',
};


dynamic getIcon(String iconName,Responsive _responsive){
  
  if(_icons.containsKey(iconName))
    return Icon(_icons[iconName],color: Colors.white,size:_responsive.ip(2.5) ,);
  else
    return SvgPicture.asset(_icons_svg[iconName],color: icon_color,height: _responsive.ip(2.5),);
}