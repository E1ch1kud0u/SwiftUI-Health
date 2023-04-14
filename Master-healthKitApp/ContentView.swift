//
//  ContentView.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/03/10.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            FirstView()
                .tabItem {
                    Image(systemName: "house")
                    Text("ホーム")
                }
                .tag(0)
            graphView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("グラフ")
                }
                .tag(1)
            InfoView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("情報")
                }
                .tag(2)
        }
        .navigationBarTitle(Text("タイトル"), displayMode: .inline)
        .padding()
    }
    
}

struct FirstView: View {
    @State var randomLine: String = "If you quit ONCE it becomes a habit. Never quit!!! -　Michael Jordan（マイケル・ジョーダン）　-"
    @State var randomFont: String = "Helvetica"
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(randomLine)
                .font(Font.custom(randomFont, size: 24))
                .padding()
            
            Spacer()
        }
        .onAppear {
            if let filepath = Bundle.main.path(forResource: "Fonts", ofType: "txt") {
                do {
                    let contents = try String(contentsOfFile: filepath)
                    let lines = contents.components(separatedBy: .newlines)
                    self.randomLine = lines.randomElement() ?? "No lines found"
                    
                    let fonts = ["AcademyEngravedLetPlain",
                                 "AlNile",
                                 "AlNile-Bold",
                                 "AmericanTypewriter",
                                 "AmericanTypewriter-Light",
                                 "AmericanTypewriter-Semibold",
                                 "AmericanTypewriter-Bold",
                                 "AmericanTypewriter-Condensed",
                                 "AmericanTypewriter-CondensedLight",
                                 "AmericanTypewriter-CondensedBold",
                                 "AppleColorEmoji",
                                 "AppleSDGothicNeo-Regular",
                                 "AppleSDGothicNeo-Thin",
                                 "AppleSDGothicNeo-UltraLight",
                                 "AppleSDGothicNeo-Light",
                                 "AppleSDGothicNeo-Medium",
                                 "AppleSDGothicNeo-SemiBold",
                                 "AppleSDGothicNeo-Bold",
                                 "AppleSymbols",
                                 "ArialMT",
                                 "Arial-ItalicMT",
                                 "Arial-BoldMT",
                                 "Arial-BoldItalicMT",
                                 "ArialHebrew",
                                 "ArialHebrew-Light",
                                 "ArialHebrew-Bold",
                                 "ArialRoundedMTBold",
                                 "Avenir-Book",
                                 "Avenir-Roman",
                                 "Avenir-BookOblique",
                                 "Avenir-Oblique",
                                 "Avenir-Light",
                                 "Avenir-LightOblique",
                                 "Avenir-Medium",
                                 "Avenir-MediumOblique",
                                 "Avenir-Heavy",
                                 "Avenir-HeavyOblique",
                                 "Avenir-Black",
                                 "Avenir-BlackOblique",
                                 "AvenirNext-Regular",
                                 "AvenirNext-Italic",
                                 "AvenirNext-UltraLight",
                                 "AvenirNext-UltraLightItalic",
                                 "AvenirNext-Medium",
                                 "AvenirNext-MediumItalic",
                                 "AvenirNext-DemiBold",
                                 "AvenirNext-DemiBoldItalic",
                                 "AvenirNext-Bold",
                                 "AvenirNext-BoldItalic",
                                 "AvenirNext-Heavy",
                                 "AvenirNext-HeavyItalic",
                                 "AvenirNextCondensed-Regular",
                                 "AvenirNextCondensed-Italic",
                                 "AvenirNextCondensed-UltraLight",
                                 "AvenirNextCondensed-UltraLightItalic",
                                 "AvenirNextCondensed-Medium",
                                 "AvenirNextCondensed-MediumItalic",
                                 "AvenirNextCondensed-DemiBold",
                                 "AvenirNextCondensed-DemiBoldItalic",
                                 "AvenirNextCondensed-Bold",
                                 "AvenirNextCondensed-BoldItalic",
                                 "AvenirNextCondensed-Heavy",
                                 "AvenirNextCondensed-HeavyItalic",
                                 "Baskerville",
                                 "Baskerville-Italic",
                                 "Baskerville-SemiBold",
                                 "Baskerville-SemiBoldItalic",
                                 "Baskerville-Bold",
                                 "Baskerville-BoldItalic",
                                 "BodoniSvtyTwoITCTT-Book",
                                 "BodoniSvtyTwoITCTT-BookIta",
                                 "BodoniSvtyTwoITCTT-Bold",
                                 "BodoniSvtyTwoOSITCTT-Book",
                                 "BodoniSvtyTwoOSITCTT-BookIt",
                                 "BodoniSvtyTwoOSITCTT-Bold",
                                 "BodoniSvtyTwoSCITCTT-Book",
                                 "BodoniOrnamentsITCTT",
                                 "BradleyHandITCTT-Bold",
                                 "ChalkboardSE-Regular",
                                 "ChalkboardSE-Light",
                                 "ChalkboardSE-Bold",
                                 "Chalkduster",
                                 "Charter-Roman",
                                 "Charter-Italic",
                                 "Charter-Bold",
                                 "Charter-BoldItalic",
                                 "Charter-Black",
                                 "Charter-BlackItalic",
                                 "Cochin",
                                 "Cochin-Italic",
                                 "Cochin-Bold",
                                 "Cochin-BoldItalic",
                                 "Copperplate",
                                 "Copperplate-Light",
                                 "Copperplate-Bold",
                                 "Courier",
                                 "Courier-Oblique",
                                 "Courier-Bold",
                                 "Courier-BoldOblique",
                                 "CourierNewPSMT",
                                 "CourierNewPS-ItalicMT",
                                 "CourierNewPS-BoldMT",
                                 "CourierNewPS-BoldItalicMT",
                                 "Damascus",
                                 "DamascusLight",
                                 "DamascusMedium",
                                 "DamascusSemiBold",
                                 "DamascusBold",
                                 "DevanagariSangamMN",
                                 "DevanagariSangamMN-Bold",
                                 "Didot",
                                 "Didot-Italic",
                                 "Didot-Bold",
                                 "DINAlternate-Bold",
                                 "DINCondensed-Bold",
                                 "EuphemiaUCAS",
                                 "EuphemiaUCAS-Italic",
                                 "EuphemiaUCAS-Bold",
                                 "Farah",
                                 "Futura-Medium",
                                 "Futura-MediumItalic",
                                 "Futura-Bold",
                                 "Futura-CondensedMedium",
                                 "Futura-CondensedExtraBold",
                                 "Galvji",
                                 "Galvji-Bold",
                                 "GeezaPro",
                                 "GeezaPro-Bold",
                                 "Georgia",
                                 "Georgia-Italic",
                                 "Georgia-Bold",
                                 "Georgia-BoldItalic",
                                 "GillSans",
                                 "GillSans-Italic",
                                 "GillSans-Light",
                                 "GillSans-LightItalic",
                                 "GillSans-SemiBold",
                                 "GillSans-SemiBoldItalic",
                                 "GillSans-Bold",
                                 "GillSans-BoldItalic",
                                 "GillSans-UltraBold",
                                 "Helvetica",
                                 "Helvetica-Oblique",
                                 "Helvetica-Light",
                                 "Helvetica-LightOblique",
                                 "Helvetica-Bold",
                                 "Helvetica-BoldOblique",
                                 "HelveticaNeue",
                                 "HelveticaNeue-Italic",
                                 "HelveticaNeue-UltraLight",
                                 "HelveticaNeue-UltraLightItalic",
                                 "HelveticaNeue-Thin",
                                 "HelveticaNeue-ThinItalic",
                                 "HelveticaNeue-Light",
                                 "HelveticaNeue-LightItalic",
                                 "HelveticaNeue-Medium",
                                 "HelveticaNeue-MediumItalic",
                                 "HelveticaNeue-Bold",
                                 "HelveticaNeue-BoldItalic",
                                 "HelveticaNeue-CondensedBold",
                                 "HelveticaNeue-CondensedBlack",
                                 "HiraMaruProN-W4",
                                 "HiraMinProN-W3",
                                 "HiraMinProN-W6",
                                 "HiraginoSans-W3",
                                 "HiraginoSans-W6",
                                 "HiraginoSans-W7",
                                 "HoeflerText-Regular",
                                 "HoeflerText-Italic",
                                 "HoeflerText-Black",
                                 "HoeflerText-BlackItalic",
                                 "Kailasa",
                                 "Kailasa-Bold",
                                 "Kefa-Regular",
                                 "KhmerSangamMN",
                                 "KohinoorBangla-Regular",
                                 "KohinoorBangla-Light",
                                 "KohinoorBangla-Semibold",
                                 "KohinoorDevanagari-Regular",
                                 "KohinoorDevanagari-Light",
                                 "KohinoorDevanagari-Semibold",
                                 "KohinoorGujarati-Regular",
                                 "KohinoorGujarati-Light",
                                 "KohinoorGujarati-Bold",
                                 "KohinoorTelugu-Regular",
                                 "KohinoorTelugu-Light",
                                 "KohinoorTelugu-Medium",
                                 "LaoSangamMN",
                                 "MalayalamSangamMN",
                                 "MalayalamSangamMN-Bold",
                                 "MarkerFelt-Thin",
                                 "MarkerFelt-Wide",
                                 "Menlo-Regular",
                                 "Menlo-Italic",
                                 "Menlo-Bold",
                                 "Menlo-BoldItalic",
                                 "DiwanMishafi",
                                 "MuktaMahee-Regular",
                                 "MuktaMahee-Light",
                                 "MuktaMahee-Bold",
                                 "MyanmarSangamMN",
                                 "MyanmarSangamMN-Bold",
                                 "Noteworthy-Light",
                                 "Noteworthy-Bold",
                                 "NotoNastaliqUrdu",
                                 "NotoNastaliqUrdu-Bold",
                                 "NotoSansKannada-Regular",
                                 "NotoSansKannada-Light",
                                 "NotoSansKannada-Bold",
                                 "NotoSansMyanmar-Regular",
                                 "NotoSansMyanmar-Light",
                                 "NotoSansMyanmar-Bold",
                                 "NotoSansOriya",
                                 "NotoSansOriya-Bold",
                                 "Optima-Regular",
                                 "Optima-Italic",
                                 "Optima-Bold",
                                 "Optima-BoldItalic",
                                 "Optima-ExtraBlack",
                                 "Palatino-Roman",
                                 "Palatino-Italic",
                                 "Palatino-Bold",
                                 "Palatino-BoldItalic",
                                 "Papyrus",
                                 "Papyrus-Condensed",
                                 "PartyLetPlain",
                                 "PingFangHK-Regular",
                                 "PingFangHK-Ultralight",
                                 "PingFangHK-Thin",
                                 "PingFangHK-Light",
                                 "PingFangHK-Medium",
                                 "PingFangHK-Semibold",
                                 "PingFangSC-Regular",
                                 "PingFangSC-Ultralight",
                                 "PingFangSC-Thin",
                                 "PingFangSC-Light",
                                 "PingFangSC-Medium",
                                 "PingFangSC-Semibold",
                                 "PingFangTC-Regular",
                                 "PingFangTC-Ultralight",
                                 "PingFangTC-Thin",
                                 "PingFangTC-Light",
                                 "PingFangTC-Medium",
                                 "PingFangTC-Semibold",
                                 "Rockwell-Regular",
                                 "Rockwell-Italic",
                                 "Rockwell-Bold",
                                 "Rockwell-BoldItalic",
                                 "SavoyeLetPlain",
                                 "SinhalaSangamMN",
                                 "SinhalaSangamMN-Bold",
                                 "SnellRoundhand",
                                 "SnellRoundhand-Bold",
                                 "SnellRoundhand-Black",
                                 "Symbol",
                                 "TamilSangamMN",
                                 "TamilSangamMN-Bold",
                                 "Thonburi",
                                 "Thonburi-Light",
                                 "Thonburi-Bold",
                                 "TimesNewRomanPSMT",
                                 "TimesNewRomanPS-ItalicMT",
                                 "TimesNewRomanPS-BoldMT",
                                 "TimesNewRomanPS-BoldItalicMT",
                                 "TrebuchetMS",
                                 "TrebuchetMS-Italic",
                                 "TrebuchetMS-Bold",
                                 "Trebuchet-BoldItalic",
                                 "Verdana",
                                 "Verdana-Italic",
                                 "Verdana-Bold",
                                 "Verdana-BoldItalic",
                                 "ZapfDingbatsITC",
                                 "Zapfino"
                    ]
                    self.randomFont = fonts.randomElement() ?? "Helvetica"
                } catch {
                    print("Error loading contents of file")
                }
            } else {
                print("File not found")
            }
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

