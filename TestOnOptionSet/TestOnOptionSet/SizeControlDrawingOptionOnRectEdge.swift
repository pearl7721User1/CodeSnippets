//
//  SizeControlOnEdgeOption.swift
//  TestOnOptionSet
//
//  Created by SeoGiwon on 20/04/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

struct SizeControlDrawingOptionOnRectEdge: OptionSet {
    let rawValue: Int
    
    static let left    = SizeControlDrawingOptionOnRectEdge(rawValue: 1 << 0)
    static let top  = SizeControlDrawingOptionOnRectEdge(rawValue: 1 << 1)
    static let right   = SizeControlDrawingOptionOnRectEdge(rawValue: 1 << 2)
    static let bottom   = SizeControlDrawingOptionOnRectEdge(rawValue: 1 << 3)
    
//    static let express: ShippingOptions = [.nextDay, .secondDay]
//    static let all: ShippingOptions = [.express, .priority, .standard]
}
