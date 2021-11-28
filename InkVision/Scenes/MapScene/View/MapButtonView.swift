//
//  MapButtonView.swift
//  InkVision
//
//  Created by Bruno Thuma on 28/11/21.
//  Credits to Vinicius Couto

import UIKit

final class MapButtonView: UIButton {
    // MARK: - Private variables

    private let iconName: String
    private var action: () -> Void

    // MARK: - Initialization

    init(iconName: String, action: @escaping (() -> Void)) {
        self.iconName = iconName
        self.action = action

        super.init(frame: .zero)

        setupView()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupView() {
        let font = UIFont.systemFont(ofSize: LayoutMetrics.iconFontSize, weight: LayoutMetrics.iconFontWeight)
        let configuration = UIImage.SymbolConfiguration(font: font)

        // TODO: Fix color
        let icon = UIImage(systemName: iconName, withConfiguration: configuration)?
            .imageWithColor(color: UIColor.white)

        // TODO: Fix color
        backgroundColor = UIColor.systemGray4
        setImage(icon, for: .normal)
        layer.cornerRadius = LayoutMetrics.backgroundRectCornerRadius

        addTarget(self, action: #selector(tap), for: .touchUpInside)
    }

    private func setupConstraints() {
        snp.makeConstraints { make in
            make.size.equalTo(LayoutMetrics.backgroundRectSize)
        }
    }

    @objc private func tap() {
        action()
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        private static let rectSize: Int = 45

        static let backgroundRectSize = CGSize(width: rectSize, height: rectSize)
        static let backgroundRectCornerRadius: CGFloat = 8
        static let iconFontSize: CGFloat = 20
        static let iconFontWeight: UIFont.Weight = .bold
    }
}
