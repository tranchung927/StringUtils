//
//  AttributedStringBuilder.swift
//  
//
//  Created by ChungTV on 20/12/2022.
//

import UIKit

public final class AttributedStringBuilder {
    
    private var listAttString: [(data: Any?, attrs: [NSAttributedString.Key : Any])] = []
    private var lastStartAttIndex: Int = 0
    
    public init() {}
    
    @discardableResult
    public func append(_ text: String?) -> AttributedStringBuilder {
        lastStartAttIndex = listAttString.count
        listAttString.append((text, [:]))
        return self
    }
    
    @discardableResult
    public func append(_ image: UIImage?) -> AttributedStringBuilder {
        lastStartAttIndex = listAttString.count
        listAttString.append((image, [:]))
        return self
    }
    
    @discardableResult
    public func with(_ color: UIColor) -> AttributedStringBuilder {
        listAttString[lastStartAttIndex].attrs[
            NSAttributedString.Key.foregroundColor
        ] = color
        return self
    }
    
    @discardableResult
    public func with(_ font: UIFont) -> AttributedStringBuilder {
        listAttString[lastStartAttIndex].attrs[
            NSAttributedString.Key.font
        ] = font
        return self
    }
    
    @discardableResult
    public func with(_ underLineStyle: NSUnderlineStyle) -> AttributedStringBuilder {
        listAttString[lastStartAttIndex].attrs[
            NSAttributedString.Key.underlineStyle
        ] = underLineStyle.rawValue
        return self
    }
    
    @discardableResult
    public func with(_ paragraphStyle: NSParagraphStyle) -> AttributedStringBuilder {
        listAttString[lastStartAttIndex].attrs[
            NSAttributedString.Key.paragraphStyle
        ] = paragraphStyle
        return self
    }
    
    @discardableResult
    public func with(_ link: URL) -> AttributedStringBuilder {
        listAttString[lastStartAttIndex].attrs[
            NSAttributedString.Key.link
        ] = link
        return self
    }
    
    @discardableResult
    public func with(strikethrough color: UIColor, height: CGFloat = 1.0) -> AttributedStringBuilder {
        listAttString[lastStartAttIndex].attrs[
            NSAttributedString.Key.strikethroughColor
        ] = color
        listAttString[lastStartAttIndex].attrs[
            NSAttributedString.Key.strikethroughStyle
        ] = height
        return self
    }
    
    public func with(_ baselineOffset: CGFloat) -> AttributedStringBuilder {
        listAttString[lastStartAttIndex].attrs[
            NSAttributedString.Key.baselineOffset
        ] = baselineOffset
        return self
    }
    public func with(strokeColor: UIColor, strokeWidth: CGFloat) -> AttributedStringBuilder {
        listAttString[lastStartAttIndex].attrs[
            NSAttributedString.Key.strokeColor
        ] = strokeColor
        listAttString[lastStartAttIndex].attrs[
            NSAttributedString.Key.strokeWidth
        ] = strokeWidth
        
        return self
    }
    
    public func attributedString() -> NSMutableAttributedString {
        let result = NSMutableAttributedString()
        for attString in listAttString {
            if let string = attString.data as? String, string.count > 0 {
                result.append(NSAttributedString(string: string, attributes: attString.attrs))
            } else if let image = attString.data as? UIImage {
                let imageAttachment = NSTextAttachment()
                imageAttachment.image = image
                let ratio: CGFloat = image.size.width / image.size.height
                let attachmentBounds = imageAttachment.bounds
                let heightRatio: CGFloat = 20
                imageAttachment.bounds = CGRect(x: attachmentBounds.origin.x,
                                                y: -5,
                                                width: ratio * heightRatio,
                                                height: heightRatio)
                result.append(NSAttributedString(attachment: imageAttachment))
            }
        }
        return result
    }
}
