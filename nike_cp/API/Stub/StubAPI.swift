//
//  StubAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 23.12.2023.
//

import Foundation

class StubAPI {
    let loadingDurationSec = 1

    func waitBeforeReturn() async -> Void {
        do {
            try await Task.sleep(for: .seconds(loadingDurationSec))
        }
        // TODO: Is it possible on URL Requests?
        catch is CancellationError {
            print("Cancelled")
        }
        catch {
            assert(false)
        }
    }
}
