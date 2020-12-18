//
//  PaletteList.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/13/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

struct PaletteList: View {
    @ObservedObject var viewModel: PaletteListViewmodel
    
    @State var paletteList: [PaletteViewModel] = []
    @State var showPaletteDetail = false
    @State var showNewPaletteAlert = false
    @State var newPaletteName = ""
    @State var selectedPalette: PaletteViewModel?
    
    //    List {
    //        ForEach(viewModel.palettes) { palette in
    //            NavigationLink (destination: PaletteContainer(viewModel: palette)) {
    //                Button(action:  {
    //                    self.showPaletteDetail.toggle()
    //                    self.selectedPalette = palette
    //                }, label: {
    //                    PaletteListItem(palette: palette)
    //                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    //                })
    //            }
    //        }
    //        .onDelete(perform: delete)
    //    }
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                HStack {
                    Text("Feed")
                        .font(.title)
                        .padding()
                    Spacer()
                    Button(action: {
                        self.showNewPaletteAlert.toggle()
                    }
                    , label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.black)
                    })
                }
                FeedHeader()
                HStack {
                    Text("My palettes")
                        .font(.headline)
                        .padding()
                    Spacer()
                }
                
                ForEach(viewModel.palettes) { palette in
                    Button(action: {
                        selectedPalette = palette
                        showPaletteDetail.toggle()
                    }, label: {
                        PaletteListItem(palette: palette)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    })
                }
            }
            .blur(radius: self.showNewPaletteAlert ? 4 : 0)
            .disabled(self.showNewPaletteAlert)
            .animation(.linear)
            
            PaintChipsAlert(viewModel: self.viewModel, show: $showNewPaletteAlert, paletteName: newPaletteName)
                .opacity(self.showNewPaletteAlert ? 1 : 0)
                .animation(.easeInOut)
        }
        .sheet(isPresented: $showPaletteDetail, content: {
            if (selectedPalette != nil) {
                PaletteContainer(viewModel: selectedPalette!)
            } else {
                Text("nil")
            }
        })
    }
    
    //    var body: some View {
    //        ZStack(alignment: .center) {
    //            NavigationView {
    //                List {
    //                    ForEach(viewModel.palettes) { palette in
    //                        NavigationLink (destination: PaletteContainer(viewModel: palette)) {
    //                            Button(action:  {
    //                                self.showPaletteDetail.toggle()
    //                                self.selectedPalette = palette
    //                            }, label: {
    //                                PaletteListItem(palette: palette)
    //                                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    //                            })
    //                        }
    //                    }
    //                    .onDelete(perform: delete)
    //                }
    //                .navigationBarItems(trailing: Button(action: {
    //                    self.showNewPaletteAlert.toggle()
    //                }
    //                , label: {
    //                    Image(systemName: "plus")
    //                        .resizable()
    //                        .frame(width: 30, height: 30)
    //                        .padding(.top)
    //                        .padding(.bottom)
    //                        .foregroundColor(.black)
    //                })
    //                )
    //            }.blur(radius: self.showNewPaletteAlert ? 4 : 0)
    //            .disabled(self.showNewPaletteAlert)
    //            .animation(.linear)
    //
    //            PaintChipsAlert(viewModel: self.viewModel, show: $showNewPaletteAlert, paletteName: newPaletteName)
    //                .opacity(self.showNewPaletteAlert ? 1 : 0)
    //                .animation(.easeInOut)
    //        }
    //    }
    
    private func delete(with indexSet: IndexSet) {
        if (indexSet.count > 0) {
            viewModel.deletePalette(atIndex: indexSet.first!)
        }
    }
}

struct PaletteList_Previews: PreviewProvider {
    static var previews: some View {
        PaletteList(viewModel: PaletteListViewmodel())
    }
}


struct GADBannerViewController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)
        let viewController = UIViewController()
        
        view.adUnitID = "ca-app-pub-9754668352022980/5795456854"
        view.rootViewController = viewController
        
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        
        let request = GADRequest()
        view.load(request)
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    func reload() {
        print("reload!")
    }
}

// real id: ca-app-pub-9754668352022980/5795456854
// TEST id: ca-app-pub-3940256099942544/2934735716
