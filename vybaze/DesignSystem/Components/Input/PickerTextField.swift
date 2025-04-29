//
//  PickerTextField.swift
//  vybaze
//
//  Created by BSTAR on 23/04/2025.
//

import SwiftUI

struct PickerTextField: View {
    @Binding var selected: String
    let options: [String]
    let label: String

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {
                    selected = option
                }
            }
        } label: {
            HStack {
                Text(selected.isEmpty ? label : selected)
                    .foregroundColor(selected.isEmpty ? .gray : .primary)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
        }
    }
}
