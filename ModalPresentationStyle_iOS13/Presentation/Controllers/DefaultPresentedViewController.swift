//
//  DefaultPresentedViewController.swift
//  ModalPresentationStyle_iOS13
//
//  Created by Naraki on 8/15/19.
//  Copyright © 2019 i-enter. All rights reserved.
//

import UIKit

class DefaultPresentedViewController: UIViewController {
    // MARK: - Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presentingViewController?.beginAppearanceTransition(false, animated: animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentingViewController?.endAppearanceTransition()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentingViewController?.beginAppearanceTransition(true, animated: animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presentingViewController?.endAppearanceTransition()
    }
}
