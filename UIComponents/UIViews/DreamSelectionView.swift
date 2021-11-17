//
//  DreamSelectionView.swift
//  UIComponents
//
//  Created by Berkehan on 15.11.2021.
//

import UIKit
import Core
public class DreamSelectionView: UIView {
    public var backgroundImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.alpha = 0.8
        return imageView
    }()
    
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
    
    public init(image: UIImage?, title: String, coinPrice: CGFloat) {
        super.init(frame: .zero)
        setup(with: coinPrice)
        backgroundImageView.image = image
        titleLabel.text = title
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
            priceView.topAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height * 0.15
        titleLabel.layoutIfNeeded()
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = titleLabel.frame.height * 0.2
        backgroundImageView.clipsToBounds = true
        
        backgroundImageView.layer.masksToBounds = true
        backgroundImageView.layoutIfNeeded()
        backgroundImageView.layer.cornerRadius = backgroundImageView.frame.height * 0.15

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func viewClicked() {
        print("Viewclicked")
    }
}

