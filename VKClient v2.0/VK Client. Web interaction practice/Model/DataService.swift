//
//  DataService.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 29.06.2021.
//

import Foundation
import WebKit




protocol VKApiService {
    var schema: String {get}
    var host: String {get}
    var path: String {get}
}


class VKApiServiceParams: VKApiService {
    let schema: String
    let host: String
    let path: String
    let methodToPath: String
    
    
    init(schema: String, host: String, path: String, methodToPath: String) {
        self.schema = schema
        self.host = host
        self.path = path
        self.methodToPath = methodToPath
    }
}


