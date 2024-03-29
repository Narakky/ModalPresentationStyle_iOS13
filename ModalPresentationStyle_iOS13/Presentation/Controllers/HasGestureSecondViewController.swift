//
//  HasGestureSecondViewController.swift
//  ModalPresentationStyle_iOS13
//
//  Created by Naraki on 8/16/19.
//  Copyright © 2019 i-enter. All rights reserved.
//

import UIKit

final class HasGestureSecondViewController: DefaultPresentedViewController {
    // MARK: - Outlet

    @IBOutlet private weak var fingerImageView: UIImageView!
    
    // MARK: - Variable

    private var isAnimated = false

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if !isAnimated {
            UIView.animate(withDuration: 1.5, delay: 0, options: [.curveEaseIn, .repeat], animations: { [weak self] in
                guard let `self` = self else { return }
                self.fingerImageView.center.y += self.view.center.y - 60
                }, completion: nil)
            isAnimated = true
        }
    }

    // MARK: - Action
    @IBAction private func panGesture(_ sender: UIPanGestureRecognizer) {
        let movePoint = sender.translation(in: view)

        if movePoint.y > 0 && (-movePoint.y < movePoint.x && movePoint.x < movePoint.y) {
            view.frame = CGRect(x: view.frame.origin.x,
                                y: movePoint.y,
                                width: view.frame.width,
                                height: view.frame.height)
        } else if movePoint.y < 0 && view.frame.origin.y > 0 {
            if movePoint.y < 100 {
                animateOriginalFrame()
                return
            }
            view.frame = CGRect(x: view.frame.origin.x,
            y: movePoint.y,
            width: view.frame.width,
            height: view.frame.height)
        } else {
            animateOriginalFrame()
        }

        if sender.state == .ended {
            if movePoint.y > 100 {
                animateDismissViewController()
            } else {
                animateOriginalFrame()
            }
        }
    }

    // MARK: - Private

    private func animateOriginalFrame() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { [weak self] in
            guard let `self` = self else { return }
            self.view.frame = CGRect(x: self.view.frame.origin.x,
            y: 0,
            width: self.view.frame.width,
            height: self.view.frame.height)
        }, completion: nil)

    }

    private func animateDismissViewController() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { [weak self] in
            guard let `self` = self else { return }
            self.view.frame = CGRect(x: self.view.frame.origin.x,
            y: self.view.frame.height,
            width: self.view.frame.width,
            height: self.view.frame.height)
            }, completion: { [weak self] _ in
                guard let `self` = self else { return }
                self.dismiss(animated: false, completion: nil)
        })
    }
}
