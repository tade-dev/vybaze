import SwiftUI

struct WelcomeView: View {
    
    @State var colorModel: ColorModel = ColorModel()
    @State var showAuthSheet: Bool = false
    
    @State private var animateLogo = false
    @State private var animateContent = false
    @State private var animateButton = false
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Image("vybaze_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .scaleEffect(animateLogo ? 1.05 : 0.9)
                    .shadow(color: colorModel.primaryColor.opacity(0.5), radius: 12)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animateLogo)
                
                Text("Good Morning")
                    .font(.title)
                    .bold()
                    .opacity(animateContent ? 1 : 0)
                    .offset(y: animateContent ? 0 : 20)
                    .animation(.easeOut(duration: 1).delay(0.3), value: animateContent)
                
                Text("Join a vibrant space made for artists, producers & music lovers.\nCreate. Share. Get Feedback.\nEvolve your sound")
                    .font(.headline)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .opacity(animateContent ? 1 : 0)
                    .offset(y: animateContent ? 0 : 20)
                    .animation(.easeOut(duration: 1).delay(0.5), value: animateContent)
            }
            .padding(.bottom, 30)
            
            AppBtn(text: "Get Started") {
                showAuthSheet.toggle()
            }
            .scaleEffect(animateButton ? 1 : 0.95)
            .opacity(animateButton ? 1 : 0)
            .animation(.spring(response: 0.6, dampingFraction: 0.6).delay(0.9), value: animateButton)
            .padding(.bottom)
            .sheet(isPresented: $showAuthSheet) {
                AuthView()
            }
            
            Button("Learn more about Vybaze") {
                if let url = URL(string: "https://preview--vybaze-song-alchemy-hub.lovable.app/") {
                    UIApplication.shared.open(url)
                }
            }
            .font(.headline)
            .foregroundStyle(colorModel.primaryColor)
            .multilineTextAlignment(.center)
            .opacity(animateButton ? 1 : 0)
            .animation(.easeIn(duration: 1).delay(1.2), value: animateButton)
            
        }
        .padding(.horizontal, 20)
        .onAppear {
            animateLogo = true
            animateContent = true
            animateButton = true
        }
    }
}

#Preview {
    WelcomeView()
}
