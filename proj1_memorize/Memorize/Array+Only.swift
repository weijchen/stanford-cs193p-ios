//
//  Array+Only.swift
//  Memorize
//
//  Created by Nicole Chen on 2020/8/29.
//  Copyright © 2020 陳威政. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
