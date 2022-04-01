//
//  NMapAPICaller.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/20.
//

import Foundation
import NMapsMap

class NMapAPICaller {
    static let shared = NMapAPICaller()
    
    init(){
//        NMFAuthManager.shared().delegate = self
    }
    
    func getMapData (){
        
    }
}

//extension NMapAPICaller : NMFAuthManagerDelegate{
//    func authorized(_ state: NMFAuthState, error: Error?) {
//        /**
//         Naver map authorize error
//         401
//         - 잘못된 클라이언트 ID를 지정함
//         - 잘못된 클라이언트 유형을 사용함
//         - 콘솔에서 앱 Bundle Identifier를 잘못 등록함
//         429
//         - 콘솔에서 Maps 서비스를 선택하지 않음
//         - 사용 한도가 초과됨
//         800
//         - 클라이언트 ID를 지정하지 않음
//         */
//        if let error = error {
//            debugPrint(state, error)
//        }
//    }
//
//    func isEqual(_ object: Any?) -> Bool {
//        <#code#>
//    }
//
//    var hash: Int {
//        <#code#>
//    }
//
//    var superclass: AnyClass? {
//        <#code#>
//    }
//
//    func `self`() -> Self {
//        <#code#>
//    }
//
//    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//
//    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//
//    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//
//    func isProxy() -> Bool {
//        <#code#>
//    }
//
//    func isKind(of aClass: AnyClass) -> Bool {
//        <#code#>
//    }
//
//    func isMember(of aClass: AnyClass) -> Bool {
//        <#code#>
//    }
//
//    func conforms(to aProtocol: Protocol) -> Bool {
//        <#code#>
//    }
//
//    func responds(to aSelector: Selector!) -> Bool {
//        <#code#>
//    }
//
//    var description: String {
//        <#code#>
//    }
//
//
//}
