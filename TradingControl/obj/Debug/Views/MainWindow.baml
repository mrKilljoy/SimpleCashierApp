   M S B A M L   `   `   `  ����O  Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem  5	   	   E ATradingDAL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI3clr-namespace:TradingDAL.Models;assembly=TradingDALTradingDAL.Models 5
   	   I ETradingControl, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:TradingControlTradingControl 5   	      TradingControl.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   X TXceed.Wpf.Toolkit, Version=3.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5   	   i eXceed.Wpf.AvalonDock.Themes.VS2010, Version=3.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f4g	 cXceed.Wpf.AvalonDock.Themes.Aero, Version=3.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f4h
 dXceed.Wpf.AvalonDock.Themes.Metro, Version=3.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f4[ WXceed.Wpf.AvalonDock, Version=3.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f4<xca,http://schemas.xceed.com/wpf/xaml/avalondock  	 
  5   	   F BWpfControls, Version=1.0.0.7, Culture=neutral, PublicKeyToken=null!acthttp://wpfcontrols.com/  5   	   3System&clr-namespace:System;assembly=mscorlib  5	   	   >dalm3clr-namespace:TradingDAL.Models;assembly=TradingDAL  5
   	   c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   (localclr-namespace:TradingControl  5   	   -   5          �Name$  main_window��5   	    � WindowStartupLocation$ CenterScreen=�5       � Title$ Trading Solutions Inc��5   	   $��701.5��6'   $
��1030��66   $
��1024��6C   $	��768��6S    � 	Resources 5         enumDataCategory S� 
MethodName S� 
ObjectType   System.Enum S� MethodParameters M� TypeName  enumDataSaleRange  item_descr_element �� 
TargetType	 �� Property
 �� Value  item_descr_disclaimer��%�  &	        &	 y     &	 �     &	 1    S� 5   
   $ 	GetValues��66   "  5       5      M� 5      $ dalm:StoreItemCategories��6   5      S� 5   
   $ 	GetValues��67   "  5       5      M� 5      $ dalm:SalePeriod��6   5      �� 5   
   " ��6+   .�5      �� 	 � ��$
 16(�6*   5      �� 5   
   " ��6.   .�5       �� 	 � ��$
 16(�6*   �� 5!      	 � ��$

 Bold"�6+   5"      5#      .��5$      � -   5        $��	main_grid��5$      $
��1000��6   $	��750��6,   $��11,-4,11,-5q�6<   .+�5%   
   � -   5        $��grid_primary��5%      $��-15,0q�6�   {�6#   �� *
IsActive+ �� UpdateSourceTrigger$ PropertyChanged=� �� NotifyOnSourceUpdated . ��5&      �� 5'      " �6   .�5(      �� 	 � ��
 �#71d67b63    �� Triggers 5)      P� 5*       P� Property � {� P� Value .  . �5+      �� 	 � y�$
 Hidden=�6;   5,      5.      .+�50      �� -   5         ��Name$ 
tabControl��50      $��10,38,10,70q�6-    51       �� 
TargetType �� CornerRadius ��Name �� Triggers �� 
TargetName��%�  '��       �� 52      " ��6   .�53      �� 	 � ��
 54      �� 55   "   " ��62   .R�56   &   �� $��Border��6-   $��1,1,2,0q�6;   
���   �$ 0,2,2,0��6j   $	��5,0q�6�   ._�57   *   �� $ ContentSite��6;   $��Center=�58   )   $��Center=�59   )   $��Header��5:   )   $��30,10q�5;   )   $��30(�68   5<   '    5=   &   P� 5>   *    �@��
IsSelected . . �5?   .   �� $ Border��65   	 � ��

 ��·�6_   5@   +   P� 5A   *    �@��
IsSelected .  . �5B   .   �� $ Border��65   	 � ��

 �����6_   5C   +   5E   #   5G      �� 5H      	 � ��
 5I      �� 5J   "   .R�5K   &   �� #��z��67   5L   #   5N      5O      5P      .@�5Q      �� $��
Касса��6   .��5R      � ���#f9f0ed � ColumnDefinitions 5S      �� 5T      $
��300* �6/   �� 5U      $	��500 �6/   .+�5W      %  WpfControls.AutoCompleteTextBox  -   5        $��txt_cashier_input��5W   2   $��1��6K   $��	0,46,51,0q�6[   $	��385��5X   �   $��50��6�   $	��Top=�6�      SelectedItem 62   �� *StoreSelectedItem+$ PropertyChanged=� .  �� Mode$ TwoWay=���5Y      �� 5Z   "   "  6(   .�5[   &   �� 	 � ��$
 22(�6A   �� 5\   &   	 �@ 	Watermark$H
 BВведите код или наименование товара��6B   �� 5]   &   	 �@ Provider
 6A   �� *TextSuggestionProvider+�� 5^   &   	 �@ Delay$	
 500��6>   �� 5_   &   	 �@ DisplayMember$
 Title��6F   �� 5`   &   	 � ��

 �����6C   �� 5a   &   	 � ��$
 Center=�6Q   �� 5b   &   	 � ��$
 Stretch=�6S   �� 5c   &   	 � ��$
 Right=�6L   5d   #      ItemTemplate 5f      5  -System.Windows.Controls.ItemContainerTemplate�  5g   "   .R�5h   &   � .+�5i   *   �� ��60   ��  �� Path$
 Code�6P   �� 5j   *   $��Verdana)�6O   ��60   �� $ Title�6f   5k   '   5l   #   5n      �� 5p      $��1��6!   $	��100��61   $��Stretch=�6>   $��24,236,24,237q�6\   
�������$��1q�5q   4   $ 2��6H   ._�5r      � $��1��6#   $	��100��63   $��Stretch=�6@    5s   "   �� 5t   &   $
��257* �67   �� 5u   &   $
��170* �67   .+�5w   "   �� .+�5x   &   �� $+��%Общее число позиций:��6,   $��20(�6K   �� 5y   &   $��24(�6�   ��6,   �� $ PinnedItems.Count�$ PropertyChanged=� . 6�   5z   #   �� 5{   "   $��1��6-   .+�5|   &   �� $��Сумма чека:��6,   $��20(�6B   $��Right=�6P   �� 5}   &   $��28(�6�   $��Right=�6�   ��6,   �� *BillCheckout+$ PropertyChanged=� . $ TwoWay=�6�   5~   #   5      5�      �� 5�      -   5        $��btn_checkout��5�   !   $��1��65   $��	64,0,0,45q�6E   $
��Left=�6X   $	��162��6s   $��70��6   $��Bottom=�6�   ��5�   !   �� *CheckoutCommand+��5�      �� 5�   "   " ��6(   .�5�   &   �� 	 � ��$
 24(�6A   5�   #   ��5�      � 5�   "   .+�5�   &   �� $��Расчет��6,   $
��Left=�6=   $��Center=�6X   $��0,0,70,0q�6s   �� 5�   &   $��Center=�6,   $��/Resources/ch_icon1.ico��6G   $��Right=�6h   $��	70,-5,0,5q�6�   5�   #   5�      �� 5�       �� ShowsPreview .  $��1��6<   $��3��6L   $��Stretch=�6V   $��	0,0,495,0q�6r   {�.  6�   �� 5�      -   5         ��Name$ 
lbox_items��5�   "   $��0��66   $
��Auto��6F   $��26,24,28,139q�6T   $��Stretch=�6j    �� SelectedItem 6�   �� *ListSelectedItem+$ PropertyChanged=� . ��5�      �� *PinnedItems+$ TwoWay=�$ PropertyChanged=� .  5�       �� 	Resources �� Color��%�  '��       �� 5�   "   " ��6(   .�5�   &   �� 	 � ��$

 10,2q�6?   �� 5�   &   	 � ��$
 Verdana)�6C   �� 5�   &   	 � ��$
 16(�6A   �� 5�   &   	 � ��$
 Stretch=�6L    5�   &   ���� 5�   *   $ LightSkyBlue��6l   (��       6:   * SystemColors.HighlightBrushKey+)6l   �� 5�   *   $
 Blue��6j   (��       6:   *SystemColors.ControlBrushKey+)6j   5�   '   5�   #   5�      ��5�      �� 5�   "   .R�5�   &   �� $ 5��6-   $��1q�6>   $��Center=�6R   $��30��6o   $
��Auto��6{   ._�5�   *   � $��5q�6/   $
��Auto��6:   $��Stretch=�6G    5�   .   �� 5�   2   �� 5�   2   �� 5�   2   .+�5�   .   �� $��0��68   $	��250��6i   $��Center=�6u   $��0,0,80,0q�6�   ��6H   �� $ 
Item.Title�6�   �� 5�   .   $��1��68   $	��120��6�   $��Center=�6�   $
��30,0q�6�   ��6H   �� $ 
ItemAmount�$ PropertyChanged=� . 6�   �� 5�   .   $��2��68   $
��Auto��6�   $��Center=�6�   $��60,0,0,0q�6�   $��Right=�6�   ��6H   �� $ 
TotalPrice�$ PropertyChanged=� . 6�   5�   +   5�   '   5�   #     J� InputBindings  5�      �� 5�   "   
! �� Key$! Delete��6-   " �� Command" 6:   �� *RemoveItemCommand+# �� CommandParameter# 6`   �� $ SelectedItem�$ �� RelativeSource$ �� % �� AncestorType"% ���� 5�   "   $! OemPlus��6-   " 6;   �� *IncrementItemAmountCommand+# 6j   �� $ SelectedItem�$ �� "% ���� 5�   "   $	! Add��6-   " 67   �� *IncrementItemAmountCommand+# 6f   �� $ SelectedItem�$ �� "% ���� 5�   "   $! OemMinus��6-   " 6<   �� *DecrementItemAmountCommand+# 6k   �� $ SelectedItem�$ �� "% ���� 5�   "   $! Subtract��6-   " 6<   �� *DecrementItemAmountCommand+# 6k   �� $ SelectedItem�$ �� "% ��5�      %  Xceed.Wpf.Toolkit.BusyIndicator  5�      -   5        $��spinner_checkout��5�   =   $��0��6-   &   BusyContent$&&  Сохранение чека...��6U   $��26,24,28,139q�6�   '   IsBusy' 6v   �� *IsCheckoutPassing+$ PropertyChanged=� . 6�   � 5�      -	   5        $��selected_item_description��5�      $��0��6@   $	��100��6P   $��Bottom=�6^   $��Stretch=�6y   $��	26,0,28,0q�6�   .+�5�      � $��1��6(   $��35��65   .+�5�   "   �� #��[ 6(   $��Наименование:��6W   �� 5�   "   #��[ 6(   ��6T   �� $! ListSelectedItem.Item.Title�5�      � 5�      $��0��6#    5�   "   �� 5�   &   $
��100* �67   �� 5�   &   $
��103* �67   �� 5�   &   $
��115* �67   �� 5�   &   $
��128* �67   .+�5�   "   � $��0��6,   $	��100��6<   $
��Left=�6H   $	��0,8q�6c   .+�5�   &   �� #��[ 6,   $��Код:��6[   �� 5�   &   #��[ 6,   ��6X   �� $  ListSelectedItem.Item.Code�5�   #   � 5�   "   $��1��6,   $	��100��6<   $
��Left=�6H   $	��0,8q�6c   .+�5�   &   �� #��[ 6,   $��	Цена:��6[   �� 5�   &   #��[ 6,   ��6X   �� $! ListSelectedItem.Item.Price�5�   #   � 5�   "   $��2��6,   $
��Left=�6=   $	��0,8q�6X   $	��115��6e   .+�5�   &   �� #��[ 6,   $��Кол-во:��6[   �� 5�   &   #��[ 6,   ��6X   �� $! ListSelectedItem.ItemAmount�$ PropertyChanged=�5�   #   � 5�   "   $��3��6,   $	��118��6<   $
��Left=�6H   $	��0,8q�6c   .+�5�   &   �� #��[ 6,   $��Сумма:��6[   �� 5�   &   #��[ 6,   ��6X   �� $! ListSelectedItem.TotalPrice�$ PropertyChanged=�5�   #   5�      ��5�      �� 5�   "   " �6(    5�   &   �� 5�   *   ( �� Binding( 66   �� *ListSelectedItem+) �� Value) 6[   Z� .a�5�   .   �� 	 � {�
 .  6J   5�   +   P� 5�   *    � {� .  . �5�   .   �� 	 � y�$
 Hidden=�6K   5�   +   5�   #   * � RowDefinitions* 5�      �� 5�   "   �� 5�   "   5�      �� 5�      -
   5        + ��Name$+ btn_bill_clear��5�   !   $��1��69   $��	0,0,37,45q�6I   $��Right=�5�   !   $	��191��6=   $��70��6I   $��Bottom=�6U   ��5�   !   �� *DropCurrentListCommand+��5�      �� 5�   "   " ��6(   .�5�   &   �� 	 � ��$
 20(�6A   5�   #   ��5�      � 5�   "   .+�5�   &   �� $��Очистить��6,   $
��Left=�6?   $��Center=�6Z   $��0,0,70,0q�6u   �� 5�   &   $��/Resources/clr_icon5.ico��6,   $��Right=�6N   $��70,0,0,0q�6j   5�   #   5�      5�      5�      �� 5     $��
Склад��6   .��5     � ���	#FFF8FFF1 5     �� 5     $
��182* �6/   �� 5     $
��303* �6/   .+�5     �� $��1��6'    .  $��3��6L   $
��Left=�6V   $��Stretch=�6q   $��
10,0,593,0q�6�   {�.  6�   �� 5     -   5        $��lab_storage1��5      $#��Основные данные��64   $��24(�6N   $��Segoe UI)�6\   $��	30,22,0,0q�6r   $��40��6�   $	��238��6�   $
��Left=�6�   $	��Top=�6�   (  "Xceed.Wpf.Toolkit.WatermarkTextBox  5	     -   5        $��txt_item_code��5	  0   ,   	Watermark$, Код товара��6E   $��20(�6\   $��	35,72,0,0q�6j   $��Center=�6}   $��5,0,0,0q�6�   $
��Left=�6�   $	��193��6�   $��39��6�   $	��Top=�6�   ��5
  0   �� *
ItemCode+$ PropertyChanged=� . �� 5     -   5        $��lab_storage2��5      $ ��Дополнительно��64   $��24(�6L   $��Segoe UI)�6Z   $��
30,203,0,0q�6p   $��40��6�   $	��238��6�   $
��Left=�6�   $	��Top=�6�     5     -   5        $��txt_item_name��5  0   $, Наименование��6E   $��20(�6^   $��
35,128,0,0q�6l   $��Center=�6�   $��5,0,0,0q�6�   $
��Left=�6�   $	��238��6�   $��40��6�   $	��Top=�6�   ��5  0   �� *
ItemName+$ PropertyChanged=� . )  #Xceed.Wpf.Toolkit.WatermarkComboBox  5     -   5        $��cb_category��5  1   -   	Watermark$- Категория��6D   $��20(�6Z   $��
35,256,0,0q�6h   $��Center=�6|   $��10,0,0,0q�6�   . �� DisplayMemberPath$
. Name��6�   $
��Left=�6�   $	��221��6  $��42��6  $	��Top=�6$  ��6�   �� *ItemCategories+ 5  1   �� *ItemCategory+$ PropertyChanged=� .   5     -   5        $��
cb_storage��5  1   $- 
Склад��6C   $��20(�6U   $��
35,316,0,0q�6c   $��Center=�6w   $��10,0,0,0q�6�   $
��Left=�6�   $	��168��6�   $��42��6�   $	��Top=�6�   $
. Name��5  �   / �� SelectedValuePath$
/ Name��6�   ��61   �� *StorageNames+$ PropertyChanged=� .  6�   �� *	ItemPlace+$ PropertyChanged=� . �� 5     -   5        $��btn_storage_search��5  !   $��	35,0,0,37q�6;   $��Center=�6N   $��24(�6r   $��Verdana)�6�   $��Center=�6�   $��0q�6�   $��60��6�   $��Bottom=�6�   $
��Left=�6�   $	��152��6  ��5  !   �� *StorageSearchCommand+��5     � 5  "   .+�5  &   �� $��/Resources/sr_icon5.ico��6,   $
��Left=�6M   $��0,0,80,0q�6h   $��50��6z   �� 5  &   $��
Поиск��6,   $��18(�6<   $��50,0,0,0q�6J   $��Center=�6\   $��Right=�6~   5  #   5     �� 5     -   5        $��btn_storage_clear��5  !   $��
208,0,0,37q�6:   $��Center=�6N   $��24(�6r   $��Verdana)�6�   $��Center=�6�   $��0q�6�   $��60��6�   $��Bottom=�6�   $
��Left=�6�   $	��157��6  ��5  !   �� *StorageSearchClearCommand+��5     � 5  "   .+�5  &   �� $��/Resources/clr_icon1.ico��6,   $
��Left=�6N   $��0,0,80,0q�6i   $��50��6{   �� 5   &   $��WrapWithOverflow=�60   $��Новый поиск��6P   $��18(�6c   $��50,0,0,0q�6q   $��Right=�6�   5!  #   5#     &   System.Windows.Controls.DataGrid  5D     -   5        $��
dg_storage��5D  #   $��58,22,44,37q�65   $��1��6J   0   AutoGenerateColumns0 .  1   
IsReadOnly1 . ��6Z   �� *Items+$ PropertyChanged=� . 2   Columns2 5E     0  *System.Windows.Controls.DataGridTextColumn  5F  "   ,	  &System.Windows.Controls.DataGridColumn3 	  Header$3 Код��65   4 	  Width5
  /System.Windows.Controls.DataGridLengthConverter$4 70
 6e   1  +System.Windows.Controls.DataGridBoundColumn5   Binding5 6B   �� $ 	Item.Code�6e     5G  "   $3 Наименование��65   $4 *
 6o   5 6K   �� $ 
Item.Title�6o     5H  "   $3 Кол-во��65   $4 90
 6g   5 6E   �� $ Quantity�6g     5I  "   $3 Цена за шт.��65   $	4 140
 6n   5 6J   �� $ 
Item.Price�6n     5J  "   $3 
Склад��65   $4 90
 6j   5 6D   �� $ Storage.Name�6j    5L     =  7System.Windows.Controls.Primitives.DataGridColumnHeader*  $System.Windows.Controls.DataGridCell��%�   '        '  q     �� 5M  "   "  6(   .�5N  &   �� 	 � ��$
 20(�6A   �� 5O  &   	 � ��$
 Verdana)�6C   5P  #   �� 5Q  "   "  6(   .�5R  &   �� 	 � ��$
 16(�6A   �� 5S  &   	 � ��$
 5q�6@   5T  #   5U     5V       5W     -   5        $��spinner_storage��5W  -   $��1��6D   $%& Поиск по складу...��6�   $��58,22,44,37q�6�   ' 6T   �� *IsSearching+$ PropertyChanged=� . 6�   5X     5Y     �� 5[     $��Продажи��6   .��5\     � ���#eaecf9$��	0,0,-2,-3q�60    5]     �� 5^     $
��182* �6/   �� 5_     $
��303* �6/   .+�5a     �� $��1��6'    .  $��3��6L   $
��Left=�6V   $��Stretch=�6q   $��
10,0,593,0q�6�   {�.  6�   �� 5b     -   5        $��
lab_sales1��5b      $#��Основные данные��62   $��24(�6L   $��Segoe UI)�6Z   $��	30,22,0,0q�6p   $��40��6�   $	��238��6�   $
��Left=�6�   $	��Top=�6�     5c     -   5        $��txt_sold_item_code��5c  0   $, Код товара��6J   $��20(�6a   $��	35,72,0,0q�6o   $��Center=�6�   $��5,0,0,0q�6�   $
��Left=�6�   $	��193��6�   $��39��6�   $	��Top=�6�   ��5d  0   �� *
ItemCode+$ PropertyChanged=� .   5e     -   5        $��txt_sold_item_name��5e  0   $, Наименование��6J   $��20(�6c   $��
35,128,0,0q�6q   $��Center=�6�   $��5,0,0,0q�6�   $
��Left=�6�   $	��238��6�   $��40��6�   $	��Top=�6�   ��5f  0   �� *
ItemName+$ PropertyChanged=� . �� 5g     -   5        $��
lab_sales2��5g      $'��!Параметры выборки��62   $��24(�6N   $��Segoe UI)�6\   $��
30,225,0,0q�6r   $��40��6�   $	��238��6�   $
��Left=�6�   $	��Top=�6�   	� 5i     -   5        6 	�Name$6 rb_sales_timeline��5i  6   7 	� 	GroupName$	7 gr1��6&   $ �� За промежуток��6Q   $
��Left=�6j   $��
35,293,0,0q�6�   $	��Top=�6�   $��20(�6�   8 d� 	IsChecked8 6�   �� *IsTimelinePicked+$ PropertyChanged=� . 	� 5j     -   5        $6 rb_sales_daterange��5j  6   $	7 gr1��6&   $(��" Указанные пределы��6R   $
��Left=�6o   $��
35,360,0,0q�6�   $	��Top=�6�   $��20(�6�     5k     -   5        9  Name$9 cb_sale_timeline��5k  1   $- Не выбрано��6K   $��20(�6b   $��227,286,0,0q�6p   $��Center=�6�   $��10,0,0,0q�6�   $
��Left=�6�   $	��140��6  $��42��6#  $	��Top=�6/  ��6�   �� : �� Source#: [  5l     �� *SelectedTimeline+ . $ PropertyChanged=���5m     �� 5n  "   "  6(    5o  &   �� 5p  *   ( 66   �� ; �� ElementName$; rb_sales_timeline��$ 	IsChecked�	) False6x   .a�5q  .   �� 	 � {�
 .  6J   5r  +   5t  #   5v     &   Xceed.Wpf.Toolkit.DateTimePicker  5x     -   5        $��sales_date_from��5x  .   $��40��6E   $��
35,408,0,0q�6Q   $��20(�6e   ,  &Xceed.Wpf.Toolkit.Primitives.InputBase<   	Watermark$< Начало��6s   $��Center=�5y  .   $
��Left=�6R   $	��160��6m   $	��Top=�6y   &   Xceed.Wpf.Toolkit.DateTimeUpDown=   Format$= 	ShortDate=�6�   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.DateTime, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]>   Value> 5x  �   �� *DateRangeFrom+$ PropertyChanged=� . ��5z     �� 5{  "   "  6(    5|  &   �� 5}  *   ( 66   �� $; rb_sales_daterange��$ 	IsChecked�	) False6y   .a�5~  .   �� 	 � {�
 .  6J   5  +   5�  #   5�       5�     -   5        $��sales_date_to��5�  .   $��40��6C   $��216,408,0,0q�6O   $��20(�6d   $< 
Конец��6r   $��Center=�5�  .   $
��Left=�6R   $	��160��6m   $	��Top=�6y   $= 	ShortDate=�6�   > 5�  �   �� *DateRangeTo+$ PropertyChanged=� . ��5�     �� 5�  "   "  6(    5�  &   �� 5�  *   ( 66   �� $; rb_sales_daterange��$ 	IsChecked�	) False6y   .a�5�  .   �� 	 � {�
 .  6J   5�  +   5�  #   5�     �� 5�     -   5        $��btn_sales_search��5�  !   $��	35,0,0,37q�69   $��Center=�6L   $��24(�6p   $��Verdana)�6~   $��Center=�6�   $��0q�6�   $��60��6�   $��Bottom=�6�   $
��Left=�6�   $	��137��6  ��5�  !   �� *SalesSearchCommand+��5�     � 5�  "   .+�5�  &   �� $��/Resources/sr_icon5.ico��6,   $
��Left=�6M   $��0,0,80,0q�6h   $��50��6z   �� 5�  &   $��
Поиск��6,   $��18(�6<   $��50,0,0,0q�6J   $��Center=�6\   $��Right=�6~   5�  #   5�     �� 5�     -   5        $��btn_sales_clear��5�  !   $��
208,0,0,37q�68   $��Center=�6L   $��24(�6p   $��Verdana)�6~   $��Center=�6�   $��0q�6�   $��60��6�   $��Bottom=�6�   $
��Left=�6�   $	��146��6  ��5�  !   �� *SalesSearchClearCommand+��5�     � 5�  "   .+�5�  &   �� $��/Resources/clr_icon1.ico��6,   $
��Left=�6N   $��0,0,80,0q�6i   $��50��6{   �� 5�  &   $��WrapWithOverflow=�60   $��Новый поиск��6P   $��18(�6c   $��50,0,0,0q�6q   $��Right=�6�   5�  #   5�       5�     -    5        $��dg_sales��5�  #   $��58,22,44,37q�63   $��1��6H   0 .  1 . ��6X   �� *	SoldItems+$ PropertyChanged=� . 2 5�       5�  "   $3 Код��65   $4 70
 6�   5 6B   �� $ 	Item.Code�$ PropertyChanged=� . 6�     5�  "   $3 Наименование��65   $4 *
 6�   5 6K   �� $ 
Item.Title�$ PropertyChanged=� . 6�     5�  "   $3 Дата��65   $4 *
 6�   5 6C   �� $ SaleDate�$ PropertyChanged=� . 6�     5�  "   $3 Кол-во��65   $4 90
 6�   5 6E   �� $ 
ItemAmount�$ PropertyChanged=� . 6�     5�  "   $3 
Сумма��65   $	4 140
 6�   5 6D   �� $ 
TotalPrice�$ PropertyChanged=� . 6�    5�     ��%�   '        '  q     �� 5�  "   "  6(   .�5�  &   �� 	 � ��$
 20(�6A   �� 5�  &   	 � ��$
 Verdana)�6C   5�  #   �� 5�  "   "  6(   .�5�  &   �� 	 � ��$
 16(�6A   �� 5�  &   	 � ��$
 5q�6@   5�  #   5�     5�       5�     -!   5        $��spinner_sales��5�  -   $��1��6B   $%& Поиск по складу...��6�   $��58,22,44,37q�6�   ' 6R   �� *IsSearching+$ PropertyChanged=� . 6�   5�     5�     5�     �� 5�     -"   5        $+ btn_exit��5�     $��	0,20,10,0q�6'   $	��Top=�6:   $��25(�6R   $��60��6`   $��3q�5�  7   $��Right=�6C   $	��164��6_   $��Stretch=�5�     ��5�     �� *LogoutCommand+��5�     � 5�     .+�5�     �� $��
Выход��6    $
��Left=�60   $��Center=�6K   $��10,0,0,0q�6f   �� 5�     $��/Resources/res_icon1.ico��6    $��Right=�6B   $��0,0,10,0q�6^   5�     5�     �� 5�     -#   5        $+ btn_fs��5�     $��Right=�6%   $��
0,20,202,0q�6A   ? � ToolTip$:? 4Полноэкранный/обычный режим��6U   $	��Top=�5�     $��76��6-   $��60��68   $��20(�6D   ��5�     �� *FullscreenCommand+��67   �� $; main_window��.��5�     �� $��/Resources/fs_icon1.ico��6   5�     �� 5�     -$   5        @ ��Name$@ stat_bar��5�     $��0,0,0,6q�6*   $��40��6;   $��49��6J   $��Bottom=�6V   $
��10,0q�6q   ��5�     �� 5�     A �� EndPoint$A 0.5,1&�6*   B � MappingMode$B RelativeToBoundingBox=�6;   C �� 
StartPoint$C 0.5,0&�6_   .��5�     � D � Color#D � ��6'   E � Offset$E 1Q�6q   � 5�     #D � ��6'   5�     .@�5�     �� .��5�     �� $��18(�6~   
���������6   �� *EmployeeName+$ PropertyChanged=� . 6�   5�     �� 5�     $��Right=�6    .��5�     �� $��18(�6�   
���������6   �� $ CurrentDate�$ PropertyChanged=� . 6�   5�     5�     5�     � 5�  
   -%   5        $��	grid_auth��5�     ���	#FF65931F$��-15,0q�5�  u   {�6   �� *IsUnauthorized+$ PropertyChanged=� .  5�     ��%D  '��       �� 5�     " ��6   .�5�     �� 	 � ��

 ���� 63   �� 5�     	 � ��

 �����63   �� 5�     	 � ��
 �	#FFC7EC4A64   �� 5�     	 � ��$
 Verdana)�63   �� 5�     	 � ��$
 22(�61   �� 5�     	 � ��$
 Center=�6A   �� 5�     	 � ��$
 5,0,0,0q�60   5�     5�     ��5�     �� 5�     " �6    5�     P� 5�      � {� .  . �5�     �� 	 � y�$
 Hidden=�6;   5�     5�     .+�5�     �� -&   5        $+ btn_auth��5�     $��Center=�6'   $��Center=�6D   $	��178��6_   $��54��6k   $��Вход��6w   ���	#FFBDE439$��414,412,408,284q�6�   F �� 	IsDefaultF . ��5�     �� *LoginCommand+G �� IsAsyncG . ��6D   �� $; acc_pwd����5�     �� 5�     " ��6   .�5�     �� 	 � ��
 �	#FFC7EC4A6K   �� 5�     	 � ��

 �����6G   �� 5�     	 � ��$
 Segoe UI)�67   �� 5�     	 � ��$
 Light"�67   �� 5�     	 � ��$
 26(�65    5�     P� 5�      � �� . . �5�  "   �� 	 � ��

 �����6N   5�     5     5     �� 5     -'   5        $+ btn_app_close��5     $��Right=�6,   $	��226��6H   $(��"Выход из программы��6T   $��	0,0,36,26q�6r   $��54��6�   $��Bottom=�6�   ��5     �� 5     " ��6   .�5     �� 	 � ��
 5	     �� 5
  "   # � ��62   5     �� 5     	 � ��

 �����6G   �� 5     	 � ��$
 Segoe UI)�67   �� 5     	 � ��$
 Light"�67   �� 5     	 � ��$
 22(�65   5     5     �� 5     
�������$��1q�6)   $��Center=�6=   $	��303��6Z   $��394,187,394,260q�6g   $��Center=�6�   $	��242��6�   $ 15��6�     5     -(   5        H  Name$H 	acc_login��5  $   $��Center=�67   $��58��6T   I �� TextWrapping$I NoWrap=�6`   $��Center=�6v   $	��182��6�   $��425,214,423,478q�5  4   $��Center=�6M   ��6   �� *AccountLogin+.��6q   ��5     �� 5     "  6   .�5     �� 	 � ��

 ���� 67   �� 5     	 � ��

 �����67   �� 5     	 � ��
 �	#FFC7EC4A68   �� 5     	 � ��$
 Verdana)�67   �� 5     	 � ��$
 22(�65   �� 5     	 � ��$
 Center=�6E   �� 5      	 � ��$
 5,0,0,0q�64   5!     .��5"  /   , 5#     �� 5$     $��24(�6    $��Verdana)�6.   $��Italic$�6C   
�������$��
Логин��6i   J J� Opacity$	J 0.5Q�6v   .��5%  3   5&     ,  &Xceed.Wpf.Toolkit.WatermarkPasswordBox  5(     -)   5        K  Name$K acc_pwd��5(  (   $��Center=�69   $��425,300,423,394q�6V   $��Center=�6o   $��56��6�   $	��182��6�   L   PasswordChar$L *��5)     $��Center=�6+   .��6O   ��5*     �� 5+     "  6   .�5,     �� 	 � ��

 ���� 67   �� 5-     	 � ��

 �����67   �� 5.     	 � ��
 �	#FFC7EC4A68   �� 5/     	 � ��$
 Verdana)�67   �� 50     	 � ��$
 22(�65   �� 51     	 � ��$
 Center=�6E   �� 52     	 � ��$
 5,0,0,0q�64   53     .��54  3   , 55     �� 56     $��24(�6    $��Verdana)�6.   $��Italic$�6C   
�������$��Пароль��6i   $	J 0.5Q�6w   .��57  7   58       5:     -*   5        $��spinner_auth��5:  !   $& Подождите...��65   ' 6P   �� *IsAuthPassing+$ PropertyChanged=� . 5;     5<     5=     