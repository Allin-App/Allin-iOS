import SwiftUI

struct DetailsView: View {
    @Binding var isModalPresented: Bool
    @State var isModalParticipated: Bool = false
    @State var progressValue: Float = 0.2
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                VStack(alignment: .center) {
                    HStack{
                        Text("Terminé!").font(.system(size: 25)).fontWeight(.bold).padding(.bottom, 10).foregroundStyle(AllInColors.blackTitleColor).opacity(0.7)
                        Spacer()
                        Image("CloseiconRounded")
                            .resizable()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .onTapGesture {
                                isModalPresented = false
                            }
                    }
                    Spacer()
                }
                .padding(.horizontal, 15)
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
                            TextCapsule()
                            TextCapsule()
                            Spacer()
                            
                        }.padding(.bottom, 10)
                        HStack{
                            Text("Fini le").frame(maxWidth: 100).font(.system(size: 15)).foregroundColor(AllInColors.grey800Color)
                            TextCapsule()
                            TextCapsule()
                            Spacer()
                            
                        }
                    }
                    .frame(width: .infinity)
                    .padding(.all,15).padding(.vertical, 10)
                    .background(AllInColors.whiteColor).cornerRadius(20, corners: [.topLeft,.topRight]).padding(.bottom,0)
                    ResultBanner()
                    VStack(alignment: .leading,spacing: 15){
                        BetLineLoading(value: $progressValue).padding(.vertical, 15)
                        Spacer()
                        
                        
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight : .infinity)
                    .padding([.bottom,.trailing,.leading],15)
                    .background(AllInColors.underComponentBackgroundColor)
                    .border(width: 1, edges: [.top], color: AllInColors.delimiterGrey)
                    Spacer()
                
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: geometry.size.height*0.98)
                .background(Color.white)
                .cornerRadius(15)
                
                ParticipateButton(isOpen: $isModalParticipated).padding(10)
            
                
            }
            .sheet(isPresented: $isModalParticipated) {
                ParticipationModal().presentationDetents([.fraction(0.55)])
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
