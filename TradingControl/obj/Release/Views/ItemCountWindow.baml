   M S B A M L   `   `   `  ���� I  ETradingControl, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:TradingControl.ViewsTradingControl.Views  *    $TradingControl.Views.ItemCountWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     X TXceed.Wpf.Toolkit, Version=3.0.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  .local"clr-namespace:TradingControl.Views    � Title$  ItemCountWindow��$	��124��$	��300�� � WindowStartupLocation$ CenterScreen=� � Topmost .  +� FocusedElement ��  �� ElementName$ txt_counter������  �� 
TargetType" �.���  �� Property �@�WindowStyle �� Value$
 None=���  �@�WindowState$ Normal=���  �@�
ResizeMode$ NoResize=�.��� .+��� 
���   �$��2q� �� CornerRadius$ 3��._�� .+�%  Xceed.Wpf.Toolkit.IntegerUpDown  -   $��txt_counter���  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]	   Minimum$	 0X�$��16(�,  &Xceed.Wpf.Toolkit.Primitives.InputBase
   	Watermark$6
 0Введите количество товара��$��40��$��	27,16,0,0q�$	��Top=�$
��Left=�$	��246�� � Cursor$ IBeam��|�.    Value �� *ItemCounter+�� -   $��OK��$��35��$	��100��$��	27,73,0,0q�$��18(� �� 	IsDefault . $	��Top=�$
��Left=��� $��Отмена��$��35��$	��100��$��
173,73,0,0q�$��18(� �� IsCancel . $	��Top=�$
��Left=�