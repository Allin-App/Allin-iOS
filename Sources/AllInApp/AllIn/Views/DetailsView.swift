import SwiftUI
import Model

struct DetailsView: View {
    
    @Binding var isModalPresented: Bool
    @Binding var isModalParticipated: Bool
    @StateObject private var viewModel: DetailsViewModel
    
    var isFinished: Bool {
        viewModel.betDetail?.wonParticipation == nil ? false : true
    }
    
    var StatusValues: (String, Color) {
        if let betType = viewModel.betDetail?.bet.status {
            switch betType {
            case .inProgress:
                return (String(localized: "bet_status_in_progress"), AllInColors.darkPurpleColor)
            case .waiting, .closing:
                return (String(localized: "bet_status_waiting"), AllInColors.pink100)
            case .finished:
                return (String(localized: "bet_status_finished"), AllInColors.grey100Color)
            case .cancelled:
                return (String(localized: "bet_status_cancelled"), AllInColors.grey100Color)
            }
        } else {
            return (String(localized: "bet_status_unavailable"), AllInColors.pink100)
        }
    }
    
    init(isModalPresented: Binding<Bool>, isModalParticipated: Binding<Bool>, id: String) {
        self._isModalPresented = isModalPresented
        self._isModalParticipated = isModalParticipated
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
                if viewModel.betDetail != nil{
                    ScrollView {
                        VStack(alignment: .leading, spacing: 5) {
                            HStack(spacing: 3) {
                                Spacer()
                                Text("bet_proposed_by_format")
                                    .font(.system(size: 10))
                                    .foregroundColor(AllInColors.grey800Color)
                                Text((viewModel.betDetail?.bet.author ?? "Unknown").capitalized)
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
                                    Text("bet_starting")
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
                                    Text("bet_ends")
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
                        .padding(.top, 6)
                        .border(width: 1, edges: [.bottom], color: AllInColors.delimiterGrey)
                        .background(AllInColors.componentBackgroundColor)
                        .cornerRadius(20, corners: [.topLeft,.topRight])
                        
                        if isFinished {
                            ResultBanner(finalAnswer: (viewModel.betDetail?.wonParticipation)!, odds: (viewModel.betDetail?.odds)!)
                        }
                        VStack(alignment: .leading, spacing: 0) {
                            if let bet = viewModel.betDetail{
                                BetLineLoading(bet: bet).padding(.vertical, 20)
                                
                            }
                            Text("bet_status_participants_list")
                                .font(.system(size: 18))
                                .foregroundStyle(AllInColors.grey100Color)
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                            
                            ForEach(viewModel.betDetail?.participations ?? []) { participation in
                                UserInfo(username: participation.username, picture: nil , value: participation.stake).padding(.horizontal, 10)
                            }
                            .padding(.bottom)
                            
                            Spacer()
                        }
                        .padding([.trailing,.leading], 15)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: (geometry.size.height + geometry.safeAreaInsets.bottom) - 50)
                    .background(AllInColors.underComponentBackgroundColor)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                }
                else{
                    ScrollView {
                        HStack(alignment: .center){
                            Spacer()
                            Image(systemName: "exclamationmark.triangle.fill").font(.system(size: 45))
                            VStack(alignment:.leading){
                                Text("error_title").font(.system(size: 10))
                                Text("error_message").font(.system(size: 10))
                            }
                            Spacer()
                        }.opacity(0.6)
                            .padding(.vertical, 20)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: (geometry.size.height + geometry.safeAreaInsets.bottom) - 50)
                    .background(AllInColors.underComponentBackgroundColor)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                }
                
                ParticipateButton(isOpen: $isModalPresented, isParticapatedOpen: $isModalParticipated, bet: viewModel.betDetail?.bet)
                    .padding(.bottom, geometry.safeAreaInsets.bottom + 5)
                    .padding(.horizontal, 10)
            }
            .sheet(isPresented: $isModalParticipated) {
                ParticipationModal(selectedAnswer: $viewModel.selectedAnswer, mise: $viewModel.mise, phrase: viewModel.betDetail?.bet.phrase ?? "", answers: viewModel.betDetail?.answers ?? [], participationAddedCallback: {
                    viewModel.addParticipate()
                    isModalParticipated.toggle()
                },
                                   checkAndSetError: viewModel.checkAndSetError)
                .presentationDetents([.fraction(0.55)])
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
