DROP DATABASE IF EXISTS ApolloWatches;

CREATE DATABASE ApolloWatches;

USE ApolloWatches;

DROP TABLE IF EXISTS `AdminAccount`, `CartItems`, `HistoryItems`, `PurchaseHistory`, `ShoppingCart`, `UserAccount`, `Product`;

CREATE TABLE `Product` (
	`productID` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`productName` VARCHAR(100) NOT NULL,
	`productManufacturer` VARCHAR(100) NOT NULL,
	`productPrice` DECIMAL(6,2) NOT NULL,
	`productDescription` VARCHAR(1000) NOT NULL,
	`productMaterials` VARCHAR(100) NOT NULL,
	`productImage` VARCHAR(150) NOT NULL,
	`productCategory` VARCHAR(20) NOT NULL
);

CREATE TABLE `UserAccount` (
	`userID` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`userName` VARCHAR(50) NOT NULL,
	`userPassword` VARCHAR(50) NOT NULL,
	`accountStatus` BIT NOT NULL
);

CREATE TABLE `ShoppingCart` (
	`cartID` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `userID` INT,
	FOREIGN KEY (`userID`) REFERENCES `UserAccount`(`userID`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `PurchaseHistory` (
	`purchaseHistoryID` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `userID` INT,
	FOREIGN KEY (`userID`) REFERENCES `UserAccount`(`userID`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `HistoryItems` (
	`historyItemsID` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `productID` INT,
	FOREIGN KEY (`productID`) REFERENCES `Product`(`productID`) ON UPDATE CASCADE ON DELETE CASCADE,
	`quantity` INT NOT NULL,
    `purchaseHistoryID` INT,
	FOREIGN KEY (`purchaseHistoryID`) REFERENCES `PurchaseHistory`(`purchaseHistoryID`) ON UPDATE CASCADE
);

CREATE TABLE `CartItems` (
	`cartItemsID` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `productID` INT,
	FOREIGN KEY (`productID`) REFERENCES `Product`(`productID`) ON UPDATE CASCADE ON DELETE CASCADE,
	`quantity` INT NOT NULL,
    `cartID` INT,
	FOREIGN KEY (`cartID`) REFERENCES `ShoppingCart`(`cartID`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `AdminAccount` (
	`adminID` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`adminName` VARCHAR(50) NOT NULL,
	`adminPassword` VARCHAR(50) NOT NULL,
	`adminEmail` VARCHAR(50) NOT NULL
);

INSERT INTO `Product` (`productName`, `productManufacturer`, `productPrice`, `productDescription`, `productMaterials`, `productImage`, `productCategory`)
VALUES	('Focus Watch', 'Hugo Boss', 319.00, 'This luxury watch boasts a chronograph movement with subtle branded detailing throughout. Spare yet substantial, the watch is complete with a durable stainless steel case and a textured leather strap.',
		'Stainless steel and leather', '~/images/menswatch1.jpg', 'Men'),
		('Dare Watch', 'Hugo Boss', 349.00, 'Simple styling, perfectly accented by designer details, this watch features a quality three-hand mechanism with a durable stainless steel case. The watch is complete with a complementary bracelet strap for a sophisticated finish.',
		 'Stainless steel', '~/images/menswatch2.jpg', 'Men'),
		('Achieve Watch', 'Calvin Klein', 349.00, 'Calvin Klein achieve polished stainless steel case', 'Stainless steel', '~/images/menswatch3.jpg', 'Men'),
		('Men''s Black Watch', 'Armani Exchange', 289.00, 'This 44mm watch features a black dial, three-hand movement and black stainless steel bracelet.', 'Stainless steel', '~/images/menswatch4.jpg', 'Men'),
		('Birch Klinga Watch', 'Triwa', 249.00, 'Classic, thin and elegant. Interpreted in polished stainless steel, contrasting brushed champagne dial and matched with a stainless steel mesh bracelet.',
		 'Stainless steel', '~/images/menswatch5.jpg', 'Men'),
		('Black Chronograph Watch', 'Emporio Armani', 649.00, 'Radiating power, this aviator-inspired men''s Emporio Armani watch is handsomely equipped with a polished stainless-steel case, blue sunray chronograph curve dial, three lum hands and a date window. This watch is held on your wrist by a black mesh bracelet secured by a safety mesh buckle. If you like to sway away from the norm, this watch is definitely for you.',
		 'Stainless steel', '~/images/menswatch6.jpg', 'Men'),
		('Carson Watch', 'Tissot', 825.00, 'Exquisite', 'Stainless steel and leather', '~/images/menswatch7.jpg', 'Men'),
		('Cooper Watch', 'Tommy Hilfiger', 249.00, 'A lovely gold watch', 'Gold plated stainless steel', '~/images/menswatch8.jpg', 'Men'),
		('Rasp Brown Watch', 'Diesel', 309.00, 'This Diesel Rasp NSBB watch features a black dial with stick indexes, iridescent crystal lens, three-hand movement and brown leather strap.', 'Stainless steel and leather', '~/images/menswatch9.jpg', 'Men'),
		('Anita Analogue Watch', 'Skagen', 229.00, 'Once you set eyes on this alluring women''s analogue from Skagen, we can guarantee that you won''t be able to think of anything else. This rose-gold-toned women''s analogue watch from the Anita collection features three silver hand movemnets and time-stops are trimmed in sparkling pav, while the two-tone bracelet strap is accented with stainless steel for a textural twist and rose-gold top ring. It is a perfect fit for ladies and fits the high-class style making it a stylish fashion statement in itself.',
		 'Stainless steel', '~/images/womenswatch1.jpg', 'Women'),
		('Endless Leather Watch', 'Fossil', 189.00, 'Delicate. Joyful. This discrete and refined timepiece reflects femininity in all of its glory.',
		 'Stainless steel and leather', '~/images/womenswatch2.jpg', 'Women'),
		('Jacqueline Brown Watch', 'Fossil', 159.00, 'This 36x42mm Jacqueline features a white matte dial with stick indices, three-hand date movement and brown leather strap.',
		 'Stainless steel and leather', '~/images/womenswatch3.jpg', 'Women'),
		('Virginia Watch', 'Fossil', 219.00, 'Shiny steel meets dramatic glitz made for modern sophisticates and vintage enthusiasts alike, the ever-chic Virginia is a stylish wrist essential.',
		 'Stainless steel', '~/images/womenswatch4.jpg', 'Women'),
		('Rose Watch', 'Bering', 299.00, 'The polished rose gold coloured stainless steel case, made of pure, high quality, medical-grade stainless steel (316L), in combination with the blue coloured Milanese mesh strap, provides the classic BERING look. The minimalist Sunray dial protected by crystal clear and scratch-resistant sapphire crystal, gives the watch a subtle touch of elegance.',
		 'Stainless steel, rose gold and Milanese', '~/images/womenswatch5.jpg', 'Women'),
		('Case Cuff Watch', 'Olivia Burton', 249.00, 'It''s time to take your accessorising game to the next level. Like jewellery for your watch, our innovative case cuffs can be clipped on for extra impact or easily removed on days when you''re feeling a less is more vibe. Be the first to adorn your wrist with our exciting new design. This 38mm-wide gold-plated style is complemented by a soft, smooth black leather strap.',
		 'Gold plated stainless steel and leather', '~/images/womenswatch6.jpg', 'Women'),
		('Lovely Square Watch', 'Tissot', 450.00, 'Really lovely.',
		 'Stainless steel', '~/images/womenswatch7.jpg', 'Women'),
 		('Classic Watch', 'Marc Jacobs', 379.00, 'New for Spring 2017, the Marc Jacobs Classic watch showcases the brand''s signature style with a white satin-finish dial and the letters M A R C as the first four indexes. A polished rose gold-tone 36mm case and three-link bracelet add a cool finishing touch.',
		 'Stainless steel', '~/images/womenswatch8.jpg', 'Women'),
		('James - Red/Rose Gold Watch', 'Ted Baker', 249.00, 'This Ted Baker Watch will make a great addition to your everyday styling. It features a three hand movement, a chronograph dial and a genuine leather strap.',
		 'Stainless steel and leather', '~/images/womenswatch9.jpg', 'Women');

INSERT INTO `UserAccount` (`userName`, `userPassword`, `accountStatus`)
VALUES	('tobias', '1A1DC91C907325C69271DDF0C944BC72', 1),
		('john', '1A1DC91C907325C69271DDF0C944BC72', 1),
		('alf', '1A1DC91C907325C69271DDF0C944BC72', 1);

INSERT INTO `AdminAccount` (`adminName`, `adminPassword`, `adminEmail`)
VALUES ('admin', '21232F297A57A5A743894A0E4A801FC3', 'admin@apollowatches.com');

INSERT INTO `ShoppingCart` (`userID`)
VALUES (1),(2),(3);

INSERT INTO `CartItems` (`cartID`, `productID`, `quantity`)
VALUES	(1, 3, 1), (1, 12, 1), (2, 5, 1), (3, 17, 1);

INSERT INTO `PurchaseHistory` (`userID`)
VALUES (1), (2), (3);

INSERT INTO `HistoryItems` (`productID`, `quantity`, `purchaseHistoryID`)               
VALUES (1, 4, 1), (3, 14, 3);                                                                                          