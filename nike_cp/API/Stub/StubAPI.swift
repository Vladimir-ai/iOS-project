//
//  StubAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 23.12.2023.
//

import Foundation

class StubAPI {
    let loadingDurationSec = 0.5

    func waitBeforeReturn() async -> Void {
        do {
            try await Task.sleep(for: .seconds(loadingDurationSec))
        }
        catch {
            assert(false)
        }
    }
}
