//
//  WelcomeViewController.swift
//  Mastodon
//
//  Created by 高原 on 2021/2/20.
//

import UIKit

final class WelcomeViewController: UIViewController {
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: Asset.welcomeLogo.image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let sloganLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: UIFont.boldSystemFont(ofSize: 34))
        label.textColor = Asset.Colors.Label.black.color
        label.text = L10n.Common.Label.slogan
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let signUpButton: PrimaryActionButton = {
        let button = PrimaryActionButton(type: .system)
        button.setTitle(L10n.Button.signUp, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(L10n.Button.signIn, for: .normal)
        button.setTitleColor(Asset.Colors.lightBrandBlue.color, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        button.setInsets(forContentPadding: UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0), imageTitlePadding: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

extension WelcomeViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Asset.Colors.Background.signUpSystemBackground.color
        
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 35),
            view.readableContentGuide.trailingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 35),
            logoImageView.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor, constant: 46),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 65.4/265.1),
        ])
        
        view.addSubview(sloganLabel)
        NSLayoutConstraint.activate([
            sloganLabel.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 16),
            view.readableContentGuide.trailingAnchor.constraint(equalTo: sloganLabel.trailingAnchor, constant: 16),
            sloganLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 168),
        ])
        
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 12),
            view.readableContentGuide.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor, constant: 12),
            view.readableContentGuide.bottomAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 11),
            
            signUpButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor, constant: 12),
            view.readableContentGuide.trailingAnchor.constraint(equalTo: signUpButton.trailingAnchor, constant: 12),
            signInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 5)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
