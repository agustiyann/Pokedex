//
//  InfoView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Core
import Pokemon

struct InfoView: View {

  @ObservedObject var presenter: PokemonPresenter<
    Interactor<String, PokemonDomainModel, GetPokemonRepository<GetPokemonsLocaleDataSource, PokemonTransformer>>,
    Interactor<String, PokemonDomainModel, UpdateFavoritePokemonRepository<GetFavoritePokemonLocaleDataSource, PokemonTransformer>>
  >

  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  var pokemon: PokemonDomainModel

  var body: some View {
    ZStack {
      if presenter.isLoading {
        VStack {
          Text("Loading...")
        }
      } else {
        ZStack {
          LinearGradient(
            gradient: Gradient(colors: [Color.backgroundType(type: pokemon.type[0]), Color.white]),
            startPoint: .top, endPoint: .bottom
          ).ignoresSafeArea()
          Color.white.offset(y: 300)
          ScrollView(.vertical, showsIndicators: false) {
            imagePokemon
            content
          }
        }
      }
    }
    .onAppear(perform: {
//      self.presenter.getPokemon()
      self.presenter.getPokemon(request: pokemon.id)
    })
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(
      leading: backButton,
      trailing: Text("\(pokemon.id)")
        .foregroundColor(.white)
        .font(.title3)
        .bold()
        .shadow(color: .black, radius: 5, x: 0, y: 0)
    )
  }

}

extension InfoView {

  var imagePokemon: some View {
    WebImage(url: URL(string: self.presenter.item?.imageurl ?? ""))
      .resizable()
      .indicator(.activity)
      .transition(.fade(duration: 0.5))
      .scaledToFit()
      .frame(width: 200)
      .cornerRadius(30)
      .shadow(color: .black, radius: 5, x: 0, y: 5)
      .padding(.top)
  }

  var content: some View {
    VStack(alignment: .center, spacing: 10) {
      Text(self.presenter.item?.name ?? "")
        .font(.title)
        .bold()
        .padding(.top, 40)

      HStack(alignment: .center, spacing: 25) {
        ForEach(self.presenter.item?.type ?? [String](), id: \.self) { type in
          Text(type)
            .bold()
            .foregroundColor(Color.white)
            .padding(EdgeInsets(top: 5, leading: 35, bottom: 5, trailing: 35))
            .background(Color.backgroundType(type: type))
            .cornerRadius(40)
        }
      }

      HStack(alignment: .center) {
        Spacer()
        VStack(alignment: .center, spacing: 10) {
          Text(self.presenter.item?.height ?? "")
            .font(.title3)
            .bold()
          Text("Height")
            .foregroundColor(.gray)
        }
        Spacer()
        VStack(alignment: .center, spacing: 10) {
          Text(self.presenter.item?.weight ?? "")
            .font(.title3)
            .bold()
          Text("Weight")
            .foregroundColor(.gray)
        }
        Spacer()
      }
      .padding(.vertical)

      Text("About")
        .font(.title3)
        .bold()
      Text(self.presenter.item?.description ?? "")
        .fixedSize(horizontal: false, vertical: true)
        .padding(.horizontal)

      Text("Base Stats")
        .font(.title3)
        .bold()
        .padding(.top)

      BarChartView(pokemon: pokemon)

      HStack(alignment: .top) {
        VStack(alignment: .leading) {
          Text("Breeding")
            .font(.title3)
            .bold()
          Text("Gender")
            .bold()
            .foregroundColor(.gray)
          Text("♂\(self.presenter.item?.malePercentage ?? "") ♀\(self.presenter.item?.femalePercentage ?? "")")

          Text("Egg Groups")
            .bold()
            .foregroundColor(.gray)
            .padding(.top, 1)
          Text(self.presenter.item?.eggGroups ?? "")

          Text("Egg Cycle")
            .bold()
            .foregroundColor(.gray)
            .padding(.top, 1)
          Text(self.presenter.item?.cycles ?? "")
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        VStack(alignment: .leading) {
          Text("Weaknesses")
            .font(.title3)
            .bold()
          ForEach(self.presenter.item?.weaknesses ?? [String](), id: \.self) { type in
            Text(type)
              .foregroundColor(Color.backgroundType(type: type))
          }
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
      }
      .padding()

//      if pokemon.favoriteState {
//        Button(action: {
//          self.presenter.updateFavoritePokemon()
//        }, label: {
//          Text("Remove From Favorite")
//        })
//        .buttonStyle(FilledButton())
//        .padding(20)
//      } else {
//        Button(action: {
//          self.presenter.updateFavoritePokemon()
//        }, label: {
//          Text("Add to Favorite")
//        })
//        .buttonStyle(FilledButton())
//        .padding(20)
//      }

      HStack { Spacer() }
    }
    .background(Color.white)
    .cornerRadius(40)
    .padding(.top, -40)
    .zIndex(-1)
  }

  var backButton: some View {
    Button(action: {
      presentationMode.wrappedValue.dismiss()
    }, label: {
      Image(systemName: "chevron.backward")
        .foregroundColor(.black)
        .padding(5)
        .background(
          Rectangle()
            .cornerRadius(5)
            .foregroundColor(.white)
        )
    })
  }

}
