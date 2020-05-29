//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

import Foundation
import UIKit

/// Protocol for selecting a cell.
protocol PlaybackCollectionCellDelegate: class {
    
    func didTap(cell: PlaybackCollectionCell)
}

private struct Constants {
    static let height: CGFloat = 36
    static let width: CGFloat = 100
    static let cornerRadius: CGFloat = 18
    static let backgroundColorActive: UIColor = .white
    static let backgroundColorInactive: UIColor = .clear
    static let fontColorActive: UIColor = .clear
    static let fontColorInactive: UIColor = .white
    static let font: UIFont = .guavaMedium()
}

/// The cell in ThumbnailCollectionView to display
final class PlaybackCollectionCell: UICollectionViewCell {
    
    static let height: CGFloat = Constants.height
    static var width: CGFloat = Constants.width
    weak var delegate: PlaybackCollectionCellDelegate?
    private let button = UIButton()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Updates the cell to be reused
    override func prepareForReuse() {
        super.prepareForReuse()
        button.setTitle(nil, for: .normal)
    }
    
    // MARK: - Layout
    
    private func setUpView() {
        setupLabel()
    }
    
    private func setupLabel() {
        contentView.addSubview(button)
        button.accessibilityIdentifier = "Playback Collection Cell Label"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Constants.cornerRadius
        button.titleLabel?.font = Constants.font
        button.titleLabel?.textColor = Constants.fontColorInactive
        button.backgroundColor = Constants.backgroundColorInactive
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: PlaybackCollectionCell.width),
            button.heightAnchor.constraint(equalToConstant: PlaybackCollectionCell.height),
        ])
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    // MARK: - Gesture recognizers
    
    @objc private func buttonTapped() {
        delegate?.didTap(cell: self)
    }
    
    // MARK: - Public interface
    
    func bindTo(_ item: PlaybackOption) {
        button.setTitle(item.text, for: .normal)
    }
    
    func setSelected(_ selected: Bool) {
        if selected {
            button.backgroundColor = Constants.backgroundColorActive
            button.titleLabel?.textColor = Constants.fontColorActive
        }
        else {
            button.backgroundColor = Constants.backgroundColorInactive
            button.titleLabel?.textColor = Constants.fontColorInactive
        }
    }
}
