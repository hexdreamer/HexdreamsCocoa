//
//  File.swift
//  
//
//  Created by Zach Young on 6/23/21.
//

import Foundation
import CoreGraphics.CGAffineTransform

extension CGAffineTransform {
    /// Return a transform that fits innerRect in outerRect by centering and scaling
    static public func transformTo(fit innerRect:CGRect, in outerRect:CGRect) -> CGAffineTransform {
        let fittedRect = innerRect.fit(rect: outerRect)
        let scale = fittedRect.size.width/innerRect.size.width
        let offset = CGPoint(x:fittedRect.minX, y:fittedRect.minY)
        let t = CGAffineTransform.identity
            .concatenating(CGAffineTransform(scaleX: scale, y: scale))
            .concatenating(CGAffineTransform(translationX: offset.x, y: offset.y))
        return t
    }

    public func toTable(indent:String = "") -> String {
        let t = self
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.maximumSignificantDigits = 4

        let values = [t.a, t.b, t.c, t.d, t.tx, t.ty]
            .map { fmt.string(for: $0)! }
        let maxWidth = values
            .max { (a, b) in a.count < b.count }
        let paddedValues = values
            .map { $0.hxpad(width: maxWidth!.count)}

        let a,b,c,d,tx,ty: String
         a = paddedValues[0]
         b = paddedValues[1]
         c = paddedValues[2]
         d = paddedValues[3]
        tx = paddedValues[4]
        ty = paddedValues[5]

        let row1,row2,row3: String
        row1 = indent + "┌ " +  a + " " +  b + "  0 ┐\n"
        row2 = indent + "│ " +  c + " " +  d + "  0 │\n"
        row3 = indent + "└ " + tx + " " + ty + "  1 ┘\n"

        return row1 + row2 + row3
    }
}
