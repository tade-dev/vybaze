import SwiftUI

struct HomeView: View {
    
    var colorModel: ColorModel = ColorModel()
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @State var showPremiumSheet: Bool = false
    @State var animate: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    LatestFeedbackW(colorModel: colorModel, progress: 0.3, isHomeView: true)
                        .opacity(animate ? 1 : 0)
                        .offset(y: animate ? 0 : -40)
                        .animation(.spring(response: 0.5, dampingFraction: 0.6), value: animate)

                    Text("Recent Feedbacks")
                        .font(.appHeadline)
                        .fontWeight(.bold)
                        .foregroundStyle(colorModel.textColor)

                    ForEach(0..<3) { index in
                        FeedbackTile(isNavigationLinkActive: $dashboardViewModel.isNavigationLinkActive, details: "Active", colorModel: colorModel)
                            .opacity(animate ? 1 : 0)
                            .offset(x: animate ? 0 : 100)
                            .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(Double(index) * 0.1), value: animate)
                    }

                    Button(action: {
                        showPremiumSheet.toggle()
                    }, label: {
                        HStack {
                            Text("🔥")
                                .font(.title)
                            VStack(alignment: .leading) {
                                Text("Unlock full potential with Vybaze Premium")
                                    .font(.appHeadline)
                                    .multilineTextAlignment(.leading)
                                    .foregroundStyle(colorModel.textColor)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                        )
                    })
                    .scaleEffect(animate ? 1 : 0.8)
                    .opacity(animate ? 1 : 0)
                    .animation(.interpolatingSpring(stiffness: 100, damping: 10).delay(0.4), value: animate)
                }
                .padding()
            }
            .navigationTitle("Hello, Tade!")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $showPremiumSheet) {
                VybazePremiumView()
            }
            .onAppear {
                animate = true
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(DashboardViewModel())
}
