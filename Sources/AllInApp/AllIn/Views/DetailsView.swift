import SwiftUI

struct DetailsView: View {
    @Binding var isModalPresented: Bool
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                VStack(alignment: .trailing) {
                    HStack{
                        Spacer()
                        Image("CloseiconRounded")
                            .resizable()
                            .padding(8)
                            .frame(maxWidth: 40, maxHeight: 40)
                            .onTapGesture {
                                isModalPresented = false
                            }
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green)
                .transition(.slideInFromBottom(yOffset:0))
                VStack(spacing: 0) {
                    VStack(alignment: .leading,spacing: 5){
                        HStack{
                            Spacer()
                            Text("proposé par Lucas").font(.system(size: 10)).foregroundColor(AllInColors.grey800Color)
                            
                        }
                        Text("Etudes").font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                        Text("Emre va réussir son TP de CI/CD mercredi?").font(.system(size: 20)).fontWeight(.bold).padding(.bottom, 10)
                        HStack{
                            Text("Commence le").frame(maxWidth: 100).font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                            TextCapsule(date: Date())
                            TextCapsule(date: Date())
                            Spacer()
                            
                        }.padding(.bottom, 10)
                        HStack{
                            Text("Fini le").frame(maxWidth: 100).font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                            TextCapsule(date: Date())
                            TextCapsule(date: Date())
                            Spacer()
                            
                        }
                    }
                    .frame(width: .infinity)
                    .padding(.all,15).padding(.vertical, 10)
                    .background(AllInColors.componentBackgroundColor).cornerRadius(20, corners: [.topLeft,.topRight]).padding(.bottom,0)
                    ResultBanner()
                    VStack(alignment: .leading,spacing: 2){
                        
                        
                        
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight : .infinity)
                    .padding([.bottom,.trailing,.leading],8)
                    .background(AllInColors.underComponentBackgroundColor)
                    .border(width: 1, edges: [.top], color: AllInColors.delimiterGrey)
                    Spacer()
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: geometry.size.height*0.98)
                .background(Color.white)
                .cornerRadius(15)
                ParticipateButton().padding(10)
            }
            .transition(.slideInFromBottom(yOffset: 800))
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
