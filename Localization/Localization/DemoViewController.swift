//
//  DemoViewController.swift
//  Localization
//
//  Created by Cameron Eubank on 6/7/22.
//

import UIKit

final class DemoViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var standardLocalizationLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var parameterizedLocalizationLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var pluralizedParameterizedLocalizationLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var numberOfWorldsSlider: UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(sliderDidChangeValue(_:)), for: .valueChanged)
        slider.value = Float(numberOfWorlds)
        slider.minimumValue = .zero
        slider.maximumValue = 10
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    // MARK: - Initialization
    
    private let name: String
    private var numberOfWorlds: Int
    
    init(name: String, numberOfWorlds: Int) {
        self.name = name
        self.numberOfWorlds = numberOfWorlds
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController Lifecycle Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        constrainSubviews()
        configureSubviews()
    }
    
    // MARK: - Private View Utility
    
    private func addSubviews() {
        [standardLocalizationLabel,
         parameterizedLocalizationLabel,
         pluralizedParameterizedLocalizationLabel].forEach { labelsStackView.addArrangedSubview($0) }
        [labelsStackView, numberOfWorldsSlider].forEach { view.addSubview($0) }
    }
    
    private func constrainSubviews() {
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            numberOfWorldsSlider.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 24.0),
            numberOfWorldsSlider.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            numberOfWorldsSlider.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            numberOfWorldsSlider.bottomAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    @objc
    private func configureSubviews() {
        // Standard Localization.
        standardLocalizationLabel.text = NSLocalizedString("demo.standardLocalization.title",
                                                           comment: "Hello World!")
        
        // Localization with parameters. No pluralization concerns.
        parameterizedLocalizationLabel.text = String(format: NSLocalizedString("demo.parameterizeLocalization.title",
                                                                               comment: "Hello %@! Welcome to the world!"), name)
        
        // Localization with parameters. With pluralization concerns.
        pluralizedParameterizedLocalizationLabel.text = String(format: NSLocalizedString("demo.pluralizedParameterizeLocalization.title",
                                                                                         comment: "Hello %@! There are %d worlds!"), name, numberOfWorlds)
    }
    
    // MARK: - Target Action
    
    @objc private func sliderDidChangeValue(_ sender: UISlider) {
        numberOfWorlds = Int(sender.value)
        configureSubviews()
    }
}
