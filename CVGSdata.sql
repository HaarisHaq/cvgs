GO
USE [Conestoga Videogame Store]
GO

--====================================================================================
--						populate games table
--====================================================================================
GO
INSERT INTO [dbo].[game] ([id], [title], [genre], [releaseDate], [developer], [esrbRating], [details], [plot])
SELECT 1, 'FINAL FANTASY IV', 'RPG', CAST('2008-07-22' AS Date), 'Square Enix', 'E10+', '<ul><li><strong>The Plot</strong> - Final Fantasy IV begins as the unmatched monarchy of Baron sends the Red Wings to attack the mage city of Mysidia to obtain the Water Crystal, one of four powerful Crystals. Cecil, Lord Captain of the Red Wings, questions the kings motives after stealing the Water Crystal, killing the mages who fought to protect their treasure.</li><li><strong>Game Environments</strong> - The environment looks a lot more real, the monsters are more animated, the characters have more facial features, and--in short, its just a huge improvement over the preceding Final Fantasy games..</li><li><strong>Gameplay</strong> - In Final Fantasy IV, the player controls a large cast of characters and completes quests to advance the story. Characters move and interact with people and enemies on a field map, which may represent a variety of settings, such as towers, caves, and forests.</li></ul>', 'The player takes the role of Cecil, a Dark Knight from the kingdom of Baron, on his journey to save the world from the evil Golbez. Struggling to prevent Golbez from acquiring powerful Crystals, Cecil learns of his heritage and travels through three realms to battle Golbezs minions. His lover, best friend, and other warriors join him for the adventure.'
UNION ALL
SELECT 2, 'NHL 09', 'Sports', CAST('2009-09-09' AS Date), 'Electronic Arts', 'E10+', 'NHL8 provided true offensive prowess with the Skill Stick now you have the power to stop it. Block passing lanes with 360ࠣontrol of your stick or disrupt an opponent"s one-timer by lifting their stick just before they receive a pass. A new weapon has also been added to your offensive arsenal?the one-handed deke. During breakaways or in open ice, tap the puck to one hand then tuck it behind a sprawling goalie for the ultimate finish. Shoot, pass, and score using a simplified two-button control system from the glory days of NHL 94. With the addition of the Czech, German, and Russian leagues, everyone around the globe can enjoy the fastest sport on earth.', 'Welcome to the future of sports video gaming with NHL 09. With all-new Be A Pro mode, step onto the ice and play an entire career as yourself through a dynamic camera angle in two compelling game modes. As a single player, earn your own hockey card as you progress from the AHL to the NHL, or be the first to play the first true console sports massive multiplayer online game, allowing you to assemble a team with up to 50 friends in the new EA SPORTS Hockey League. Playing with 11 live players online or storming the ice on your own, evolve your game and have a legendary career with NHL 09.'
UNION ALL
SELECT 3, 'FALLOUT 3', 'RPG', CAST('2008-10-28' AS Date), 'Bethesda Softworks', 'M', 'Fallout 3 is loaded with new and impressive features like limitless freedom, S.P.E.C.I.A.L., and the power of choice and much more.  Limitless freedom lets you take in the sights and sounds of the vast Capital Wasteland! See the great monuments of the United States lying in post-apocalyptic ruin! You make the choices that define and change the world. Just remember to keep an eye on your Rad Meter!  Vault-Tec engineers bring you the latest in human ability simulation - the S.P.E.C.I.A.L. Character System! Using new breakthroughs in points-based ability representation, S.P.E.C.I.A.L. give you unlimited customization of your character. Also included are dozens of unique skills and perks to choose from, each with a dazzling variety of effects!  Whether you are feeling like a dastardly villain, or a good Samaritan you pick the side of the line you walk on. As every situation can be dealt with in many different ways it is up to you to choose what way you are going to handle every situation. Talk out your problems in a civilized fashion, or just flash your Plasma Rifle.', 'Vault 101 - Jewel of the Wastes. For 200 years, Vault 101 has faithfully served the surviving residents of Washington DC and its environs, now known as the Capital Wasteland. Though the global atomic war of 2077 left the US all but destroyed, the residents of Vault 101 enjoy a life free from the constant stress of the outside world. Giant Insects, Raiders, Slavers, and yes, even Super Mutants are all no match for superior Vault-Tecngineering. Yet one fateful morning, you awake to find that your father has defied the Overseer and left the comfort and security afforded by Vault 101 for reasons unknown. Leaving the only home you have ever known, you emerge from the Vault into the harsh Wasteland sun to search for your father, and the truth.'
UNION ALL
SELECT 4, 'Tomb Raider: UnderWorld', 'Action', CAST('2005-11-22' AS Date), 'Crystal Dynamics', 'T', '<ul><li><strong>The Plot</strong> - Tomb Raider Underworld is an action adventure game in which players assume the role of Lara Croft in her quest to rescue her missing mother. Players navigate through mythical islands and historical ruins while fighting human, animal and supernatural enemies. Lara uses various machine guns, grenades, and her own fists to attack adversaries encountered along the way. Faint puffs of red blood are emitted from humans and animals when they are shot. Female characters have somewhat exaggerated physical features and their outfits display moderate amounts of cleavage. </li><li><strong>Game Environments</strong> - Based on several of the boroughs of New York City and parts of New Jersey, Liberty City, familiar to players of previous games in the series, has been entirely redesigned for GTA IV. Players can expect visible detail down to the weeds growing in the cracks in the sidewalk, cars and buildings of visibly different ages and a much greater level if verticality in the buildings and bridges that they are able to explore as Niko moves through the city streets. In addition, pedestrians in GTA IV are much more realistic. No longer simply moving cardboard cutouts, these NPCs are intelligent, modern, human representations that laugh, cry, eat, drink, use cell phones and As, and talking amongst themselves regardless of Nikos interaction with them.</li><li><strong>Gameplay</strong> - Historically GTA games have focused heavily on mission-based play, requiring successful completion of fixed tasks in order for players to progress through the game, but this has changed to a great extent in GTA IV. Players will experience an entirely new and exciting emphasis centered on the blending of on-mission and off-mission play, resulting not only in an increased sense of realism, but more interesting and unrestricted gameplay.</li></ul>', 'Tomb Raider Underworld is an action adventure game in which players assume the role of Lara Croft in her quest to rescue her missing mother. Players navigate through mythical islands and historical ruins while fighting human, animal and supernatural enemies.'
UNION ALL
SELECT 5, 'CALL OF DUTY: WORLD AT WAR', 'Shooter', CAST('2008-11-11' AS Date), 'Activision', 'M', NULL, 'Call of Duty: World at War completely changes the rules of engagement by redefining WWII gaming and thrusting players into the final tension-filled, unforgiving battles against a new ferocious enemy in the most dangerous and suspenseful action ever seen in WWII. Powered by Call of Duty 4: Modern Warfare technology, Call of Duty: World at War brings an uncensored edge to combat, as soldiers face the most harrowing and climatic European and Pacific battles in which an enemy, who knows no surrender and no retreat, will fight to the last breath, unleashing an arsenal of lethal surprising tactics. Peril and danger lurk throughout the battlefield as players combat the unknown risk of the new chaos of battle.'
UNION ALL
SELECT 6, 'Rainbow Six: Vegas 2', 'Shooter', CAST('2008-03-18' AS Date), 'Ubisoft', 'M', '<ul><li><strong>The tragic events at the observatory are now a memory, but the terrorist threat in Sin City is very real. While Logan Keller is in pursuit of Irina Morales in Mexico, Six has ordered your team to Vegas. There, terrorist mastermind Alvarez Cabrero is hatching a scheme to bring Sin City to its knees确d itⳠup to your team alone to stop him from turning Vegas into a devastated inferno. Return to Sin City for the last time in Rainbow Six Vegas 2 and put an end to the terrorist threat. There, you⬬ unravel a web of betrayal that will take you beyond the events of Rainbow Six Vegas. At a remote hideaway you⬬ witness the astonishing conclusion that will bring an end to the crisis in Vegas once and for all.</strong></li></ul>', 'The terrorist threat to Vegas is still five years away, but the seeds of deceit are soon to be planted. And you, unknowingly, are about to play a central role..'
UNION ALL
SELECT 7, 'Fable: The Lost Chapters', 'RPG', CAST('2005-08-14' AS Date), 'Rockstar Games', 'M', '<ul><li><strong>The Plot</strong> - Become a hero and make a choice to save or destroy Albion</li><li><strong>Game Environments</strong> - The Game is based in the fictitous land of albion </li><li><strong>Gameplay</strong> - With experience comes advancement and physical change, whether it be expanding muscles, a keen eye and nimble form, or the buzz of magical energies around your finger tips. As you develop your alter ego, the world reacts to you and your actions. People comment on your successes and failures, your appearance, and your behavior.</li></ul>', 'Imagine a world where every choice and action determines what you become. Where you evolve in real time based on every little thing you do. Your every action determines your characters skills, appearance and morality. Your characters life story is created from childhood through to adulthood and on to old age. Grow from an inexperienced child into the most powerful being in the world, spoken of by all and immortalized in legend. With experience comes advancement and physical change, whether it be expanding muscles, a keen eye and nimble form, or the buzz of magical energies around your finger tips. As you develop your alter ego, the world reacts to you and your actions. People comment on your successes and failures, your appearance, and your behavior. Their many opinions are expressed through applause, mockery, trepidation, panic, and even flirtation if they feel so inclined.'
UNION ALL
SELECT 8, 'Medal of Honour: European Assault', 'Actio', CAST('2008-06-07' AS Date), 'Electronic Arts', 'T', 'Medal of Honor European Assault is the latest video game from EA acclaimed Medal of Honor franchise, which has been credited with pioneering the WWII first-person shooter genre when it debuted in 1999. Against all odds, the leadership choices you make before and during the heat of battle will define your legacy as a hero in this highly anticipated addition to the franchise.', 'In Medal of Honor: European Assault, you will join the effort to liberate Europe in 1942. As US Army Lieutenant William Holt, you must take command of a group of soldiers through battlefields based on actual WWII locations. In both single-player and multiplayer modes, your survival depends on your ability to master weapons, gather intelligence for future missions, and make smart choices.'
UNION ALL
SELECT 9, 'UNREAL TOURNAMENT 3', 'Shooter', CAST('2007-07-07' AS Date), 'Bungie Studios', 'M', 'The Necris invasion has begun, and your clan was one of the first to be slaughtered. Head to the front lines and join this Epic battle to defend humanity while taking your revenge. Unreal Tournament 3 marks the return of the premiere tournament-style first-person shooter. Unreal Tournament 3 unleashes the full power of Unreal Engine 3, taking graphics, gameplay, and challenge to a whole new level. Players engage in intense and hyper-real battles with other human players online or against incredibly realistic Unreal artificial intelligence. Over two dozen weapons and vehicles have been upgraded and enhanced for maximum killing potential. Take on all comers in a variety of game modes including Deathmatch, Team Deathmatch, Capture the Flag, an all-new Warfare mode and more.', 'Unreal Tournament 3 (UT3) is a first-person shooter and online multiplayer video game by Epic Games and is the next installment of the Unreal series after Unreal Tournament 2004. It is published by Midway Games and was released for Microsoft Windows on November 19, 2007, PlayStation 3 on December 11, 2007, and on Xbox 360 on July 3, 2008. The Linux installer is planned to be released later as a downloadable installer that works with the Windows disc.'
UNION ALL
SELECT 10, 'NHL 2K9', 'Sports', CAST('2008-08-09' AS Date), 'Take-Two Interactive', 'E', NULL, 'Do you long for the days when hockey video games didnⴠrequire an engineering degree to master? 2K Sports has listened to the masses by bringing the fun back to hockey video games with an intuitive control scheme, hard-hitting action and by announcing the debut of NHLK9 on the Wii頣onsole. Developed by award-winning Visual Concepts studios, NHL 2K9 brings a totally rebuilt NHL experience to life with a brand-new in-game presentation system, as well as fresh player animations and controls that you will enjoy from the moment you play your first game, until well after, as you become a seasoned veteran. New for Next-Gen consoles and further adding to an unmatched level of fun are an all-new Zamboni頭ini-game, playoff beards, a new fighting engine and more! Complete with new commentary, a user-friendly franchise mode and upgraded online features, NHL 2K9 brings the fun back to your game console on 9.9.08!'
UNION ALL
SELECT 11, 'GUITAR HERO WORLD TOUR', 'Music & Party', CAST('2008-10-26' AS Date), 'Activision', 'T', 'Guitar Hero World Tour delivers more ways to play than ever before. Virtual musicians can live out their rock and roll fantasies by playing either a single instrument, or any combination of instruments, in addition to the full band experience. In addition to all of the online gameplay modes from Guitar Hero III: Legends of Rock, Guitar Hero World Tour introduces Battle of the Bands mode which allows eight players to join online and challenge each other band-to-band to determine who is the best of the best. In the Band modes, up to four players can jam together, online or off, as they progress through the game, and in single-player Career Mode, players can jam on any of the instruments in branching venue progression enabling them to rock out in the order of their choice.', 'Delivering the largest on-disc set list in a music-rhythm game to-date, Guitar Hero World Tour is comprised entirely of master recordings from some of the greatest classic and modern rock bands of all-time including Van Halen, Linkin Park, The Eagles, Sublime and many more. Additionally, the game will offer significantly more localized downloadable music than ever before on all of the next-generation consoles. Budding rock stars will also be given creative license to fully customize everything from their characters'' appearance and instruments to their band''s logo and album covers.'
UNION ALL
SELECT 12, 'Left 4 Dead', 'Shooter', CAST('2008-11-18' AS Date), 'Activision', 'M', 'The game pits four Survivors of an apocalyptic pandemic against hordes of aggressive zombies. There are two game modes: a four-player, co-op Campaign mode, and an eight-player Versus mode. In both modes, an AI, dubbed "The Director", controls level pacing and item spawns, in an attempt to create a dynamic experience and increase replay value.', 'Left 4 Dead is a co-operative, survival horror, first-person shooter video game. It was developed by Turtle Rock Studios, which was purchased by the Valve Corporation part-way into development. The game uses the Source game engine, and is available for Windows-based personal computers and the Xbox 360.'
UNION ALL
SELECT 13, 'KUNG FU PANDA', 'Action', CAST('2008-06-03' AS Date), 'Activision', 'E10+', '<ul><li><strong>Key Features</strong>Master your Kung Fu skills as Po, Shifu, and the Furious Five!Face dangerous foes on your legendary Kung Fu journey through 13 awesome levels spanning land, water, and air.Team up with or battle against your friends in Multiplayer Mode. Supports up to 4 players.</li><li><strong> NDS version Key Features</strong>Use your stylus to fight as Po learns the special moves of the Furious Five!Adventure as Po and face dangerous foes across new lands.Become a Kung Fu Master on a legendary adventure.</li></ul>', 'Embark on an epic action-packed adventure based on the DreamWorks Animation movie Kung Fu Panda! Go beyond the movie as you experience Kung Fu awesomeness like never before on your quest to become the legendary Dragon Warrior.'
UNION ALL
SELECT 14, 'FINAL FANTASY III', 'RPG', CAST('1994-10-16' AS Date), 'Square Enix', 'T', '<ul><li><strong>The Plot</strong> - The Empire is reviving the force of "magic," unseen for over 1,000 years. Terra, a young girl cruelly enslaved for her magical talent, escapes and joins the rebelling Returners. She and her friends struggle against Emperor Gestahl and his demented general Kefka. Meanwhile, Terra''s own dual nature (half-human, half-Esper) threatens to unravel the fragile alliance from within. The Empire tries to harness the power of the Goddess Statues to gain the ultimate authority. At the last moment, however, Kefka stabs Gestahl, unaligns the Statues, and brings about the end of the world. The party is scattered to the ends of the earth, and all seems lost.</li></ul>', 'The War of the Magi, an event that caused the whole world to be reduced to nearly nothing. Within the course of 1000 years, magic faded out of existance while new technology grew. However, there are those who want to revive magic and become powerful. Terra, a girl of mysterious esper power, runs from the Empire after being used as a puppet. She fights on for what she believes is right but feels a slight sense that something is missing inside her... '
UNION ALL
SELECT 15, 'Shin Sangokumusou 5', 'Action', CAST('2009-01-29' AS Date), 'Bungie Studios', 'E10+', '', ''
UNION ALL
SELECT 16, 'Need For Speed Undercover', 'Sports', CAST('2008-11-18' AS Date), 'Electronic Arts', 'T', '<ul><li><strong>Plot</strong> - The game"s story mode sets the player in the story as a police officer going undercover into the criminal underground of Tri-City, a fictional city where the game is set. Players take on dangerous jobs and compete in races in order to infiltrate and take down a ruthless international crime smuggling syndicate of street racers and car thieves. The player"s only contacts to the police are federal handler Chase Linh, played by Maggie Q, and later Lt. Jack M. Keller played by Paul Pape. </li></ul>', 'EA"s dominating racing series takes a left turn with this uniquely action-oriented entry in the franchise, where players use their driving skills honed in previous NFS games to control their vehicle in dangerous, high speeds encounters. The game features international movie star, Maggie Q, as the lead character in the big-budget live-action sequences that propel the story forward as players get behind the wheel. Undercover takes the franchise back to its roots and re-introduces break-neck cop chases, the world"s hottest cars and spectacular highway battles.'
UNION ALL
SELECT 17, 'PRO EVOLUTION SOCCER 2009', 'Sports', CAST('2008-11-11' AS Date), 'Konami', 'E', 'PES 2009 is the latest installment of the award-winning Pro Evolution Soccer Series, which is known by millions of fans for its superior gameplay and incredible realism. For PES 2009, Konami is already planning a raft of extensive new additions that will further bridge the gap between PES and the real thing. The new game has undergone a stunning graphical update to ensure its players look and move even more like their real-life counterparts. Similarly, all-new options allow users to tailor the game to their own tastes, while new moves, innovative new control elements and key online elements will further the realism of the new game.', 'Pro Evolution Soccer is back for 2009! The terms "PES" and "Winning Eleven" have always been synonymous with realism and superior gameplay, but this year PES will further narrow the gap between the game, and the real thing! New stadiums, players motions and gameplay modes will bolster a game already focused on providing an exciting soccer experience. In 2009, Pro Evolution will once again push the limits of soccer gaming. If it were any more real, you would be on the field!'
UNION ALL
SELECT 18, 'DOOM 2', 'Shooter', CAST('1995-12-26' AS Date), 'ID Software', 'M', '<ul><li><strong>The Plot</strong> - Immediately following the events in Doom, the player once again takes the role of the anonymous space marine who has proven too tough for the forces of Hell to contain. After being teleported from Phobos, and subsequently fighting on Deimos which is hanging on top of Hell itself, the Marine is back home on Earth, only to find that it too has fallen victim to the hellish invasion.The player progresses through 30 levels (32 including two secretly accessed levels), and on the way he learns that the remaining survivors of Earth s population are being held on Earth and the only means of escape is the space port with massive ships that can carry the remnants of Earth s population into space. However the demons know this and have placed a fire force field over the space port, so those ships cannot land or leave. The marine must battle his way through the infested space port and deactivate that fire force field. Once humanity is finally evacuated from the ravaged, infested planet, the Marine is the only human left on Earth. He sits and waits for death, content in the knowledge that he has saved his species, giving them a chance to continue on elsewhere. Only minutes pass before the Marine receives an off-planet transmission - humans in orbit have managed to find out where the armies of Hell are spilling from. If the Marine can reach this gateway, he can thwart the invasion once and for all.The Marine wearily pulls himself to his feet and moves off to the portal, cutting a swath through the demons in his path before finally arriving at the gateway. He sees no way to close it on this side, and so dives through to find a solution on the other side. In the game s own words, what do you care if you have to go through Hell to get to it? After brutal battles with legions of Hell, the Marine finally reaches the home of the largest demon (he has) ever seen. Once the player fires enough rockets into the exposed brain of the demon, dodging constant attacks from lesser demons the larger one summons, the demon (known as the Icon of Sin) explodes, devastating Hell in its death throes. When the chaos finally ceases, Hell is in ruins, the invasion permanently halted. The Marine wipes his brow and begins the long journey home, looking forward to helping rebuild Earth.</ul></li>', 'Let the Obsession begin. Again. This time, the entire forces of the netherworld have overrun Earth. To save her, you must descend into the stygian depths of Hell itself! Battle mightier, nastier, deadlier demons and monsters. Use more powerful weapons. Survive more mind-blowing explosions and more of the bloodiest, fiercest, most awesome blastfest ever! Play DOOM II solo, with two people over a modem, or with up to four players over a LAN (supporting IPX protocol). No matter which way you choose, get ready for adrenaline-pumping, action-packed excitement that''s sure to give your heart a real workout.'
UNION ALL
SELECT 19, 'CHRONO TRIGGER', 'RPG', CAST('1995-11-06' AS Date), 'Square Enix', 'T', '<ul><li>After 13 years, the role playing game of the ages returns with Chrono Trigger for the Nintendo DS. Crono, meets an adventurous girl named Marle, and accidentally travels back in time 400 years.Past, present, and future worlds collide as Crono tries to save the planet.Revised version of the groundbreaking Active Time Battle (ATB) System delivers exhilarating combat.Special Tech skills and powerful combos, known as Dual and Triple Techs, encourages strategic battle plans.</li></ul>', 'A chance encounter amid the festivities of Guardia''s Millennial Fair in Leene Square introduces the young hero, Crono, to a girl by the name of Marle. Deciding to explore the fair together, the two soon find themselves at an exhibition of the Telepod, the latest invention by Crono''s longtime friend Lucca. Marle, fearless and brimming with curiosity, volunteers to assist in a demonstration. However, an unanticipated malfunction sends her hurtling through a rift in the dimensions. Taking hold of the girl''s pendant, Crono bravely follows in pursuit. But the world into which he emerges is the one of four centuries before. Journey to the forgotten past, the distant future, and even to the very End of Time. The epic quest to save a planet''s future makes history once again.'
UNION ALL
SELECT 20, 'Halo', 'Shooter', CAST('2001-11-15' AS Date), 'Bungie Studios', 'M', '<ul><li><strong>The Plot</strong> - In Halo''s twenty sixth century setting, the player assumes the role of the Master Chief, a cybernetically enhanced SPARTAN super-soldier. The player is accompanied by Cortana, an artificial intelligence who occupies the Master Chief''s neural interface. Players battle various aliens on foot and in vehicles as they attempt to uncover the secrets of the eponymous Halo, a ring-shaped structure. The game has been called easy to learn, and has been praised for its engaging story.</ul></li>', 'Players take control of Master Chief A.K.A. Spartan 117, a cyborg super soldier. When his ship crashlands on a mysterious ring floating in space call halo, the player must unlock the secrets within.'
UNION ALL
SELECT 21, 'GRAND THEFT AUTO IV', 'Action', CAST('2008-04-30' AS Date), 'Rockstar Games', 'M', '<ul><li><strong>The Plot</strong> - Grand Theft Auto IV is a brand new adventure in the GTA universe following the experiences of Nikolai "Niko" Bellic, a new immigrant from an undisclosed eastern European country whose troubled past and the persuasion of his cousin Roman have brought him to the fictional Liberty City. Unfortunately, Niko''s search for the American Dream and a much needed fresh start, hits an immediate snag when the rags to riches story Roman spun to pique Niko''s interest is exposed as not only a complete fabrication, but a ploy to enlist Niko''s well-known skills as a tough guy against the ample list of enemies clamoring for Roma''s debt-ridden blood. Because Roman is the only person Niko knows in Liberty City he begrudgingly accepts his role as Roma''s protector despite the deception. But as time goes on Niko comes into his own, and his experience on the wrong side of the tracks proves more valuable than he could have ever imagined as he fights for survival and later supremacy on the crime ridden streets of Liberty City.</li><li><strong>Game Environments</strong> - Based on several of the boroughs of New York City and parts of New Jersey, Liberty City, familiar to players of previous games in the series, has been entirely redesigned for GTA IV. Players can expect visible detail down to the weeds growing in the cracks in the sidewalk, cars and buildings of visibly different ages and a much greater level if verticality in the buildings and bridges that they are able to explore as Niko moves through the city streets. In addition, pedestrians in GTA IV are much more realistic. No longer simply moving cardboard cutouts, these NPCs are intelligent, modern, human representations that laugh, cry, eat, drink, use cell phones and As, and talking amongst themselves regardless of Niko''s interaction with them.</li><li><strong>Gameplay</strong> - Historically GTA games have focused heavily on mission-based play, requiring successful completion of fixed tasks in order for players to progress through the game, but this has changed to a great extent in GTA IV. Players will experience an entirely new and exciting emphasis centered on the blending of on-mission and off-mission play, resulting not only in an increased sense of realism, but more interesting and unrestricted gameplay.</li></ul>', 'What does the American Dream mean today? For Niko Bellic, fresh off the boat from Europe, it is the hope he can escape his past. For his cousin, Roman, it is the vision that together they can find fortune in Liberty City, gateway to the land of opportunity. As they slip into debt and are dragged into a criminal underworld by a series of shysters, thieves and sociopaths, they discover that the reality is very different from the dream in a city that worships money and status, and is heaven for those who have them and a living nightmare for those who don⴮'
UNION ALL
SELECT 22, 'FIFA 09', 'Sports', CAST('2008-10-14' AS Date), 'Electronic Arts', 'E', 'Step onto the pitch and play professional football your way in FIFA 09. Powered by the third generation of the EA SPORTS football engine, FIFA 09 features more than 250 core gameplay additions and enhancements that deliver the most responsive, intelligent and realistic action ever for the series. Enjoy turning defenders with more controlled dribbling and ball control, snapping off precision shots with improved first-time shooting mechanics and firing beautifully timed passes with greater accuracy, placing the ball exactly where you want it. With new player momentum physics the speed and weight of the player determines everything from the distance of a slide tackle and the power of a header to the severity of player collisions and the height of a player''s jump. Plus, players now behave according to their physical attributes with larger, stronger players dominating collisions, battles for control of the ball, and position in challenges for two player headers.', 'FIFA 09, le nouvel 鰩sode de la s鲩e des jeux de football d''Electronic Arts, est con絠et adapt頰our offrir une exp鲩ence de jeu unique, profitant au mieux des sp飩ficit鳠techniques de chaque plateforme.'
UNION ALL
SELECT 23, 'DOOM 3', 'Shooter', CAST('2004-08-03' AS Date), 'Activision', 'M', 'The story of Doom 3 is conveyed through in-game dialogue and cut scenes, as well as e-mails, audio logs and video files found throughout the game. The game opens Elliott Swann and Jack Campbell arriving at Mars City, the main access to the UACs Mars base, disembarking from an Earth transport, the players anonymous marine just behind them. Swann and Campbell have a heated conference meeting Malcolm Betruger as the first part of investigating the incidents and complaints about the facility, while the marine heads to Master Sergeant Thomas Kelly for orders. Kelly gives the marine instructions to find a scientist from the Delta Labs who has gone missing. The marine finds the scientist in a nearby decommissioned communications facility, where he is frantically trying to send a warning to the UAC on Earth about Betrugers teleportation experiments. However, as he tries to explain the situation to the marine, another teleportation test takes place and loses containment, at which point the entire Mars base is swept by an unnatural shockwave, transforming most of the bases personnel into zombies as the forces of Hell invade through the teleporters portal.', 'Doom 3 is set in the year 2145. Much of the games story and dialogue was created by professional author Matthew J. Costello. According to the games backstory, the Union Aerospace Corporation (UAC) has grown to become the largest corporate entity in existence, and has uped a research facility on Mars. At this base, the UAC are able to conduct research into several scientific areas, including advanced weapons development, biological research, space exploration and teleportation. Due to the facilitys position on Mars, the UAC can perform its operations outside of legal and moral boundaries.'
UNION ALL
SELECT 24, 'Command And Conquer Red Alert 3', 'Strategy', CAST('2008-04-30' AS Date), 'Electronic Arts', 'T', '<ul><li><strong>The Plot</strong>After years of conflict, the Allies are finally on the brink of victory. Cowering behind the walls of the Kremlin, the Soviets decide to turn to one last act of desperation - the use of an experimental time travel device. The mission: to go back in time to eliminate Albert Einstein before he creates the technologies that will lead the Allies to ultimate victory. After a successful mission, the Soviets return to the present, discovering the Allied position has weakened. But before they can truly celebrate, they find out their actions have spawned a new threat and global superpower, the mysterious, technologically advanced, Empire of the Rising Sun. Welcome to World War III.', 'In Red Alert 3, the desperate leadership of a doomed Soviet Union travels back in time to change history and restore the glory of Mother Russia. The time travel mission goes awry, creating an alternate timeline where technology has followed an entirely different evolution, a new superpower has been thrust on to the world stage, and World War III is raging. The Empire of the Rising Sun has risen in the East, making World War III a three-way struggle between the Soviets, the Allies, and the Empire with armies fielding wacky and wonderful weapons and technologies like Tesla coils, heavily armed War Blimps, teleportation, armored bears, intelligent dolphins, floating island fortresses, and transforming tanks.'
UNION ALL
SELECT 25, 'NBA Live 09', 'Sports', CAST('2008-10-07' AS Date), 'Electronic Arts', 'E', '<ul><li><strong>The Plot</strong> - NBA Live 09 is rated E for everyone, a great family game with realistic graphics </li><li><strong>Game Environments</strong> Play in your favorite arenas</li><li><strong>Gameplay</strong> For one or two players</li></ul>', 'NBA Live 09 offers an unparalleled basketball gameplay experience. Dynamic DNA redefines player artificial intelligence. And with the addition of 16 great International teams, and the FIBA tournament, you can now compete as your country in your quest to become the best basketball nation in the world.'
UNION ALL
SELECT 26, 'AMPED 2', 'Sports', CAST('2003-01-10' AS Date), 'Microsoft Game Studios', 'E', 'Explore vast areas of wide-open, spectacularly rendered real mountains packed with terrain parks designed by world-famous snow park architect, Chris Gunnarson. Play head-to-head with friends in the various multiplayer modes. When youre ready to take it to the next level, connect to Xbox Live to check rankings and challenge the worlds best virtual riders. Feel what its like to live the life of a real professional snowboarder. Travel the globe, and pull sick tricks in front of sponsors, photographers, and fans. Build your fame, and get photos and demo reels in the latest snowboard magazine or video. Climb to the top ranks of the sport, and become a media superstar all to the sounds of more than 300 killer indie tracks.', 'Amped is the ultimate freestyle snowboarding experience, offering the largest, most varied trick library of any snowboarding game.'
GO

--====================================================================================
--						populate product information table
--====================================================================================
GO
INSERT INTO [dbo].[productInformation] 
([gameId], [price], [console], [fileLocation], [coverFileLocation])
SELECT 26, 29.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 26, 29.9900, 'PS3', NULL, NULL
UNION ALL 
SELECT 5, 59.9900, 'PS3', NULL, NULL
UNION ALL 
SELECT 5, 59.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 19, 57.4900, 'DS', NULL, NULL
UNION ALL 
SELECT 19, 58.9900, 'SNES', NULL, NULL
UNION ALL 
SELECT 24, 56.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 24, 56.9900, 'PS3', NULL, NULL
UNION ALL 
SELECT 18, 4.9900, 'DS', NULL, NULL
UNION ALL 
SELECT 18, 35.9900, 'PC', NULL, NULL
UNION ALL 
SELECT 23, 19.9900, 'PC', NULL, NULL
UNION ALL 
SELECT 23, 39.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 7, 58.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 7, 57.4900, 'PC', NULL, NULL
UNION ALL 
SELECT 3, 64.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 3, 64.9900, 'PS3', NULL, NULL
UNION ALL 
SELECT 22, 59.9900, 'PS3', NULL, NULL
UNION ALL 
SELECT 22, 59.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 14, 58.9900, 'SNES', NULL, NULL
UNION ALL 
SELECT 14, 57.4900, 'PS1', NULL, NULL
UNION ALL 
SELECT 1, 26.9900, 'DS', NULL, NULL
UNION ALL 
SELECT 1, 58.9900, 'PC', NULL, NULL
UNION ALL 
SELECT 21, 57.4900, 'PS3', NULL, NULL
UNION ALL 
SELECT 21, 58.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 11, 189.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 11, 189.9900, 'PS3', NULL, NULL
UNION ALL 
SELECT 20, 14.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 20, 14.9900, 'PC', NULL, NULL
UNION ALL 
SELECT 13, 29.9900, 'Wii', NULL, NULL
UNION ALL 
SELECT 13, 36.9900, 'PS3', NULL, NULL
UNION ALL 
SELECT 12, 59.9500, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 12, 59.9500, 'PC', NULL, NULL
UNION ALL 
SELECT 8, 23.9800, 'PS2', NULL, NULL
UNION ALL 
SELECT 8, 20.2000, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 25, 48.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 25, 48.4900, 'PS3', NULL, NULL
UNION ALL 
SELECT 16, 59.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 16, 59.9900, 'PS3', NULL, NULL
UNION ALL 
SELECT 2, 59.9900, 'PS3', NULL, NULL
UNION ALL 
SELECT 2, 59.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 2, 59.9900, 'PS2', NULL, NULL
UNION ALL 
SELECT 10, 39.9900, 'PS3', NULL, NULL
UNION ALL 
SELECT 10, 39.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 17, 45.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 17, 99.9500, 'PS3', NULL, NULL
UNION ALL 
SELECT 17, 20.9900, 'PC', NULL, NULL
UNION ALL 
SELECT 6, 58.4900, 'PS3', NULL, NULL
UNION ALL 
SELECT 6, 59.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 15, 69.9900, 'XBox 360', NULL, NULL
UNION ALL 
SELECT 15, 69.9900, 'PS3', NULL, NULL
UNION ALL 
SELECT 4, 58.9900, 'XBox 360', NULL, NULL
UNION ALL
SELECT 4, 57.4900, 'PS3', NULL, NULL
UNION ALL
SELECT 9, 59.9900, 'PS3', NULL, NULL
UNION ALL
SELECT 9, 59.9900, 'XBox 360', NULL, NULL;
GO

--====================================================================================
--							user status table
--====================================================================================
GO
INSERT INTO [dbo].[userStatus] ([status]) VALUES ('administrator')
INSERT INTO [dbo].[userStatus] ([status]) VALUES ('employee')
INSERT INTO [dbo].[userStatus] ([status]) VALUES ('member')
GO

--====================================================================================
--						populate member table
--====================================================================================
GO
INSERT INTO [dbo].[user] ([id], [userStatusid], [username], [password], [givenName], [surname], [email], [phone], [address], [postalCode], [mobile], [fax],[extension], [preferences])
SELECT 1, 2, 'employeeuser', 'pass1234', 'employee1', 'employee', 'employee@mail.com', '9999999999', 'number 1 st', 'A1B 2C3', '6666666666', '7778887777', 'x1234', NULL
UNION ALL
SELECT 2, 3, 'coreUser', 'pass1234', 'core', 'team', 'coregroup@mail.com', '9999999999', 'North st', 'A1C 2B3', '6666666666', NULL, NULL, NULL
UNION ALL
SELECT 3, 3, 'core-brother', 'pass1234', 'lil', 'bro', 'lilbro@mail.com', '9999999999', 'North st', 'A1C 2B3', '6666666666', NULL, NULL, NULL
UNION ALL
SELECT 4, 3, 'randomUser', 'pass1234', 'random', 'user', 'rngsus@mail.com', '9999999999', 'number 6 st', 'B2A 3C1', NULL, NULL, NULL, NULL;
GO

--====================================================================================
--							report type table
--====================================================================================
GO
INSERT INTO [dbo].[reportType] ([type]) VALUES ('Game List')
INSERT INTO [dbo].[reportType] ([type]) VALUES ('Game Detail')
INSERT INTO [dbo].[reportType] ([type]) VALUES ('Member List')
INSERT INTO [dbo].[reportType] ([type]) VALUES ('Member Detail')
INSERT INTO [dbo].[reportType] ([type]) VALUES ('Wish List')
INSERT INTO [dbo].[reportType] ([type]) VALUES ('Sales')
INSERT INTO [dbo].[reportType] ([type]) VALUES ('Other')
GO

-- GAME LIST REPORT --
UPDATE reportType SET
template = 
'@model IEnumerable<CVGS.Models.Game>@{ViewBag.Title = "Game List Report";}<table><thead><tr><th>Game Id</th><th>Game Name</th></tr></thead><tbody>@foreach (var item in Model) {<tr><td>@Html.DisplayFor(modelItem => item.id)</td><td>@Html.DisplayFor(modelItem => item.title)</td></tr>}</tbody></table>'
WHERE id = 1;

-- GAME DETAIL REPORT --
UPDATE reportType SET
template = 
'@model CVGS.Models.Game@{ViewBag.Title = "Game Details Report";}<table><thead><tr><th>Game Id</th><th colspan="2">Game Name</th><th>Genre</th><th>ESRB Rsting</th><th>Developer</th><th>Game Description</th></tr></thead><tbody><tr><td>@Html.DisplayFor(model => model.gameId)</td><td colspan="2">@Html.DisplayFor(model => model.Game.title)</td><td>@Html.DisplayFor(model => model.Game.genre)</td><td>@Html.DisplayFor(model => model.Game.esrbRating)</td><td>@Html.DisplayFor(model => model.Game.developer)</td><td>
@Html.DisplayFor(model => model.Game.details)</td></tr>}</tbody><tfoot><tr><th>Base Price</th><th>Sale %</th><th>Current Price</th><th>Released</th><th colspan="2">Pre-Orders</th><th>Post-Orders</th></tr><tr><td rowspan="3">@Html.DisplayFor(model => model.price)</td><td rowspan="3">n/a</td><td rowspan="3">@Html.DisplayFor(model => model.price)</td><td rowspan="3">@{ DateTime release = DateTime.Parse(Model.releaseDate);if (release < DateTime.Now.AddDays(1)) {Html.Display("True");} else if (release > DateTime.Now) {Html.Display("False");}}</td><td colspan="2">s</td><td>s</td></tr><tr><th colspan="2">Number of Reviews</th><th>Overall Review Score</th></tr><tr><td colspan="2">@{List<CVGS.Models.GameReview> list = Model.GameReviews;Html.Display(list.Count.ToString());}</td><td>@{int count = 0;int total = 0;foreach (var review in list) {if (review.rating.HasValue) {total += review.rating.Value;count++;}}if (count > 0) {Html.Display((total / count).ToString());} else {Html.Display("N/A");}}</td></tr></tfoot></table>'
WHERE id = 2;

-- MEMBER LIST REPORT --
UPDATE reportType SET
template = 
'@model  IEnumerable<CVGS.Models.Member>@{ViewBag.Title = "Member List Report";}<table><thead><tr><th>Member Id</th><th>First Name</th><th>Last Name</th></tr></thead><tbody>@foreach (var item in Model) {<tr><td>@Html.DisplayFor(model => model.id)</td><td>@Html.DisplayFor(model => model.givenName)</td><td>@Html.DisplayFor(model => model.surname)</td></tr>}</tbody></table>'
WHERE id = 3;

-- MEMBER DETAIL REPORT --
UPDATE reportType SET
template = 
'@model CVGS.Models.Member@{ViewBag.Title = "Member Details Report";}<table><thead><tr><th>Member Id</th><th>First Name</th><th>Last Name</th><th>Username</th><th>Email</th></tr></thead><tbody><tr><td>@Html.DisplayFor(model => model.id)</td><td>@Html.DisplayFor(model => model.givenName)</td><td>@Html.DisplayFor(model => model.surname)</td><td>@Html.DisplayFor(model => model.username)</td><td>@Html.DisplayFor(model => model.email)</td></tr></tbody></table>'
WHERE id = 4;

-- WISH LIST REPORT --
UPDATE reportType SET
template = 
'@model IEnumerable<CVGS.Models.WishList>@{ViewBag.Title = "Wish List Report";}@Html.DisplayNameFor(model => model.First().User.username)''s Wish List<table><thead><tr><th>Game Id</th><th>Game Name</th></tr></thead><tbody>@foreach (var item in Model) {<tr><td>@Html.DisplayFor(modelItem => item.gameId)</td><td>@Html.DisplayFor(modelItem => item.Game.title</td></tr>}</tbody></table>'
WHERE id = 5;

--select * from reportType

--====================================================================================
--							report table
--====================================================================================
GO
INSERT INTO [dbo].[report] ([reportTypeId]) 
SELECT 1
UNION ALL
SELECT 2
UNION ALL
SELECT 3
UNION ALL
SELECT 4
UNION ALL
SELECT 5
GO

--====================================================================================
--							event types table
--====================================================================================
GO
INSERT INTO [dbo].[eventType] ([type]) VALUES ('Sale')
INSERT INTO [dbo].[eventType] ([type]) VALUES ('Competition')
GO

--====================================================================================
--						populate events table
--====================================================================================
GO
INSERT INTO [dbo].[event] ([id], [name], [date], [time], [location], [description], [eventTypeId], [userId])
VALUES (1, 'Game Bois Own No0bs', '2017-10-13', '1990-01-01T00:00:00.000', 'The Internet', 'OWN NOO00bs', 1, 1)
INSERT INTO [dbo].[event] ([id],[name], [date], [time], [location], [description], [eventTypeId], [userId])
VALUES (2, 'Get Owned', '2017-10-13','1990-01-01T14:13:56.263', 'The Internet', 'We get owned only no0 allowed', 1, 1)
GO

--====================================================================================
--						populate event attendee table
--====================================================================================
GO
INSERT INTO [dbo].[eventAttendee] (eventId, userId, notes)
SELECT 1, 2, NULL
UNION ALL
SELECT 2, 2, NULL
UNION ALL
SELECT 1, 4, NULL
UNION ALL
SELECT 2, 3, NULL;
GO

--====================================================================================
--						Add Game Reviews
--====================================================================================
GO
INSERT INTO [dbo].[gameReview] ([id], [gameId], [userId], [rating], [details])
SELECT 1, 1, 2, 4, 'game good'
UNION ALL
SELECT 2, 2, 3, NULL, 'boring lol'
UNION ALL
SELECT 3, 1, 3, 5, NULL;
GO

--====================================================================================
--						populate wish lists
--====================================================================================
GO
INSERT INTO [dbo].[wishList] ([gameId], [userId], [date])
SELECT 1, 3, CONVERT(date, GETDATE())
UNION ALL
SELECT 3, 2, CONVERT(date, GETDATE())
UNION ALL
SELECT 16, 3, CONVERT(date, GETDATE());
GO

--====================================================================================
--						populate relatives lists
--====================================================================================
GO
INSERT INTO [dbo].[relativeList] ([user1_id], [user2_id])
SELECT 2, 3
UNION ALL
SELECT 3, 2;
GO

select * from [dbo].[user];