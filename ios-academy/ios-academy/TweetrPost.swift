//
//  TweetrPost.swift
//  ios-academy
//
//  Created by student on 10.12.2022..
//

import SwiftUI

struct TweetModel : Identifiable, Codable{ // Codable omogucava da ucitamo JSON
    var id = UUID().uuidString
    
    // kreiramo novu strukturu kako bi mogli imati vise razlicitih contenta, username-a, itd.
    let content: String
    let username: String
    let date: Date
    let imageURL: URL
}






struct TweetPost: View {
    
    
    @Binding var tweet: TweetModel // kako bi mogli omoguciti like i unlike tweeta
    
    @EnvironmentObject var userData: UserData
    
    @State var image: UIImage? = nil // s upitnikom oznacavamo da je vrijednost varijable optional
    
    var body: some View {
        HStack{
            
            if let image {
                Image(uiImage: image) // stavljamo sliku u app(stavljamo samo ime slike)
                    .resizable() // resizeamo sliku
                    .frame(width: 55, height: 55) // fiksiramo width i height na odredenu velicinu
                    .clipShape(Circle()) // mjenjamo oblik slike
            }
            else{
                Circle()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.gray)
            }
            
            VStack (alignment: .leading) // alignamo sve iteme u VStacku na lijevu stranu
            {
                Text(tweet.username)
                Text(tweet.content)
                Text(tweet.date, style: .relative) // dodajemo datum kao tekst slicno kao datetime u C#, relative je format datuma
                
            }
            
            Spacer()
            
            Button(action: {
                
               if userData.favouriteTweets.contains(tweet.id){
                   userData.favouriteTweets.remove(tweet.id)
                }
                else{
                    userData.favouriteTweets.insert(tweet.id)
                }
               // tweet.isFavourite.toggle() // omogucuje promjenu stanja gumba like u true ili false (item koji mjenjamo ne smije biti let vec var)
            }) {
                if userData.favouriteTweets.contains(tweet.id){
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                else{
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                }
            }
        }
        .task {
            do{
                let (data, _) = try await
                    URLSession.shared.data(from: IMAGE_URL)
                image = UIImage(data: data)
            } catch let error{
                print(error)
            }
        }
    }
}

struct TweetPost_Previews: PreviewProvider {
    static var previews: some View {
        TweetPost(tweet: Binding.constant (TweetModel(
            content: "tweet 1",
            username: "username",
            date: Date(),
            imageURL: IMAGE_URL)))
        .environmentObject(UserData())
    }
}
