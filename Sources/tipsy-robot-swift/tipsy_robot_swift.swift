import Foundation
import ArgumentParser
import TrunkLine


public private(set) var botServer:MastodonServer = makeServer()

func makeServer() -> MastodonServer {
    do {
        try TrunkLine.loadDotEnv()
    } catch {
        fatalError("Couldn't load .env")
    }
    let url = URL(string: ProcessInfo.processInfo.environment["SERVER_NAME"]!)
    var newServer:MastodonServer = MastodonServer(host: url!)
    do { 
    try newServer.authorize(TrunkLine.fetchAuthFromEnvironment(
            account: "my_bot_name",                  //these aren't important since only one account
            service: "masto_bot",                    //and we aren't saving to the keychain. 
            tokenKey: "SERVER_TOKEN"))               //this is important, must match .env
    } catch { 
        print(error) 
    }
     return newServer
}

@main
public struct tipsy_robot_swift {

    public static func main() async throws {
       //Check credential will pass if credential is in the .env file as shown.
       //it is loaded into the server during the "makeServer" function. 
       let response =  try await botServer.checkCredential()
       print(String(data:response, encoding: .utf8)!)

       
        let message = "Checking in on the CLI after the big refactor... \(Date.now)..."
       
       // simplest message post.
       //try await botServer.newPost(message: message)

       //simplest image post NOTE: This function name will change. 
       let imagePostMessage = "Posting and image from the CLI... \(Date.now)."
       let imageFile = "small_jpg_test.jpg"
       let imageAltText = "This image again? Flowers, woodland floor, blah blah blah."
       try await botServer.newPostWithImage(message: imagePostMessage, imageFilePath: imageFile , imageAltText: imageAltText)
       
    }
}
