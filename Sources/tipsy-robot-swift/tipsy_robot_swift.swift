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
    try newServer.authorize(try TrunkLine.fetchAuthFromEnvironment(
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

       try await botServer.writeSimpleStatus(string: "Working on Tipsy's CLI: helps to reload the library...")
        // let data = try await botServer.checkCredential(authentication:botServer.authentication!)
        // print("data: \(String(data: data, encoding: .utf8))")
       
    }
}
