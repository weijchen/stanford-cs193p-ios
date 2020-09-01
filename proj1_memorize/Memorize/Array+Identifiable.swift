//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Nicole Chen on 2020/8/29.
//  Copyright © 2020 陳威政. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
