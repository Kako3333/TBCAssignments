//
//  Riddles.swift
//  EmojiRiddle
//
//  Created by Gio Kakaladze on 27.12.24.
//
import Foundation

let moviesCategory = Category(
    name: "Movies",
    riddles: [
        Riddle(emojis: "🏴‍☠️⚔️🌊🗺️☠️", correctAnswer: "Pirates of the Caribbean", options: ["Pirates of the Caribbean", "Treasure Island", "Captain Phillips", "Robinson Crusoe"]),
        Riddle(emojis: "🕶️🌃🖤🔫💊", correctAnswer: "The Matrix", options: ["The Matrix", "Blade Runner", "Inception", "The Dark Knight"]),
        Riddle(emojis: "👸❄️⛄🌨️🎵", correctAnswer: "Frozen", options: ["Tangled", "Frozen", "Moana", "Cinderella"]),
        Riddle(emojis: "🦸‍♂️🕷️🌆💥🕸️", correctAnswer: "Spider-Man", options: ["Spider-Man", "The Avengers", "Batman", "Deadpool"]),
        Riddle(emojis: "👽🌎🔊🎵☁️", correctAnswer: "Arrival", options: ["Arrival", "Interstellar", "Gravity", "Contact"]),
        Riddle(emojis: "🚀🌌💔🌍🕒", correctAnswer: "Interstellar", options: ["Interstellar", "The Martian", "Gravity", "Apollo 13"]),
        Riddle(emojis: "🦁👑🌳🌞🐗", correctAnswer: "The Lion King", options: ["The Lion King", "Madagascar", "Finding Nemo", "Ice Age"]),
        Riddle(emojis: "🎩🕒🐇🎭🃏", correctAnswer: "Alice in Wonderland", options: ["Alice in Wonderland", "The Prestige", "Now You See Me", "Charlie and the Chocolate Factory"]),
        Riddle(emojis: "🕵️‍♂️🔍📜💡🎩", correctAnswer: "Sherlock Holmes", options: ["Sherlock Holmes", "The Da Vinci Code", "Knives Out", "The Hound of the Baskervilles"]),
        Riddle(emojis: "⚡🧙‍♂️🏰🦉📚", correctAnswer: "Harry Potter", options: ["Harry Potter", "The Lord of the Rings", "Percy Jackson", "The Chronicles of Narnia"])
    ]
)

let booksCategory = Category(
    name: "Books",
    riddles: [
        Riddle(emojis: "👦⚡🧙‍♂️📚🦉", correctAnswer: "Harry Potter", options: ["Harry Potter", "The Hobbit", "Eragon", "Percy Jackson"]),
        Riddle(emojis: "👨‍⚕️🐘🌍🏥🩺", correctAnswer: "The Elephant Whisperer", options: ["The Elephant Whisperer", "Water for Elephants", "Life of Pi", "Zoo Story"]),
        Riddle(emojis: "🌹👨‍🦳🐗🏰🕯️", correctAnswer: "Beauty and the Beast", options: ["Beauty and the Beast", "The Phantom of the Opera", "Jane Eyre", "The Secret Garden"]),
        Riddle(emojis: "🐳⚓🌊📘🪝", correctAnswer: "Moby-Dick", options: ["Moby-Dick", "20,000 Leagues Under the Sea", "The Old Man and the Sea", "Treasure Island"]),
        Riddle(emojis: "👩‍🎤🎸🚀🌌💔", correctAnswer: "The Fault in Our Stars", options: ["The Fault in Our Stars", "Me Before You", "The Notebook", "P.S. I Love You"]),
        Riddle(emojis: "🐦📚🌳🕊️🏹", correctAnswer: "To Kill a Mockingbird", options: ["To Kill a Mockingbird", "The Hunger Games", "Catching Fire", "Mockingjay"]),
        Riddle(emojis: "👧🎩🐇🕒🌳", correctAnswer: "Alice's Adventures in Wonderland", options: ["Alice's Adventures in Wonderland", "The Wizard of Oz", "Peter Pan", "The Secret Garden"]),
        Riddle(emojis: "👨‍🎓🎒📖🏫🌟", correctAnswer: "Diary of a Wimpy Kid", options: ["Diary of a Wimpy Kid", "Harry Potter", "Percy Jackson", "The Maze Runner"]),
        Riddle(emojis: "🧝🌳💍🏔️🔥", correctAnswer: "The Lord of the Rings", options: ["The Lord of the Rings", "The Hobbit", "The Silmarillion", "Eragon"]),
        Riddle(emojis: "🚂🕵️‍♀️🛏️🔪💼", correctAnswer: "Murder on the Orient Express", options: ["Murder on the Orient Express", "The Girl on the Train", "Sherlock Holmes", "Gone Girl"])
    ]
)

let animeCategory = Category(
    name: "Anime",
    riddles: [
        Riddle(emojis: "🍙👦🎮👾⚔️", correctAnswer: "Sword Art Online", options: ["Sword Art Online", "Attack on Titan", "Naruto", "Demon Slayer"]),
        Riddle(emojis: "🎩🔍🕵️‍♂️🕒🎭", correctAnswer: "Detective Conan", options: ["Detective Conan", "Death Note", "Sherlock Holmes", "Code Geass"]),
        Riddle(emojis: "🐉☁️🧒👊🌌", correctAnswer: "Dragon Ball Z", options: ["Dragon Ball Z", "One Punch Man", "My Hero Academia", "Attack on Titan"]),
        Riddle(emojis: "👦👹🏔️💀⚔️", correctAnswer: "Demon Slayer", options: ["Demon Slayer", "Bleach", "Naruto", "Tokyo Ghoul"]),
        Riddle(emojis: "🍜🍃👦🌀🎯", correctAnswer: "Naruto", options: ["Naruto", "One Piece", "Bleach", "Dragon Ball Z"]),
        Riddle(emojis: "☠️🏴‍☠️🌊📜🗺️", correctAnswer: "One Piece", options: ["One Piece", "Naruto", "Bleach", "Black Clover"]),
        Riddle(emojis: "📓💀🖊️🕵️‍♂️🎭", correctAnswer: "Death Note", options: ["Death Note", "Code Geass", "Attack on Titan", "Psycho-Pass"]),
        Riddle(emojis: "🛡️🗡️👹⚔️🌌", correctAnswer: "Attack on Titan", options: ["Attack on Titan", "Demon Slayer", "Bleach", "Sword Art Online"]),
        Riddle(emojis: "🏯👘💨🌸🎍", correctAnswer: "Spirited Away", options: ["Spirited Away", "My Neighbor Totoro", "Kiki's Delivery Service", "Howl's Moving Castle"]),
        Riddle(emojis: "🐱🐈🛶🌳🌧️", correctAnswer: "My Neighbor Totoro", options: ["My Neighbor Totoro", "Spirited Away", "Kiki's Delivery Service", "Ponyo"])
    ]
)

let gamesCategory = Category(
    name: "Games",
    riddles: [
        Riddle(emojis: "🍄🍃🧑‍🦱🧊", correctAnswer: "Super Mario", options: ["Super Mario", "Sonic the Hedgehog", "The Legend of Zelda", "Donkey Kong"]),
        Riddle(emojis: "👾👾💥👾🎮", correctAnswer: "Space Invaders", options: ["Space Invaders", "Pac-Man", "Asteroids", "Tetris"]),
        Riddle(emojis: "👑🎮⚔️🏰🛡️", correctAnswer: "The Legend of Zelda", options: ["The Legend of Zelda", "Skyrim", "Dark Souls", "Bloodborne"]),
        Riddle(emojis: "🏎️💨⚡🏁🚗", correctAnswer: "Mario Kart", options: ["Mario Kart", "Need for Speed", "Gran Turismo", "Forza Horizon"]),
        Riddle(emojis: "🔨💎⚒️🌍", correctAnswer: "Minecraft", options: ["Minecraft", "Terraria", "Roblox", "Fortnite"]),
        Riddle(emojis: "🤖🔫👾💣", correctAnswer: "Halo", options: ["Halo", "Call of Duty", "Overwatch", "Fortnite"]),
        Riddle(emojis: "💀💥🔪💡", correctAnswer: "Assassin's Creed", options: ["Assassin's Creed", "Hitman", "Tomb Raider", "Uncharted"]),
        Riddle(emojis: "🧙‍♂️⚔️🕹️🎮", correctAnswer: "The Elder Scrolls V: Skyrim", options: ["The Elder Scrolls V: Skyrim", "World of Warcraft", "Diablo III", "Dark Souls"]),
        Riddle(emojis: "🦸‍♂️🕷️🏙️🕸️", correctAnswer: "Spider-Man", options: ["Spider-Man", "Batman", "Superman", "Iron Man"]),
        Riddle(emojis: "🧟‍♂️⚔️💥🧠", correctAnswer: "Left 4 Dead", options: ["Left 4 Dead", "Resident Evil", "The Last of Us", "Dead Rising"])
    ]
)

