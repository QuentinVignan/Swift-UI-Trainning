//
//  ApiView.swift
//  Testing App
//
//  Created by Quentin Vignan on 18/06/2021.
//

import Foundation
import SwiftUI

struct apiView: View {
    @StateObject var api = Api()
    var body: some View {
        Button("Call API") {
            api.getUser { result in
                print(result)
            }
        }
    }
}
