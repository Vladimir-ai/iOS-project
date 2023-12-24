//
//  StubAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 23.12.2023.
//

import Foundation

class StubAPI {
    let userId: UInt64 = 0
    let loadingDurationSec = 3.0

    func waitBeforeReturn() async -> Void {
        do {
            try await Task.sleep(for: .seconds(loadingDurationSec))
        }
        catch {
            assert(false)
        }
    }
}
