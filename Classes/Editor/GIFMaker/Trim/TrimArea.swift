//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

import Foundation
import UIKit

/// Constants for Trim area
private struct Constants {
    static let cornerRadius: CGFloat = 8
    
    static let selectorColor: UIColor = .tumblrBrightBlue
    static let selectorBorderHeight: CGFloat = 5
    static let selectorSideWidth: CGFloat = 16
    
    static let selectorLineHeight: CGFloat = 35
    static let selectorLineWidth: CGFloat = 4
    static let selectorLineCornerRadius: CGFloat = 4
    static let selectorLineColor: UIColor = .white
}

final class TrimArea: UIView {
    
    static let selectorWidth = Constants.selectorSideWidth
    
    private let leftView: UIView
    private let leftLine: UIView
    private let rightView: UIView
    private let rightLine: UIView
    private let topView: UIView
    private let bottomView: UIView
    
    // MARK: - Initializers
    
    init() {
        leftView = UIView()
        leftLine = UIView()
        rightView = UIView()
        rightLine = UIView()
        topView = UIView()
        bottomView = UIView()
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupViews() {
        setupLeftView()
        setupLeftLine()
        setupRightView()
        setupRightLine()
        setupTopView()
        setupBottomView()
    }
    
    private func setupLeftView() {
        leftView.accessibilityIdentifier = "Trim Area Left View"
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.backgroundColor = Constants.selectorColor
        leftView.layer.cornerRadius = Constants.cornerRadius
        leftView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        addSubview(leftView)
        
        NSLayoutConstraint.activate([
            leftView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            leftView.widthAnchor.constraint(equalToConstant: Constants.selectorSideWidth),
            leftView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            leftView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupRightView() {
        rightView.accessibilityIdentifier = "Trim Area Right View"
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightView.backgroundColor = Constants.selectorColor
        rightView.layer.cornerRadius = Constants.cornerRadius
        rightView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        addSubview(rightView)
        
        NSLayoutConstraint.activate([
            rightView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            rightView.widthAnchor.constraint(equalToConstant: Constants.selectorSideWidth),
            rightView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            rightView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupLeftLine() {
        leftLine.accessibilityIdentifier = "Trim Area Left Line"
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        leftLine.backgroundColor = Constants.selectorLineColor
        leftLine.layer.cornerRadius = Constants.selectorLineCornerRadius
        leftView.addSubview(leftLine)
        
        NSLayoutConstraint.activate([
            leftLine.centerXAnchor.constraint(equalTo: leftView.centerXAnchor),
            leftLine.centerYAnchor.constraint(equalTo: leftView.centerYAnchor),
            leftLine.heightAnchor.constraint(equalToConstant: Constants.selectorLineHeight),
            leftLine.widthAnchor.constraint(equalToConstant: Constants.selectorLineWidth),
        ])
    }
    
    private func setupRightLine() {
        rightLine.accessibilityIdentifier = "Trim Area Right Line"
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        rightLine.backgroundColor = Constants.selectorLineColor
        rightLine.layer.cornerRadius = Constants.selectorLineCornerRadius
        rightView.addSubview(rightLine)
        
        NSLayoutConstraint.activate([
            rightLine.centerXAnchor.constraint(equalTo: rightView.centerXAnchor),
            rightLine.centerYAnchor.constraint(equalTo: rightView.centerYAnchor),
            rightLine.heightAnchor.constraint(equalToConstant: Constants.selectorLineHeight),
            rightLine.widthAnchor.constraint(equalToConstant: Constants.selectorLineWidth),
        ])
    }
    
    private func setupTopView() {
        topView.accessibilityIdentifier = "Trim Area Top View"
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = Constants.selectorColor
        topView.layer.cornerRadius = Constants.cornerRadius
        addSubview(topView)
        
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            topView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: Constants.selectorBorderHeight),
        ])
    }
    
    private func setupBottomView() {
        bottomView.accessibilityIdentifier = "Trim Area Bottom View"
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = Constants.selectorColor
        bottomView.layer.cornerRadius = Constants.cornerRadius
        addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: Constants.selectorBorderHeight),
        ])
    }
}
