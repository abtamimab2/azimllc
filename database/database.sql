
CREATE DATABASE IF NOT EXISTS shahirOnline;
USE shahirOnline;


CREATE TABLE users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    userName VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(50) NOT NULL,
    userPhotoPath VARCHAR(100) NOT NULL,
    userType VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    gender INT NOT NULL,
    dob Date NOT NULL,
    password VARCHAR(255) NOT NULL,
    resetTokkenHash varchar(64) NULL UNIQUE DEFAULT NULL,
    resetTokkenExAt DATETIME NULL DEFAULT NULL
);
/* password: 1234qwer */
INSERT INTO users (firstName, lastName, userName, phoneNumber, userPhotoPath, userType, address, email, gender, dob, password)
VALUES ("Admin", "Admin", "admin", "078564334", "admin.jpg", "admin", "Kabul Shahre now", "admin@gmail.com", 1, '2000-03-24', '$2y$10$P/0JWM95Jcs1v0/rHNPHFu48jveB0joBLth9gtU.vZ.Z0DqJCh1Pm');
INSERT INTO users (firstName, lastName, userName, phoneNumber, userPhotoPath, userType, address, email, gender, dob, password)
VALUES ("Ahmad", "Ahmadi", "ahmadi123", "078564334", "user2.jpg", "user", "Kabul Shahre now", "ahmad@gmail.com", 1, '2000-03-24', '$2y$10$P/0JWM95Jcs1v0/rHNPHFu48jveB0joBLth9gtU.vZ.Z0DqJCh1Pm');
INSERT INTO users (firstName, lastName, userName, phoneNumber, userPhotoPath, userType, address, email, gender, dob, password)
VALUES ("Mahmoud", "Mahmoudi", "mahmoudi", "078564334", "user3.jpg", "user", "Kabul Shahre now", "mahmoudi@gmail.com", 1, '2000-03-24', '$2y$10$P/0JWM95Jcs1v0/rHNPHFu48jveB0joBLth9gtU.vZ.Z0DqJCh1Pm');
INSERT INTO users (firstName, lastName, userName, phoneNumber, userPhotoPath, userType, address, email, gender, dob, password)
VALUES ("Farid", "Moshiri", "Moshiri", "078564334", "user4.jpg", "user", "Kabul Shahre now", "moshiri@gmail.com", 1, '2000-03-24', '$2y$10$P/0JWM95Jcs1v0/rHNPHFu48jveB0joBLth9gtU.vZ.Z0DqJCh1Pm');
INSERT INTO users (firstName, lastName, userName, phoneNumber, userPhotoPath, userType, address, email, gender, dob, password)
VALUES ("Qadir", "Moqtadir", "Moqtadiri", "078564334", "user5.jpg", "user", "Kabul Shahre now", "qadir@gmail.com", 1, '2000-03-24', '$2y$10$P/0JWM95Jcs1v0/rHNPHFu48jveB0joBLth9gtU.vZ.Z0DqJCh1Pm');


CREATE TABLE company (
    companyID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    logoPhotoPath VARCHAR(100)
);
INSERT INTO company VALUE (1,"Toshiba","yihang.png");
INSERT INTO company VALUE (2,"Logitech","logitech.png");
INSERT INTO company VALUE (3,"Steelseries","Steelseries.png");
INSERT INTO company VALUE (4,"Oral B","oral_b.png");
INSERT INTO company VALUE (5,"Samsung","samsung.png");


CREATE TABLE category (
    categoryID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    iconPhotoPath VARCHAR(100)
);

INSERT INTO category VALUE (1,"Kitchen","kitchen.png");
INSERT INTO category VALUE (2,"Electronics","electronics.jpg");
INSERT INTO category VALUE (3,"Health Care","health_care.png");
INSERT INTO category VALUE (4,"Home","home.png");
INSERT INTO category VALUE (5,"Office","office.png");
INSERT INTO category VALUE (6,"Children","children.png");

CREATE TABLE product (
    productID INT AUTO_INCREMENT PRIMARY KEY,
    pname VARCHAR(50) NOT NULL,
	pTitle VARCHAR(500) NOT NULL,
	pDescription VARCHAR(1000) NOT NULL,
	qtyStock INT NOT NULL,
	purchasePrice INT NOT NULL,
	salesPrice INT NOT NULL,
	weight INT NOT NULL,
	discoutPercentage INT NOT NULL,
	pBrand INT NOT NULL,
	pCategory INT NOT NULL,
	FOREIGN KEY (pBrand) REFERENCES company(companyID),
	FOREIGN KEY (pCategory) REFERENCES category(categoryID)
);

INSERT INTO product VALUE (1, "Mixing Bowls Set", "YIHONG 6 Pcs Plastic Mixing Bowls Set, Colorful Serving Bowls for Kitchen, Ideal for Baking, Prepping, Cooking and Serving Food, Nesting Bowls for Space Saving Storage, Rainbow","Our colorful plastic mixing bowls have all the sizes you need for cooking, baking and more, set includes 5.28, 3.59, 2.22, 1.27, 0.69, 0.29quart, great to use for serving bowls to serve fruits, salad bowls, ingredient, cereal bowls, cookie bowls,and much more.",300,35, 42,2,0,1,1);
INSERT INTO product VALUE (2, "Mixing Bowls Set", "YIHONG 6 Pcs Stainless Steel Mixing Bowls with Lids, Metal Nesting Mixing Bowls Set for Mixing, Baking,Serving,Food Prep, Size 7, 5, 4, 3, 2, 1.5QT, with Colorful Non-Slip Bottoms","Check this out! Our stainless steel mixing bowls are great choice for your kitchen, each bowl is made of high-quality stainless steel, which is resistant and rustproof, what's more, our each bowl comes with silicone bottom to keep it steady on while mixing, kneading or whipping food, you and your family can use it with peace of mind.",100,40, 47,3,10,1,1);
INSERT INTO product VALUE (3, "Gaming Headset", "Logitech G335 Wired Gaming Headset, with Flip to Mute Microphone, 3.5mm Audio Jack, Memory Foam Earpads, Lightweight, Compatible with PC, PlayStation, Xbox, Nintendo Switch - Black","Take your gaming to the next level with Logitech G335 Wired Gaming Headset. These gaming headphones are lightweight and use a suspension headband design to help distribute weight and relieve pressure points. The elastic headband is adjustable and reversible for a customized look and fit. Soft memory foam ear cups and sports mesh material allow for long-lasting comfort, so you don't have to pause the game. G335 is easy to set up. Simply plug into your game with the 3.5 mm audio jack directly into your PC, laptop, gaming console/controller, or mobile device. The G335 gaming headset with mic is a versatile gaming companion. Easily control the volume or adjust the the microphone to fit all of your gaming needs. The colorful G335 headset is a smaller, lighter version of the award-winning G733 wireless gaming headset. G335 is even Discord Certified and available in a range of colors to fit your individual style.",200,28, 39,0.53,0,2,2);
INSERT INTO product VALUE (4, "Gaming Keyboard", "SteelSeries Apex 7 Mechanical Gaming Keyboard – OLED Smart Display – USB Passthrough and Media Controls – Linear , Quiet – RGB Backlit (Red Switch)","Red switches are known for their consistently smooth movement from top to bottom without any bump, allowing for lightning-fast actuation. An integrated OLED smart display with on-board storage is your command center for on-the-fly info from your game, Spotify, or discord, and provides software-free customization for tweaking and saving your settings. An unbreakable aluminum alloy frame makes it a standout mechanical keyboard.",100,115, 152,2.1,20,3,2);
INSERT INTO product VALUE (5, "Electric Toothbrush", "Oral-B Sensitive Gum Care Electric Toothbrush Replacement Brush Heads, 6 Count","The Oral-B Sensitive Gum Care electric toothbrush replacement head features extra soft bristles for a superior* gentle clean, ideal for cleaning around sensitive and inflamed areas. The round brush head is inspired by dental professional tools for a tooth-by-tooth clean, with specially engineered bristles for optimal tooth coverage. Indicator bristles signal time to replace brush head. Dentists recommend changing your brush head every 3 months. *vs. a regular manual toothbrush",500,14, 28,0.21,0,4,3);
INSERT INTO product VALUE (8, "Samsug Tv", "tv Man Toothbrush for Little Children Ages 3+ Years Old, Extra Soft, Pack of 6","Oral-B Kids manual toothbrush featuring Marvel Spiderman character is the perfect kids toothbrush for your own little superhero. Crest + Oral-B Kids helps kids brush their best with products designed to support healthy oral hygiene. Help your little ones practice proper oral care habits that will last them a lifetime. Oral-B is the #1 recommended toothbrush brand by dentists worldwide",1000,6, 400,0.12,0,5,2);
INSERT INTO product VALUE (9, "Samsug Mobile a10", "Samsung Toothbrush for Little Children Ages 3+ Years Old, Extra Soft, Pack of 6","Oral-B Kids manual toothbrush featuring Marvel Spiderman character is the perfect kids toothbrush for your own little superhero. Crest + Oral-B Kids helps kids brush their best with products designed to support healthy oral hygiene. Help your little ones practice proper oral care habits that will last them a lifetime. Oral-B is the #1 recommended toothbrush brand by dentists worldwide",1000,6, 570,0.12,0,5,2);
INSERT INTO product VALUE (10, "Samsug Mobile s6", "mobile Toothbrush for Little Children Ages 3+ Years Old, Extra Soft, Pack of 6","Oral-B Kids manual toothbrush featuring Marvel Spiderman character is the perfect kids toothbrush for your own little superhero. Crest + Oral-B Kids helps kids brush their best with products designed to support healthy oral hygiene. Help your little ones practice proper oral care habits that will last them a lifetime. Oral-B is the #1 recommended toothbrush brand by dentists worldwide",1000,6, 300,0.12,0,5,2);



CREATE TABLE PImages (
    PImagesID INT AUTO_INCREMENT PRIMARY KEY,
    PImagesPP VARCHAR(100) NOT NULL,
    productID INT NOT NULL,
	FOREIGN KEY (productID) REFERENCES product(productID)
);
INSERT INTO PImages VALUE (1,"(1).jpg",1);
INSERT INTO PImages VALUE (2,"(2).jpg",1);
INSERT INTO PImages VALUE (3,"(3).jpg",1);
INSERT INTO PImages VALUE (4,"(4).jpg",1);
INSERT INTO PImages VALUE (5,"(5).jpg",1);
INSERT INTO PImages VALUE (6,"(6).jpg",1);
INSERT INTO PImages VALUE (7,"(7).jpg",2);
INSERT INTO PImages VALUE (8,"(8).jpg",2);
INSERT INTO PImages VALUE (9,"(9).jpg",2);
INSERT INTO PImages VALUE (10,"(10).jpg",2);
INSERT INTO PImages VALUE (11,"(11).jpg",2);
INSERT INTO PImages VALUE (12,"(12).jpg",2);
INSERT INTO PImages VALUE (13,"(13).jpg",3);
INSERT INTO PImages VALUE (14,"(14).jpg",3);
INSERT INTO PImages VALUE (15,"(15).jpg",3);
INSERT INTO PImages VALUE (16,"(16).jpg",3);
INSERT INTO PImages VALUE (17,"(17).jpg",3);
INSERT INTO PImages VALUE (18,"(18).jpg",4);
INSERT INTO PImages VALUE (19,"(19).jpg",4);
INSERT INTO PImages VALUE (20,"(20).jpg",4);
INSERT INTO PImages VALUE (21,"(21).jpg",4);
INSERT INTO PImages VALUE (22,"(22).jpg",4);
INSERT INTO PImages VALUE (23,"(23).jpg",4);
INSERT INTO PImages VALUE (24,"(24).jpg",5);
INSERT INTO PImages VALUE (25,"(25).jpg",5);
INSERT INTO PImages VALUE (26,"(26).jpg",5);
INSERT INTO PImages VALUE (27,"(27).jpg",5);
INSERT INTO PImages VALUE (28,"(28).jpg",5);
INSERT INTO PImages VALUE (29,"(29).jpg",5);
INSERT INTO PImages VALUE (32,"(32).jpg",8);
INSERT INTO PImages VALUE (33,"(33).jpg",8);
INSERT INTO PImages VALUE (34,"(34).jpg",8);
INSERT INTO PImages VALUE (36,"(36).jpg",8);
INSERT INTO PImages VALUE (37,"(37).jpg",8);
INSERT INTO PImages VALUE (38,"(38).jpg",8);
INSERT INTO PImages VALUE (39,"(39).jpg",9);
INSERT INTO PImages VALUE (40,"(40).jpg",9);
INSERT INTO PImages VALUE (41,"(41).jpg",9);
INSERT INTO PImages VALUE (42,"(42).jpg",9);
INSERT INTO PImages VALUE (43,"(43).jpg",10);
INSERT INTO PImages VALUE (44,"(44).jpg",10);
INSERT INTO PImages VALUE (45,"(45).jpg",10);
INSERT INTO PImages VALUE (46,"(46).jpg",10);




CREATE TABLE orders (
    ordersID INT AUTO_INCREMENT PRIMARY KEY,
    orderDate Date NOT NULL,
	state INT NOT NULL,
	totalPrice INT NOT NULL,
	userID INT NOT NULL,
	firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    userName VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(50) NOT NULL,
    userPhotoPath VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);
CREATE TABLE orderDetail (
    orderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    quantity INT NOT NULL,
    ordersID INT NOT NULL,
    productID INT NOT NULL,
    productName VARCHAR(50) NOT NULL,
    productTittle VARCHAR(500) NOT NULL,
	productDescription VARCHAR(1000) NOT NULL,
	price INT NOT NULL,
	productPhotoName VARCHAR(500) NOT NULL,
	companyName VARCHAR(500) NOT NULL,
	categoryName VARCHAR(500) NOT NULL,
	FOREIGN KEY (ordersID) REFERENCES orders(ordersID)
);

CREATE TABLE card (
    cardID INT AUTO_INCREMENT PRIMARY KEY,
    PFimgurl VARCHAR(500) NOT NULL,
	productName VARCHAR(50) NOT NULL,
	quantity INT NOT NULL,
	productID INT NOT NULL,
	userID INT NOT NULL,
	FOREIGN KEY (productID) REFERENCES product(productID) ON DELETE CASCADE,
	FOREIGN KEY (userID) REFERENCES users(userID) ON DELETE CASCADE
);

CREATE TABLE wishlist (
    wishlistID INT AUTO_INCREMENT PRIMARY KEY,
	PFimgurl VARCHAR(500) NOT NULL,
	productName VARCHAR(50) NOT NULL,
	productID INT NOT NULL,
	userID INT NOT NULL,
	FOREIGN KEY (productID) REFERENCES product(productID) ON DELETE CASCADE,
	FOREIGN KEY (userID) REFERENCES users(userID) ON DELETE CASCADE
);

CREATE TABLE message (
    messageID INT AUTO_INCREMENT PRIMARY KEY,
    detail VARCHAR(500) NOT NULL,
	state INT NOT NULL,
	userID INT NOT NULL,
	firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
	userPhotoPath VARCHAR(100) NOT NULL
);



CREATE TABLE review (
  reviewID INT AUTO_INCREMENT PRIMARY KEY,
  rating INT NOT NULL,
  detail VARCHAR(500) NOT NULL,
  userName VARCHAR(100) NOT NULL,
  userPhotoPath VARCHAR(200) NOT NULL,
  reviewDate Date NOT NULL,
  productID INT NOT NULL,
  userID INT NOT NULL,
  ordersID INT NOT NULL,
  FOREIGN KEY (ordersID) REFERENCES orders(ordersID),
  FOREIGN KEY (productID) REFERENCES product(productID),
  FOREIGN KEY (userID) REFERENCES users(userID)
);

CREATE TABLE slideshow (
  slideshowID INT AUTO_INCREMENT PRIMARY KEY,
  title1 VARCHAR(500) NOT NULL,
  title2 VARCHAR(500) NOT NULL,
  title3 VARCHAR(500) NOT NULL,
  link VARCHAR(500) NOT NULL,
  photopath VARCHAR(500) NOT NULL
);


INSERT INTO slideshow VALUE (null, "Sale Offer Black Friday This Week", "Work Desk Surface", "Starting at $1599.00","https://google.com","slideshow1.jpg");
INSERT INTO slideshow VALUE (null, "Sale Offer -20% Off This Week", "Chamcham Galaxy", "Starting at $58900","https://google.com","slideshow2.jpg");
INSERT INTO slideshow VALUE (null, "Sale Offer -10% Off this Week", "Phantom 4 Pro +", "Starting at $809.00","https://google.com","slideshow3.jpg");

CREATE TABLE bunner_ads (
  `id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `link` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL
);


INSERT INTO `bunner_ads` (`id`,`link` ,`thumbnail`) VALUES
(1,'https://google.com','one.jpg'),
(2,'https://google.com','tow.jpg'),
(3,'https://google.com','three.jpg');


