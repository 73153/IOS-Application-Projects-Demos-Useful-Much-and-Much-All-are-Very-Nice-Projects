//
//  PickerCell.h
//  Custom Cells App
//
//  Copyright 2011 Sensible Cocoa. All rights reserved.
//


@interface PickerCell : SCLabelCell <UIPickerViewDataSource, UIPickerViewDelegate>
{
    UITextField *pickerField;
    UIPickerView *pickerView;
}

@end
