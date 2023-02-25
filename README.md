# Tipsy Robot

Mastodon Bot written in swift model after the bot exercises demo'd in [Mastodon Bot example](https://thecodingtrain.com/tracks/mastodon) from Daniel Shiffman's CodingTrain channel.

TODO's Back End

- [x] retrieve a public endpoint
- [x] log in using .env
- [x] update with a text post once
- [x] update with an image post once
- [] save logs to file instead of print 
- [x] update with an interval - within the program
- [] cancel timer update
- [] update with an interval - cron job
- [x] open a stream that can see an auth requiring endpoint
- [] easy func to get results from in a window leading to a since "since last" style interaction. 
- [] react to notification (mention, favorite, boost, mention/hashtag combo)
- [] can it run on Linux?

TODO's CLI
- [] begin a listening task
- [] document using a chron job
- [] move to its ubuntu home
 

## Project Startup

### Assumptions: 
- You have an application token 
- If using VSCODE  extension `sswg.swift-lang` has been installed 
- Swift 5.7 is installed on the machine (check with `swift --version`)
- A gitignore with the items in `gitignore_example.txt` (`.env`!!!)

### Writing a New Bot: 

If you'd like to start from scratch, here are the steps

1) Run the following commands to get the bot executable started and verify that it can build:

```zsh

    mkdir your_bot_project_name
    cd your_bot_project_name
    swift package init --type executable
    swift run                                   #will see Hello, world! in console. 

```

2) Update the `Package.swift` to include `ArgumentParser` and `TrunkLine` or some other MastodonAPI library. See this projects `Package.swift`. 

Since `TrunkLine` requires `.macOS(.v12)` for now, so does this example. 

Also note that the reference to `TrunkLine` references a branch instead of a version number because it is my library and it's under development in tandem with this project. If working on a library at the same time as using it in a project `swift package update` forces your project to go fetch the newest version. If that still is not enough, delete the `.build` folder, but that may be an indicator

3) Note that the `swift package init` command created two directories (`Sources/your_bot_project_name`) and made a file called `your_bot_project_name.swift` in that file is a function that looks like:

```swift

    @main
    public struct your_bot_project_name {
        public private(set) var text = "Hello, World!"

        public static func main() {
            print(your_bot_project_name().text)
        }
    }

```

Some people change this and just have a `main.swift` file in the `Sources/your_bot_project_name` directory which then is the contents of their `@main` function. 

Change the contents of that file to match the contents of `hello_server_example.swift` and try `swift run`. Your bot should have posted! 


## References & Resources

- [Swift Command Line with Argument Parser](https://www.youtube.com/watch?v=pQt71tLmiac)
- https://www.swift.org/blog/argument-parser/
- https://swiftpackageindex.com/apple/swift-argument-parser/1.2.1/documentation/argumentparser/gettingstarted
- https://github.com/carlynorama/tipsy-robot
