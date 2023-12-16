//
//  PageModel.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/16.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample", imageUrl: "introA", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Intro2", description: "Intro2", imageUrl: "introA", tag: 0),
        Page(name: "Intro2", description: "Intro2", imageUrl: "introB", tag: 1),
        Page(name: "Intro2", description: "Intro2", imageUrl: "introC", tag: 2),
    ]
}
