//
//  DreamSelectionView.swift
//  UIComponents
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit
import Core
public protocol DreamSelectionDelegate: AnyObject {
    func dreamViewClicked(title: SelectableTitleEnum)
}

public class DreamSelectionView: UIView {
    public weak var delegate: DreamSelectionDelegate?
    
    public var backgroundImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.alpha = 0.8
        return imageView
    }()
    
    var backgroundImage: UIImage?
    var imageLayer = CALayer()
    
    public var titleLabel: UILabel  = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    public var priceView: PriceView?
    var selectedItem: SelectableTitleEnum?
    public init(image: UIImage?, title: SelectableTitleEnum, coinPrice: CGFloat) {
        super.init(frame: .zero)
        setup(with: coinPrice)
        backgroundImageView.layer.addSublayer(imageLayer)
        backgroundImage = image
        selectedItem = title
        titleLabel.text = selectedItem?.getSelectableItems()
        self.backgroundColor = .white

    }
    
    private func setup(with coinPrice: CGFloat) {
        priceView = PriceView(image: UIImage(named: ImageNames.coin), title: "\(coinPrice)")
        guard let priceView = priceView else { return }
        priceView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backgroundImageView)
        self.addSubview(titleLabel)
        self.addSubview(priceView)
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
        self.addGestureRecognizer(tapGesture)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),

            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            priceView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            priceView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            priceView.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.2),
            priceView.topAnchor.constraint(equalTo: self.bottomAnchor,constant: 8)
        ])
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height * 0.15
        titleLabel.layoutIfNeeded()
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = titleLabel.frame.height * 0.2
        let layer = backgroundImageView.layer
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        imageLayer.frame = layer.bounds
        imageLayer.contents = backgroundImage?.cgImage
        imageLayer.masksToBounds = true
        imageLayer.cornerRadius = backgroundImageView.frame.height * 0.15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func viewClicked() {
        delegate?.dreamViewClicked(title: selectedItem!)
    }
}

