//
//  button.swift
//  weather-app
//
//  Created by Alex King on R 4/08/20.
//

import Foundation
import SwiftUI

struct ConfigureLocationButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text( title )
            .frame( width: 280, height: 50 )
            .background( backgroundColor )
            .foregroundColor( textColor )
            .font( .system( size: 20,
                            design: .default ) )
            .cornerRadius( 10 )    }
}
