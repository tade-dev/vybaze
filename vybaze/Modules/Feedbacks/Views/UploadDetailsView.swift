//
//  UploadDetailsView.swift
//  vybaze
//
//  Created by BSTAR on 20/05/2025.
//

import SwiftUI

struct UploadDetailsView: View {
    
    var colorModel: ColorModel = ColorModel()
    @EnvironmentObject var feedbackViewModel: FeedbackViewModel
    
    var body: some View {
        

        
    }
}

#Preview {
    UploadDetailsView()
        .environmentObject(FeedbackViewModel())
}
