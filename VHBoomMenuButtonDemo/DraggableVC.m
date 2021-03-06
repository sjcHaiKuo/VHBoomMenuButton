//
//  DraggableVC.m
//  VHBoomMenuButton
//
//  Created by Nightonke on 2017/4/14.
//  Copyright © 2017 Nightonke. All rights reserved.
//

#import "DraggableVC.h"
#import "BuilderManager.h"
#import <BoomMenuButton/BoomMenuButton.h>

@interface DraggableVC ()

@property (weak, nonatomic) IBOutlet VHBoomMenuButton *bmb;

@property (weak, nonatomic) IBOutlet UISwitch *draggableSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *backgroundEffectSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *shadowEffectSwitch;

@end

@implementation DraggableVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIEdgeInsets edgeInsets = self.bmb.edgeInsetsInSuperView;
    // Prevent the bmbs being dragged behind navigation bar.
    edgeInsets.top += 66;
    
    self.bmb.buttonEnum = VHButtonSimpleCircle;
    self.bmb.piecePlaceEnum = VHPiecePlaceDOT_9_1;
    self.bmb.buttonPlaceEnum = VHButtonPlaceSC_9_1;
    self.bmb.edgeInsetsInSuperView = edgeInsets;
    for (int i = 0; i < self.bmb.pieceNumber; i++)
    {
        [self.bmb addBuilder:[BuilderManager simpleCircleButtonBuilder]];
    }
}

- (IBAction)onSwitchValueChanged:(UISwitch *)sender
{
    if (sender == self.draggableSwitch)
    {
        self.bmb.draggable = sender.on;
    }
    else if (sender == self.backgroundEffectSwitch)
    {
        self.bmb.hasBackground = sender.on;
    }
    else if (sender == self.shadowEffectSwitch)
    {
        self.bmb.hasShadow = sender.on;
    }
}

@end
