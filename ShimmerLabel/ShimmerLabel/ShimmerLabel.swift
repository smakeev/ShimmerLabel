//
//  ShimmerLabel.swift
//  ShimmerLabel
//
//  Created by Sergey Makeev on 22.03.2020.
//  Copyright © 2020 SOME projects. All rights reserved.
//

import Foundation
import UIKit

public class ShimmerLabel: UILabel {
	
	private var topLabel: UILabel!
	private var gradientLayer: CAGradientLayer!
	
	public override var text: String? {
		get {
			super.text
		}
		
		set {
			topLabel.text = newValue
			super.text = newValue
		}
	}
	
	public override var font: UIFont! {
		get {
			super.font
		}
		
		set {
			topLabel.font = newValue
			super.font = newValue
		}
	}
	
	public override var textColor: UIColor! {
		get {
			super.textColor
		}
		
		set {
			topLabel.textColor = newValue
			super.textColor = newValue
		}
	}
	
	public override var shadowColor: UIColor? {
		get {
			super.shadowColor
		}
		
		set {
			topLabel.shadowColor = newValue
			super.shadowColor = newValue
		}
	}
	
	public override var shadowOffset: CGSize {
		get {
			super.shadowOffset
		}
		
		set {
			topLabel.shadowOffset = newValue
			super.shadowOffset = newValue
		}
	}
	
	public override var textAlignment: NSTextAlignment {
		get {
			super.textAlignment
		}
		
		set {
			topLabel.textAlignment = newValue
			super.textAlignment = newValue
		}
	}
	
	public override var lineBreakMode: NSLineBreakMode {
		get {
			super.lineBreakMode
		}
		
		set {
			topLabel.lineBreakMode = newValue
			super.lineBreakMode = newValue
		}
	}
	

	@available(iOS 6.0, *)
	public override var attributedText: NSAttributedString? {
		get {
			super.attributedText
		}
		
		set {
			topLabel.attributedText = newValue
			super.attributedText = newValue
		}
	}
	
	public override var highlightedTextColor: UIColor? {
		get {
			super.highlightedTextColor
		}
		
		set {
			topLabel.highlightedTextColor = newValue
			super.highlightedTextColor = newValue
		}
	}
	
	public override var isHighlighted: Bool {
		get {
			super.isHighlighted
		}
		
		set {
			topLabel.isHighlighted = newValue
			super.isHighlighted = newValue
		}
	}
	

	public override var isEnabled: Bool {
		get {
			super.isEnabled
		}
		
		set {
			topLabel.isEnabled = newValue
			super.isEnabled = newValue
		}
	}
		
	public override var numberOfLines: Int {
		get {
			super.numberOfLines
		}
		
		set {
			topLabel.numberOfLines = newValue
			super.numberOfLines = newValue
		}
	}
	
		
	public override var adjustsFontSizeToFitWidth: Bool {
		get {
			super.adjustsFontSizeToFitWidth
		}
		
		set {
			topLabel.adjustsFontSizeToFitWidth = newValue
			super.adjustsFontSizeToFitWidth = newValue
		}
	}
	
	public override var baselineAdjustment: UIBaselineAdjustment {
		get {
			super.baselineAdjustment
		}
		
		set {
			topLabel.baselineAdjustment = newValue
			super.baselineAdjustment = newValue
		}
	}
	
	@available(iOS 6.0, *)
	public override var minimumScaleFactor: CGFloat {
		get {
			super.minimumScaleFactor
		}
		
		set {
			topLabel.minimumScaleFactor = newValue
			super.minimumScaleFactor = newValue
		}
	}
	
	@available(iOS 9.0, *)
	public override var allowsDefaultTighteningForTruncation: Bool {
		get {
			super.allowsDefaultTighteningForTruncation
		}
		
		set {
			topLabel.allowsDefaultTighteningForTruncation = newValue
			super.allowsDefaultTighteningForTruncation = newValue
		}
	}
	
	
	@available(iOS 6.0, *)
	public override var preferredMaxLayoutWidth: CGFloat {
		get {
			super.preferredMaxLayoutWidth
		}
		
		set {
			topLabel.preferredMaxLayoutWidth = newValue
			super.preferredMaxLayoutWidth = newValue
		}
	}
	
	public override func awakeFromNib() {
		super.awakeFromNib()
		subinit()
	}
	
	public convenience init() {
		self.init(frame: .zero)
	}
	
	public override init(frame: CGRect) {
		super.init(frame: frame)
		subinit()
	}
	
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
		subinit()
	}
	
	private func subinit() {
		if let validTopLabel = topLabel {
			validTopLabel.removeFromSuperview()
			topLabel = nil
		}
	
		topLabel = UILabel()
		topLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(topLabel)
		topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
		topLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		topLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
		
		gradientLayer = CAGradientLayer()
		gradientLayer.colors = [UIColor.white.cgColor, UIColor.clear.cgColor, UIColor.white.cgColor]
		gradientLayer.locations = [0, 0.5, 1]
		gradientLayer.transform = CATransform3DMakeRotation(CGFloat(45 * Double.pi / 180), 0, 0, 1)
		topLabel.layer.mask = gradientLayer
		
		self.addAnimation()
	}
	
	private func addAnimation() {
		gradientLayer.removeAllAnimations()
		
		let animation = CABasicAnimation(keyPath: "transform.translation.x")
		animation.fromValue = -self.frame.size.width
		animation.toValue = self.frame.size.width
		animation.duration = 15.0
		animation.repeatCount = .infinity
		gradientLayer.add(animation, forKey: "animationKey")
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		gradientLayer.frame = topLabel.frame
		self.addAnimation()
	}
}
