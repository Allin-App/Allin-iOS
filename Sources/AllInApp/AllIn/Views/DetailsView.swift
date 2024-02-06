import SwiftUI
import Model

struct DetailsView: View {
    
    @Binding var isModalPresented: Bool
    @Binding var isModalParticipated: Bool
    @State var progressValue: Float = 0.2
    var id: String
    @StateObject private var viewModel: DetailsViewModel
    
    var isFinished: Bool {
        viewModel.betDetail?.finalAnswer == nil ? false : true
    }
    
    var StatusValues: (String, Color) {
        if let betType = viewModel.betDetail?.bet.status {
            switch betType {
            case .inProgress:
                return ("En cours...", AllInColors.darkPurpleColor)
            case .waiting:
                return ("En attente...", AllInColors.pink100)
            case .closing:
                return ("Fin des inscriptions...", AllInColors.grey50Color)
            case .finished:
                return ("Terminé", AllInColors.grey100Color)
            case .cancelled:
                return ("Annulé", AllInColors.grey100Color)
            }
        } else {
            return ("Statut indisponible", AllInColors.pink100)
        }
    }
    
    init(isModalPresented: Binding<Bool>, isModalParticipated: Binding<Bool>, id: String) {
        self._isModalPresented = isModalPresented
        self._isModalParticipated = isModalParticipated
        self.id = id
        self._viewModel = StateObject(wrappedValue: DetailsViewModel(id: id))
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                VStack(alignment: .center) {
                    HStack{
                        Text(StatusValues.0)
                            .italic()
                            .font(.system(size: 25))
                            .fontWeight(.bold).padding(.bottom, 10)
                            .foregroundStyle(Color.black)
                            .opacity(0.4)
                        Spacer()
                        Image("closeIcon")
                            .resizable()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .onTapGesture {
                                isModalPresented = false
                            }
                    }
                    Spacer()
                }
                .padding(.horizontal, 15)
                .background(StatusValues.1)
                
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: 3) {
                            Spacer()
                            Text("proposé par")
                                .font(.system(size: 10))
                                .foregroundColor(AllInColors.grey800Color)
                            Text((viewModel.betDetail?.bet.author.username ?? "Unknown").capitalized)
                                .font(.system(size: 10))
                                .fontWeight(.semibold)
                                .foregroundColor(AllInColors.primaryTextColor)
                            
                        }
                        Text(viewModel.betDetail?.bet.theme ?? "Not loaded")
                            .font(.system(size: 15))
                            .foregroundColor(AllInColors.grey800Color)
                        Text(viewModel.betDetail?.bet.phrase ?? "Not loaded")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                        HStack {
                            HStack {
                                Spacer()
                                Text("Commence le")
                                    .font(.system(size: 15))
                                    .foregroundColor(AllInColors.grey800Color)
                            }
                            .frame(width: 105)
                            .padding(.trailing, 10)
                            TextCapsule(date: viewModel.betDetail?.bet.endRegisterDate ?? Date())
                            Spacer()
                            
                        }.padding(.bottom, 10)
                        HStack {
                            HStack {
                                Spacer()
                                Text("Prend fin le")
                                    .font(.system(size: 15))
                                    .foregroundColor(AllInColors.grey800Color)
                            }
                            .frame(width: 105)
                            .padding(.trailing, 10)
                            TextCapsule(date: viewModel.betDetail?.bet.endBetDate ?? Date())
                            Spacer()
                        }
                    }
                    .padding(.all, 15)
                    .padding(.vertical, 10)
                    .background(AllInColors.componentBackgroundColor)
                    .cornerRadius(20, corners: [.topLeft,.topRight]).padding(.bottom,0)
                    
                    if isFinished {
                        ResultBanner()
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        BetLineLoading(participations: viewModel.betDetail?.participations ?? [])
                            .padding(.vertical,15)
                        Text("Liste des participants")
                            .font(.system(size: 18))
                            .foregroundStyle(AllInColors.grey100Color)
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                        ScrollView(showsIndicators: false) {
                            ForEach(viewModel.betDetail?.participations ?? []) { (participation: Participation) in
                                ParticiationCell(participation: participation).padding(.horizontal, 10)
                            }
                        }
                        .padding(.bottom, geometry.safeAreaInsets.bottom + 28)
                        
                        Spacer()
                    }
                    .padding([.bottom,.trailing,.leading], 15)
                    .background(AllInColors.underComponentBackgroundColor)
                    .border(width: 1, edges: [.top], color: AllInColors.delimiterGrey)
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: (geometry.size.height + geometry.safeAreaInsets.bottom) - 50)
                .background(AllInColors.componentBackgroundColor)
                .cornerRadius(15, corners: [.topLeft, .topRight])
                
                ParticipateButton(isOpen: $isModalPresented, isParticapatedOpen: $isModalParticipated, bet: viewModel.betDetail?.bet)
                    .padding(.bottom, geometry.safeAreaInsets.bottom + 5)
                    .padding(.horizontal, 10)
            }
            .sheet(isPresented: $isModalParticipated) {
                ParticipationModal(answer: $viewModel.answer, mise: $viewModel.mise, description: viewModel.betDetail?.bet.phrase ?? "Not loaded", participationAddedCallback: {
                    viewModel.addParticipate()
                    isModalParticipated.toggle()
                })
                .presentationDetents([.fraction(0.55)])
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
