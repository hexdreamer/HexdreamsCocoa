//
//  File.swift
//  
//
//  Created by Zach Young on 6/28/21.
//

import XCTest
import hexdreamsCocoa
import Foundation

class CGAffineTransformExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTransformToFit() {
        func assert() {
            let got = CGAffineTransform.transformTo(fit: innerRect, in: outerRect)
            XCTAssertEqual(want, got)
        }

        var innerRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        var outerRect = CGRect(x: 0, y: 0, width: 2, height: 2)
        var want = CGAffineTransform(scaleX: 2, y: 2)
        assert()

        innerRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        outerRect = CGRect(x: 1, y: 1, width: 1, height: 1)
        want = CGAffineTransform(translationX: 1, y: 1)
        assert()

        innerRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        outerRect = CGRect(x: 1, y: 1, width: 2, height: 2)
        want = CGAffineTransform(translationX: 1, y: 1)
            .scaledBy(x: 2, y: 2)
        assert()
    }

    func testToTable() {
        func assert() {
            XCTAssertEqual(want, got, "Got \n\(got), but want \n\(want)")
        }

        // Note the "extra" newline in the multi-line string literals

        // Identity
        var want = """
┌ 1 0  0 ┐
│ 0 1  0 │
└ 0 0  1 ┘

"""
        var t = CGAffineTransform.identity
        var got = t.toTable()
        assert()

        // Scale by 2x
        want = """
┌ 2 0  0 ┐
│ 0 2  0 │
└ 0 0  1 ┘

"""
        t = CGAffineTransform(scaleX: 2, y: 2)
        got = t.toTable()
        assert()

        // Scale, translate, rotate
        want = """
┌  1.156  0.936  0 ┐
│ -1.872 0.5779  0 │
└   19.8     11  1 ┘

"""
        t = CGAffineTransform(scaleX: 2.2, y: 1.1)
            .translatedBy(x: 9, y: 10)
            .rotated(by: 45)
        got = t.toTable()
        assert()

        // with indent
        want = """
>>> ┌ 2 0  0 ┐
>>> │ 0 2  0 │
>>> └ 0 0  1 ┘

"""
        got = CGAffineTransform(scaleX: 2, y: 2)
            .toTable(indent: ">>> ")
        assert()
    }
}
