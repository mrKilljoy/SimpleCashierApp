   M S B A M L   `   `   `  ���� O  Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem  E ATradingDAL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI3clr-namespace:TradingDAL.Models;assembly=TradingDALTradingDAL.Models I ETradingControl, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:TradingControlTradingControl    TradingControl.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     X TXceed.Wpf.Toolkit, Version=3.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  i eXceed.Wpf.AvalonDock.Themes.VS2010, Version=3.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f4g	 cXceed.Wpf.AvalonDock.Themes.Aero, Version=3.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f4h
 dXceed.Wpf.AvalonDock.Themes.Metro, Version=3.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f4[ WXceed.Wpf.AvalonDock, Version=3.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f4<xca,http://schemas.xceed.com/wpf/xaml/avalondock  	 
  F BWpfControls, Version=1.0.0.7, Culture=neutral, PublicKeyToken=null!acthttp://wpfcontrols.com/  3System&clr-namespace:System;assembly=mscorlib  >dalm3clr-namespace:TradingDAL.Models;assembly=TradingDAL  c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  (localclr-namespace:TradingControl  -     �Name$  main_window�� � WindowStartupLocation$ CenterScreen=� � Title$ Trading Solutions Inc��$��701.5��$
��1030��$
��1024��$	��768�� � 	Resources    enumDataCategory S� 
MethodName S� 
ObjectType   System.Enum S� MethodParameters M� TypeName  enumDataSaleRange  item_descr_element �� 
TargetType	 �� Property
 �� Value  item_descr_disclaimer��%  &	        &	 B     &	 {     &	 �     S� $ 	GetValues��"   M� $ dalm:StoreItemCategories��S� $ 	GetValues��"   M� $ dalm:SalePeriod���� " ��.��� 	 � ��$
 16(��� " ��.��� 	 � ��$
 16(��� 	 � ��$

 Bold"�.��� -   $��	main_grid��$
��1000��$	��750��$��11,-4,11,-5q�.+�� -   $��grid_primary��$��-15,0q�{��� *
IsActive+ �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnSourceUpdated . ���� " �.��� 	 � ��
 �#71d67b �� Triggers P�  P� Property � {� P� Value .  . ��� 	 � y�$
 Hidden=�.+��� -    ��Name$ 
tabControl��$��10,38,10,70q�  �� 
TargetType �� CornerRadius ��Name �� Triggers �� 
TargetName��%�  '��       �� " ��.��� 	 � ��
 �� " ��.R��� $��Border��$��1,1,2,0q�
���   �$ 0,2,2,0��$	��5,0q�._��� $ ContentSite��$��Center=�$��Center=�$��Header��$��30,10q�$��30(� P�  �@��
IsSelected . . ��� $ Border��	 � ��

 ��·�P�  �@��
IsSelected .  . ��� $ Border��	 � ��

 ������� 	 � ��
 �� .R��� #��z��.@��� $��
Касса��.��� ���#f9f0ed � ColumnDefinitions �� $
��300* ��� $	��500 �.+�%  WpfControls.AutoCompleteTextBox  -   $��txt_cashier_input��$��1��$��	0,46,51,0q�$	��385��$��50��$	��Top=�   SelectedItem �� *StoreSelectedItem+$ PropertyChanged=� .  �� Mode$ TwoWay=����� "  .��� 	 � ��$
 22(��� 	 �@ 	Watermark$H
 BВведите код или наименование товара���� 	 �@ Provider
 �� *TextSuggestionProvider+�� 	 �@ Delay$	
 500���� 	 �@ DisplayMember$
 Title���� 	 � ��

 ������� 	 � ��$
 Center=��� 	 � ��$
 Stretch=��� 	 � ��$
 Right=�   ItemTemplate 5  -System.Windows.Controls.ItemContainerTemplate�  .R�� .+��� ����  �� Path$
 Code��� $��Verdana)����� $ Title��� $��1��$	��100��$��Stretch=�$��24,236,24,237q�
�������$��1q�$ 2��._�� $��1��$	��100��$��Stretch=� �� $
��257* ��� $
��170* �.+��� .+��� $+��%Общее число позиций:��$��20(��� $��24(����� $ PinnedItems.Count�$ PropertyChanged=� . �� $��1��.+��� $��Сумма чека:��$��20(�$��Right=��� $��28(�$��Right=����� *BillCheckout+$ PropertyChanged=� . $ TwoWay=��� -   $��btn_checkout��$��1��$��	64,0,0,45q�$
��Left=�$	��162��$��70��$��Bottom=����� *CheckoutCommand+���� " ��.��� 	 � ��$
 24(���� .+��� $��Расчет��$
��Left=�$��Center=�$��0,0,70,0q��� $��Center=�$��/Resources/ch_icon1.ico��$��Right=�$��	70,-5,0,5q���  �� ShowsPreview .  $��1��$��3��$��Stretch=�$��	0,0,495,0q�{�.  �� -    ��Name$ 
lbox_items��$��0��$
��Auto��$��26,24,28,139q�$��Stretch=� �� SelectedItem �� *ListSelectedItem+$ PropertyChanged=� . ���� *PinnedItems+$ TwoWay=�$ PropertyChanged=� .   �� 	Resources �� Color��%  '��       �� " ��.��� 	 � ��$

 10,2q��� 	 � ��$
 Verdana)��� 	 � ��$
 16(��� 	 � ��$
 Stretch=� ���� $ LightSkyBlue��(��       * SystemColors.HighlightBrushKey+)�� $
 Blue��(��       *SystemColors.ControlBrushKey+)���� .R��� $ 5��$��1q�$��Center=�$��30��$
��Auto��._�� $��5q�$
��Auto��$��Stretch=� �� �� �� .+��� $��0��$	��250��$��Center=�$��0,0,80,0q����� $ 
Item.Title��� $��1��$	��120��$��Center=�$
��30,0q����� $ 
ItemAmount�$ PropertyChanged=� . �� $��2��$
��Auto��$��Center=�$��60,0,0,0q�$��Right=����� $ 
TotalPrice�$ PropertyChanged=� .   J� InputBindings  �� 
! �� Key$! Delete��" �� Command" �� *RemoveItemCommand+# �� CommandParameter# �� $ SelectedItem�$ �� RelativeSource$ �� % �� AncestorType"% ���� $! OemPlus��" �� *IncrementItemAmountCommand+# �� $ SelectedItem�$ �� "% ���� $	! Add��" �� *IncrementItemAmountCommand+# �� $ SelectedItem�$ �� "% ���� $! OemMinus��" �� *DecrementItemAmountCommand+# �� $ SelectedItem�$ �� "% ���� $! Subtract��" �� *DecrementItemAmountCommand+# �� $ SelectedItem�$ �� "% ��%  Xceed.Wpf.Toolkit.BusyIndicator  -   $��spinner_checkout��$��0��&   BusyContent$&&  Сохранение чека...��$��26,24,28,139q�'   IsBusy' �� *IsCheckoutPassing+$ PropertyChanged=� . � -	   $��selected_item_description��$��0��$	��100��$��Bottom=�$��Stretch=�$��	26,0,28,0q�.+�� $��1��$��35��.+��� #��[ $��Наименование:���� #��[ ���� $! ListSelectedItem.Item.Title�� $��0�� �� $
��100* ��� $
��103* ��� $
��115* ��� $
��128* �.+�� $��0��$	��100��$
��Left=�$	��0,8q�.+��� #��[ $��Код:���� #��[ ���� $  ListSelectedItem.Item.Code�� $��1��$	��100��$
��Left=�$	��0,8q�.+��� #��[ $��	Цена:���� #��[ ���� $! ListSelectedItem.Item.Price�� $��2��$
��Left=�$	��0,8q�$	��115��.+��� #��[ $��Кол-во:���� #��[ ���� $! ListSelectedItem.ItemAmount�$ PropertyChanged=�� $��3��$	��118��$
��Left=�$	��0,8q�.+��� #��[ $��Сумма:���� #��[ ���� $! ListSelectedItem.TotalPrice�$ PropertyChanged=����� " � �� ( �� Binding( �� *ListSelectedItem+) �� Value) Z� .a��� 	 � {�
 .  P�  � {� .  . ��� 	 � y�$
 Hidden=�* � RowDefinitions* �� �� �� -
   + ��Name$+ btn_bill_clear��$��1��$��	0,0,37,45q�$��Right=�$	��191��$��70��$��Bottom=����� *DropCurrentListCommand+���� " ��.��� 	 � ��$
 20(���� .+��� $��Очистить��$
��Left=�$��Center=�$��0,0,70,0q��� $��/Resources/clr_icon5.ico��$��Right=�$��70,0,0,0q��� $��
Склад��.��� ���	#FFF8FFF1 �� $
��182* ��� $
��303* �.+��� $��1�� .  $��3��$
��Left=�$��Stretch=�$��
10,0,593,0q�{�.  �� -   $��lab_storage1��$#��Основные данные��$��24(�$��Segoe UI)�$��	30,22,0,0q�$��40��$	��238��$
��Left=�$	��Top=�(  "Xceed.Wpf.Toolkit.WatermarkTextBox  -   $��txt_item_code��,   	Watermark$, Код товара��$��20(�$��	35,72,0,0q�$��Center=�$��5,0,0,0q�$
��Left=�$	��193��$��39��$	��Top=����� *
ItemCode+$ PropertyChanged=� . �� -   $��lab_storage2��$ ��Дополнительно��$��24(�$��Segoe UI)�$��
30,203,0,0q�$��40��$	��238��$
��Left=�$	��Top=�  -   $��txt_item_name��$, Наименование��$��20(�$��
35,128,0,0q�$��Center=�$��5,0,0,0q�$
��Left=�$	��238��$��40��$	��Top=����� *
ItemName+$ PropertyChanged=� . )  #Xceed.Wpf.Toolkit.WatermarkComboBox  -   $��cb_category��-   	Watermark$- Категория��$��20(�$��
35,256,0,0q�$��Center=�$��10,0,0,0q�. �� DisplayMemberPath$
. Name��$
��Left=�$	��221��$��42��$	��Top=����� *ItemCategories+ �� *ItemCategory+$ PropertyChanged=� .   -   $��
cb_storage��$- 
Склад��$��20(�$��
35,316,0,0q�$��Center=�$��10,0,0,0q�$
��Left=�$	��168��$��42��$	��Top=�$
. Name��/ �� SelectedValuePath$
/ Name������ *StorageNames+$ PropertyChanged=� .  �� *	ItemPlace+$ PropertyChanged=� . �� -   $��btn_storage_search��$��	35,0,0,37q�$��Center=�$��24(�$��Verdana)�$��Center=�$��0q�$��60��$��Bottom=�$
��Left=�$	��152������ *StorageSearchCommand+��� .+��� $��/Resources/sr_icon5.ico��$
��Left=�$��0,0,80,0q�$��50���� $��
Поиск��$��18(�$��50,0,0,0q�$��Center=�$��Right=��� -   $��btn_storage_clear��$��
208,0,0,37q�$��Center=�$��24(�$��Verdana)�$��Center=�$��0q�$��60��$��Bottom=�$
��Left=�$	��157������ *StorageSearchClearCommand+��� .+��� $��/Resources/clr_icon1.ico��$
��Left=�$��0,0,80,0q�$��50���� $��WrapWithOverflow=�$��Новый поиск��$��18(�$��50,0,0,0q�$��Right=�&   System.Windows.Controls.DataGrid  -   $��
dg_storage��$��58,22,44,37q�$��1��0   AutoGenerateColumns0 .  1   
IsReadOnly1 . ���� *Items+$ PropertyChanged=� . 2   Columns2 0  *System.Windows.Controls.DataGridTextColumn  ,	  &System.Windows.Controls.DataGridColumn3 	  Header$3 Код��4 	  Width5
  /System.Windows.Controls.DataGridLengthConverter$4 70
 1  +System.Windows.Controls.DataGridBoundColumn5   Binding5 �� $ 	Item.Code�  $3 Наименование��$4 *
 5 �� $ 
Item.Title�  $3 Кол-во��$4 90
 5 �� $ Quantity�  $3 Цена за шт.��$	4 140
 5 �� $ 
Item.Price�  $3 
Склад��$4 90
 5 �� $ Storage.Name� =  7System.Windows.Controls.Primitives.DataGridColumnHeader*  $System.Windows.Controls.DataGridCell��%�   '        '  >     �� "  .��� 	 � ��$
 20(��� 	 � ��$
 Verdana)��� "  .��� 	 � ��$
 16(��� 	 � ��$
 5q�  -   $��spinner_storage��$��1��$%& Поиск по складу...��$��58,22,44,37q�' �� *IsSearching+$ PropertyChanged=� . �� $��Продажи��.��� ���#eaecf9$��	0,0,-2,-3q� �� $
��182* ��� $
��303* �.+��� $��1�� .  $��3��$
��Left=�$��Stretch=�$��
10,0,593,0q�{�.  �� -   $��
lab_sales1��$#��Основные данные��$��24(�$��Segoe UI)�$��	30,22,0,0q�$��40��$	��238��$
��Left=�$	��Top=�  -   $��txt_sold_item_code��$, Код товара��$��20(�$��	35,72,0,0q�$��Center=�$��5,0,0,0q�$
��Left=�$	��193��$��39��$	��Top=����� *
ItemCode+$ PropertyChanged=� .   -   $��txt_sold_item_name��$, Наименование��$��20(�$��
35,128,0,0q�$��Center=�$��5,0,0,0q�$
��Left=�$	��238��$��40��$	��Top=����� *
ItemName+$ PropertyChanged=� . �� -   $��
lab_sales2��$'��!Параметры выборки��$��24(�$��Segoe UI)�$��
30,225,0,0q�$��40��$	��238��$
��Left=�$	��Top=�	� -   6 	�Name$6 rb_sales_timeline��7 	� 	GroupName$	7 gr1��$ �� За промежуток��$
��Left=�$��
35,293,0,0q�$	��Top=�$��20(�8 d� 	IsChecked8 �� *IsTimelinePicked+$ PropertyChanged=� . 	� -   $6 rb_sales_daterange��$	7 gr1��$(��" Указанные пределы��$
��Left=�$��
35,360,0,0q�$	��Top=�$��20(�  -   9  Name$9 cb_sale_timeline��$- Не выбрано��$��20(�$��227,286,0,0q�$��Center=�$��10,0,0,0q�$
��Left=�$	��140��$��42��$	��Top=����� : �� Source#: [  �� *SelectedTimeline+ . $ PropertyChanged=����� "   �� ( �� ; �� ElementName$; rb_sales_timeline��$ 	IsChecked�	) False.a��� 	 � {�
 .  &   Xceed.Wpf.Toolkit.DateTimePicker  -   $��sales_date_from��$��40��$��
35,408,0,0q�$��20(�,  &Xceed.Wpf.Toolkit.Primitives.InputBase<   	Watermark$< Начало��$��Center=�$
��Left=�$	��160��$	��Top=�&   Xceed.Wpf.Toolkit.DateTimeUpDown=   Format$= 	ShortDate=��  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.DateTime, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]>   Value> �� *DateRangeFrom+$ PropertyChanged=� . ���� "   �� ( �� $; rb_sales_daterange��$ 	IsChecked�	) False.a��� 	 � {�
 .    -   $��sales_date_to��$��40��$��216,408,0,0q�$��20(�$< 
Конец��$��Center=�$
��Left=�$	��160��$	��Top=�$= 	ShortDate=�> �� *DateRangeTo+$ PropertyChanged=� . ���� "   �� ( �� $; rb_sales_daterange��$ 	IsChecked�	) False.a��� 	 � {�
 .  �� -   $��btn_sales_search��$��	35,0,0,37q�$��Center=�$��24(�$��Verdana)�$��Center=�$��0q�$��60��$��Bottom=�$
��Left=�$	��137������ *SalesSearchCommand+��� .+��� $��/Resources/sr_icon5.ico��$
��Left=�$��0,0,80,0q�$��50���� $��
Поиск��$��18(�$��50,0,0,0q�$��Center=�$��Right=��� -   $��btn_sales_clear��$��
208,0,0,37q�$��Center=�$��24(�$��Verdana)�$��Center=�$��0q�$��60��$��Bottom=�$
��Left=�$	��146������ *SalesSearchClearCommand+��� .+��� $��/Resources/clr_icon1.ico��$
��Left=�$��0,0,80,0q�$��50���� $��WrapWithOverflow=�$��Новый поиск��$��18(�$��50,0,0,0q�$��Right=�  -    $��dg_sales��$��58,22,44,37q�$��1��0 .  1 . ���� *	SoldItems+$ PropertyChanged=� . 2   $3 Код��$4 70
 5 �� $ 	Item.Code�$ PropertyChanged=� .   $3 Наименование��$4 *
 5 �� $ 
Item.Title�$ PropertyChanged=� .   $3 Дата��$4 *
 5 �� $ SaleDate�$ PropertyChanged=� .   $3 Кол-во��$4 90
 5 �� $ 
ItemAmount�$ PropertyChanged=� .   $3 
Сумма��$	4 140
 5 �� $ 
TotalPrice�$ PropertyChanged=� .  ��%�   '        '  >     �� "  .��� 	 � ��$
 20(��� 	 � ��$
 Verdana)��� "  .��� 	 � ��$
 16(��� 	 � ��$
 5q�  -!   $��spinner_sales��$��1��$%& Поиск по складу...��$��58,22,44,37q�' �� *IsSearching+$ PropertyChanged=� . �� -"   $+ btn_exit��$��	0,20,10,0q�$	��Top=�$��25(�$��60��$��3q�$��Right=�$	��164��$��Stretch=����� *LogoutCommand+��� .+��� $��
Выход��$
��Left=�$��Center=�$��10,0,0,0q��� $��/Resources/res_icon1.ico��$��Right=�$��0,0,10,0q��� -#   $+ btn_fs��$��Right=�$��
0,20,202,0q�? � ToolTip$:? 4Полноэкранный/обычный режим��$	��Top=�$��76��$��60��$��20(����� *FullscreenCommand+���� $; main_window��.���� $��/Resources/fs_icon1.ico���� -$   @ ��Name$@ stat_bar��$��0,0,0,6q�$��40��$��49��$��Bottom=�$
��10,0q����� A �� EndPoint$A 0.5,1&�B � MappingMode$B RelativeToBoundingBox=�C �� 
StartPoint$C 0.5,0&�.��� D � Color#D � ��E � Offset$E 1Q�� #D � ��.@��� .���� $��18(�
����������� *EmployeeName+$ PropertyChanged=� . �� $��Right=�.���� $��18(�
����������� $ CurrentDate�$ PropertyChanged=� . � -%   $��	grid_auth�����	#FF65931F$��-15,0q�{��� *IsUnauthorized+$ PropertyChanged=� .  ��%�   '��       �� " ��.��� 	 � ��

 ���� �� 	 � ��

 ������� 	 � ��
 �	#FFC7EC4A�� 	 � ��$
 Verdana)��� 	 � ��$
 22(��� 	 � ��$
 Center=��� 	 � ��$
 5,0,0,0q����� " � P�  � {� .  . ��� 	 � y�$
 Hidden=�.+��� -&   $+ btn_auth��$��Center=�$��Center=�$	��178��$��54��$��Вход�����	#FFBDE439$��414,412,408,284q�F �� 	IsDefaultF . ���� *LoginCommand+G �� IsAsyncG . ���� $; acc_pwd������ " ��.��� 	 � ��
 �	#FFC7EC4A�� 	 � ��

 ������� 	 � ��$
 Segoe UI)��� 	 � ��$
 Light"��� 	 � ��$
 26(� P�  � �� . . ��� 	 � ��

 ������� -'   $+ btn_app_close��$��Right=�$	��226��$(��"Выход из программы��$��	0,0,36,26q�$��54��$��Bottom=����� " ��.��� 	 � ��
 �� # � ���� 	 � ��

 ������� 	 � ��$
 Segoe UI)��� 	 � ��$
 Light"��� 	 � ��$
 22(��� 
�������$��1q�$��Center=�$	��303��$��394,187,394,260q�$��Center=�$	��242��$ 15��  -(   H  Name$H 	acc_login��$��Center=�$��58��I �� TextWrapping$I NoWrap=�$��Center=�$	��182��$��425,214,423,478q�$��Center=����� *AccountLogin+.������ "  .��� 	 � ��

 ���� �� 	 � ��

 ������� 	 � ��
 �	#FFC7EC4A�� 	 � ��$
 Verdana)��� 	 � ��$
 22(��� 	 � ��$
 Center=��� 	 � ��$
 5,0,0,0q�.��, �� $��24(�$��Verdana)�$��Italic$�
�������$��
Логин��J J� Opacity$	J 0.5Q�.��,  &Xceed.Wpf.Toolkit.WatermarkPasswordBox  -)   K  Name$K acc_pwd��$��Center=�$��425,300,423,394q�$��Center=�$��56��$	��182��L   PasswordChar$L *��$��Center=�.������ "  .��� 	 � ��

 ���� �� 	 � ��

 ������� 	 � ��
 �	#FFC7EC4A�� 	 � ��$
 Verdana)��� 	 � ��$
 22(��� 	 � ��$
 Center=��� 	 � ��$
 5,0,0,0q�.��, �� $��24(�$��Verdana)�$��Italic$�
�������$��Пароль��$	J 0.5Q�.��  -*   $��spinner_auth��$& Подождите...��' �� *IsAuthPassing+$ PropertyChanged=� . 