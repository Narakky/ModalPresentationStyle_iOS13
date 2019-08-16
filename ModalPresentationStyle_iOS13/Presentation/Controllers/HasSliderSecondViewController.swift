//
//  HasSliderSecondViewController.swift
//  ModalPresentationStyle_iOS13
//
//  Created by Naraki on 8/15/19.
//  Copyright © 2019 i-enter. All rights reserved.
//

import UIKit

final class HasSliderSecondViewController: DefaultPresentedViewController {
    // MARK: - Outlet
    
    @IBOutlet private weak var horizontalSlider: UISlider!
    @IBOutlet private weak var verticalSlider: UISlider! {
        didSet {
            verticalSlider.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
