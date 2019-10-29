//
//  NetworkAPI.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 26.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

import Moya

enum NetworkAPI {
    case uploadDevice(device: Device)
}

extension NetworkAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .uploadDevice:
            //TODO: - URL
            return URL(fileURLWithPath: "")
        }
    }
    
    var path: String {
        switch self {
        case .uploadDevice:
            return "path"
        }
    }
    
    var method: Method {
        switch self {
        case .uploadDevice:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .uploadDevice(let device):
            return .requestCustomJSONEncodable(device, encoder: JSONEncoder.init())
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
