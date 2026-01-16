DROP DATABASE IF EXISTS SEC03GR11;
CREATE DATABASE IF NOT EXISTS SEC03GR11;
USE SEC03GR11;


CREATE TABLE Product (
    prod_ID CHAR(13) NOT NULL,
    prod_name VARCHAR(100) NOT NULL,
    prod_status VARCHAR(10),
    prod_pic1 VARCHAR(200) NOT NULL,
    prod_pic2 VARCHAR(200),
    prod_pic3 VARCHAR(200),
    prod_pic4 VARCHAR(200),
    prod_category VARCHAR(30) NOT NULL,
    prod_seasons VARCHAR(30) NOT NULL,
    prod_description VARCHAR(500) NOT NULL,
    prod_price INT NOT NULL,
    prod_quantity INT NOT NULL,
    PRIMARY KEY (prod_ID)
);

-- SELECT * FROM Product WHERE prod_name <> ''
-- AND prod_name LIKE '%sport%'

-- select * from login_logs
-- SHOW CREATE TABLE login_logs;
-- ALTER TABLE login_logs drop FOREIGN KEY login_logs_ibfk_1;
-- SELECT table_name,table_schema FROM information_schema.tables where table_schema = 'SEC03GR11';
-- select * from product where prod_ID = 'PRD5Q6JJNCQCH'
-- select * from login_logs where prod_ID = 'PRD5Q6JJNCQCH'
/*DELETE FROM Product WHERE prod_ID = 'PRD5Q6JJNCQCH'*/
INSERT INTO Product (prod_ID, prod_name, prod_status, prod_pic1, prod_pic2, prod_pic3, prod_pic4, prod_category, prod_seasons, prod_description, prod_price, prod_quantity) VALUES
('PRDZUVFA7PK07', 'CALIFORNIA CABLE KNIT TOP WHITE', NULL, 'https://jellybunny.com/cdn/shop/files/B25SATL032_WHT000_1_c918f6f8-e757-4b5e-8662-57a02750f335.jpg?v=1739788813&width=1800', 'https://jellybunny.com/cdn/shop/files/B25SATL032_WHT000_2_63d90ac0-c684-4469-8158-aa8ae9fb05f2.jpg?v=1739788813&width=2000', 'https://jellybunny.com/cdn/shop/files/B25SATL032_WHT000_3_32acd3d3-2d7b-4569-94a6-b7649ebaceb2.jpg?v=1739788813&width=2000', 'https://jellybunny.com/cdn/shop/files/B25SATL032_WHT000_3_32acd3d3-2d7b-4569-94a6-b7649ebaceb2.jpg?v=1739788813&width=2000', 'WOMEN', 'Winter', 'The California Cable Knit Top from Jelly Bunny features a classic cable knit design with bow-tied sleeves and floral embroidery with text detail on the chest. Crafted from quality knitted fabric for soft comfort, this collared cropped silhouette offers versatile styling options, perfect for mixing and matching with pants or skirts for various looks.', 1590, 7),
('PRDBIMSP9MHVP', 'SPORT CLUB DENIM TRACK PANTS BLUE', NULL, 'https://jellybunny.com/cdn/shop/files/B25SAQL004_BLU000_1_f4a45700-5a17-476c-bc40-e817a5726ad1.jpg?v=1735026152&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAQL004_BLU000_2_9044368a-6628-4e69-9e3b-7ad278de4c0e.jpg?v=1735026152&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAQL004_BLU000_3_f1e71590-de89-4698-8295-f35ea5c32fda.jpg?v=1735026152&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAQL004_BLU000_4_e0fbc106-5858-4a1d-a0ec-9afd9feb815b.jpg?v=1735026152&width=1200', 'WOMEN', 'ALL', 'Blend sporty and sweet in these relaxed-fit denim track pants featuring playful JB varsity patches and side stripes. The light-wash denim offers a soft, casual feel while the elastic waistband and drawstring ensure perfect comfort. Decorated with charming star details and bunny motifs, these pants combine athleisure style with whimsical Jelly Bunny flair. Side pockets add practical functionality to this adorable everyday piece.', 1790, 3),
('PRDA0GORKTA65', 'PASTEL STRIPE POLO KNIT TOP MULTI COLOR', NULL, 'https://jellybunny.com/cdn/shop/files/B25SATL016_MLT000_1_0af64caf-364f-462d-ac5c-79ed0633d630.jpg?v=1738313006&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL016_MLT000_2_07590997-f399-466f-a52e-7dd092f701a4.jpg?v=1738313006&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL016_MLT000_3_54169207-e792-445a-b166-f869edaa2361.jpg?v=1738313006&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL016_MLT000_4_5e4a3944-13ca-49b2-aeda-4a368ca5bcea.jpg?v=1738313006&width=1200', 'WOMEN', 'Summer', 'The Pastel Stripe Polo Knit Top from Jelly Bunny features a vintage-inspired design with cheerful pastel stripes, soft cream collar and cuffs, decorated with front buttons and embroidered logo. Made from quality knitted fabric for soft comfort, this cropped fitted silhouette adds a perfect retro touch to your everyday casual look.', 1390, 8),
('PRD59AMJYWU1E', 'WAVE KNIT SHORT SLEEVE CARDIGAN MULTI COLOR', NULL, 'https://jellybunny.com/cdn/shop/files/B25SATL017_MLT000_1_34a9797b-cb1b-428b-8872-07b68b10413e.jpg?v=1738313011&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL017_MLT000_2_91c240be-6b74-436e-8899-e983e50c43b9.jpg?v=1738313011&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL017_MLT000_3_39e78f7a-26b6-4630-b3da-19e6ab654d79.jpg?v=1738313011&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL017_MLT000_4_1f868b29-d09c-41f3-a808-13d71d4c87fa.jpg?v=1738313011&width=1200', 'WOMEN', 'Summer', 'The Wave Knit Cardigan from Jelly Bunny features a classic design with chic two-tone wave pattern, decorated with pearl buttons and metallic logo detail. Ribbed collar, cuffs, and hem add refined finishing touches. Crafted from quality knitted fabric for soft comfort, this cropped length cardigan is perfect for mix-and-match styling.', 1390, 8),
('PRDUW3R327YMC', 'GARDEN STRIPE V-NECK TOP MULTI COLOR', NULL, 'https://jellybunny.com/cdn/shop/files/B25SAJL011_MLT000_1_e6f1cded-0a52-4859-b063-864bf1b0895c.jpg?v=1738312985&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAJL011_MLT000_2_172d8bc3-1bd2-40ac-aa08-9af51bc81e89.jpg?v=1738312985&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAJL011_MLT000_3_302a22e2-428b-4353-8895-0172f6b7e19c.jpg?v=1738312985&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAJL011_MLT000_4_70e80123-cb06-4a5f-9945-5d2d56ac894c.jpg?v=1738312985&width=1200', 'WOMEN', 'Summer', 'The Garden Stripe V-neck Top from Jelly Bunny features a cheerful striped pattern with floral embellishments. Decorated with a front brand logo, V-neckline, and ribbed trims for a refined finish. Made from quality knitted fabric for soft comfort, this cropped silhouette offers modern versatility, perfect for everyday mix-and-match styling.', 1590, 10),
    
('PRDWJTGLR2YQJ', 'TOM AND JERRY SWEET ICE-CREAM KNIT PULLOVER PINK', 'NEW', 'https://jellybunny.com/cdn/shop/files/B25SATL038_PNK000_1_5a0932e6-bf25-46e8-83c1-d6bbfb5cdc28.jpg?v=1737543423&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL038_PNK000_2_fb0263c4-0b3c-49e5-a59c-c1ca045e7ea4.jpg?v=1737543423&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL038_PNK000_4_f0d66fec-2bb0-424b-b28c-460116826809.jpg?v=1737543423&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL038_PNK000_5_19cbab97-a557-4dd3-8ff5-d2c8a64de019.jpg?v=1737543423&width=1200', 'WOMEN', 'ALL', 'Add a sweet twist to your wardrobe with the Jerry’s Ice Cream Knit Top! This pastel pink knit features a playful Jerry enjoying his ice cream, bringing out the cheerful and whimsical charm of Jelly Bunny. Perfect for casual outings or adding a dash of fun to your day.', 1790, 14),
('PRDD5C9AGBRTA', 'TOM AND JERRY CHASE SCENE STRIPE BOWLING SHIRT YELLOW', 'NEW', 'https://jellybunny.com/cdn/shop/files/B25SARL008_YLW000_1_9cf9c0a6-8d69-4318-80cd-3527cb1e6454.jpg?v=1737543406&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SARL008_YLW000_2_4dd6b6bf-faf5-4a98-86b7-2c73dfc78940.jpg?v=1737543406&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SARL008_YLW000_3_02837e66-286d-49f6-80ab-7a993e8f917c.jpg?v=1737543406&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SARL008_YLW000_4_e7ef4f45-770d-4a4a-b6f0-b51e5c0b958a.jpg?v=1737543406&width=1200', 'WOMEN', 'Summer', 'Discover this retro-inspired bowling shirt featuring a playful Tom and Jerry chase scene on yellow pinstripes. The contrast white collar and relaxed fit are complemented by Jerry Chase detail on the chest pocket, creating a charming vintage-style piece.', 1790, 4),
('PRDVE6DX18KER', 'TOM AND JERRY DENIM JEANS WHITE', 'NEW', 'https://jellybunny.com/cdn/shop/files/B25SAQL021_WHT000_1_6532f89a-fc32-4b37-81b8-693bffa7b000.jpg?v=1737543402&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAQL021_WHT000_2_7805e890-c608-417c-84c1-06cf13344e44.jpg?v=1737543402&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAQL021_WHT000_3_d489476a-0483-447b-8f29-d46006ed8fe1.jpg?v=1737543402&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAQL021_WHT000_4_b5a46c25-efa4-42b7-8bf7-612f8e49da7d.jpg?v=1737543402&width=1200', 'WOMEN', 'ALL', 'Presenting these charming white denim pants featuring an all-over print of Tom and Jerry faces with delicate yellow butterfly accents. The straight-leg design combines classic five-pocket styling with contrast stitching, creating a whimsical take on everyday denim.', 2190, 3),
('PRDTDWQQY83QO', 'TOM AND JERRY CHASE SCENE DENIM JEANS BLUE', 'NEW', 'https://jellybunny.com/cdn/shop/files/B25SAQL019_BLU000_1_0db51b74-8798-4989-9178-37749f5e8ed1.jpg?v=1737543396&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAQL019_BLU000_2_afbd5abc-8bab-45fa-ba54-4eae366c78f3.jpg?v=1737543396&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAQL019_BLU000_1_0db51b74-8798-4989-9178-37749f5e8ed1.jpg?v=1737543396&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAQL019_BLU000_4_70f10964-db52-4db9-a73c-d3047684562a.jpg?v=1737543396&width=1200', 'WOMEN', 'ALL', 'Step out in style with these high-waisted wide-leg jeans featuring a playful Tom and Jerry chase scene embroidery. The light-wash denim design combines classic five-pocket styling with a relaxed silhouette, perfect for adding whimsical charm to casual looks.', 2190, 13),
('PRDXR47OTBHBX', 'HAPPY 85TH BIRTHDAY TOM AND JERRY CROP TEE GREY', 'NEW', 'https://jellybunny.com/cdn/shop/files/B25SATL023_GRY000_1_e5136dce-5b95-4b9a-9427-a53324790e27.jpg?v=1737543408&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL023_GRY000_2_8ccd8a62-e44f-42c2-83ff-433fae98ca3e.jpg?v=1737543408&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL023_GRY000_3_61aba658-cb71-48fc-a78d-f87765292d52.jpg?v=1737543408&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL023_GRY000_4_8afd137b-5ba8-42cd-b3ae-caa90dd5cce5.jpg?v=1737543408&width=1200', 'WOMEN', 'Summer', 'Discover this charming cropped t-shirt featuring Tom and Jerry ice cream parlor adventure. The soft heather grey cotton is adorned with delicate lace trim, while the sweet illustration showcases floating hearts and ice cream motifs. The cropped length adds a playful, modern touch', 1090, 7),
    
('PRDDZOQLMFE5C', 'CLASSIC CABLE KNIT CARDIGAN GREY', NULL, 'https://jellybunny.com/cdn/shop/files/B25SAJL005_GRY000_1_69663490-d66f-4654-beca-4991b8352297.jpg?v=1736494565&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAJL005_GRY000_2_f9612414-b112-4ad6-94da-f7e8f11e80fa.jpg?v=1736494565&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAJL005_GRY000_3_9757a433-15a1-4c81-80d2-36cfe17100ba.jpg?v=1736494565&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAJL005_GRY000_4_933024b7-64cd-4873-a4e5-71886c1daaf8.jpg?v=1736494565&width=1200', 'MEN', 'Winter', 'Classic cable knit cardigan featuring an intricate braided pattern throughout and a refined V-neckline. Adorned with antique-style buttons and a playful cat duo embroidery detail. The relaxed silhouette pairs functionality with style through practical front pockets and ribbed trim finishes. A versatile layering piece that brings both comfort and sophistication to any outfit.', 1790, 4),
('PRDVLVMVTWT68', 'CAMP FIRE TIME TIE DYE TEE MULTI COLOR', NULL, 'https://jellybunny.com/cdn/shop/files/B25SATL007_MLT000_1_e6a8d9a3-7e6d-40eb-940d-25e54afc6c63.jpg?v=1736494584&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL007_MLT000_2_6a1bc96f-d804-4fcf-839f-68dc2a88f8e2.jpg?v=1736494584&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL007_MLT000_3_cfcb95f6-d244-4530-84b4-e9fd8d344058.jpg?v=1736494584&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SATL007_MLT000_4_7136d942-184b-41b0-b236-db2a3ffb02af.jpg?v=1736494584&width=1200', 'MEN', 'Summer', 'Relaxed-fit t-shirt featuring a charming campfire scene with whimsical animal characters set against a moody tie-dye background. The playful "Camp Fire Time" graphic combines forest elements with cute illustrations. The oversized silhouette and unique dye pattern create an effortlessly cool aesthetic, perfect for adding a touch of adventure to casual ensembles.', 1090, 5),
('PRD5Q6JJNCQCH', 'SKETCHED BUNNY MONOGRAM OVERSIZED SHIRT GREY', NULL, 'https://jellybunny.com/cdn/shop/files/B24WARL004_GRY0000_1.jpg?v=1734499223&width=1200', 'https://jellybunny.com/cdn/shop/files/B24WARL004_GRY0000_2.jpg?v=1734499221&width=1200', 'https://jellybunny.com/cdn/shop/files/B24WARL004_GRY0000_3.jpg?v=1734499215&width=1200', 'https://jellybunny.com/cdn/shop/files/B24WARL004_GRY0000_4.jpg?v=1734499234&width=1200', 'MEN', 'All', 'Oversized button-up shirt featuring a whimsical pattern of turquoise bunnies and monochrome motifs on a sophisticated grey background. The relaxed silhouette includes a classic pointed collar and full-length sleeves. Premium cotton construction ensures comfort, while the playful print adds character to this versatile piece that bridges casual and refined style.', 1590, 5),
('PRDUFDZ1EU8LS', 'FLORAL CHECKER CARDIGAN MULTI COLOR', NULL, 'https://jellybunny.com/cdn/shop/files/B25SAJL003_MLT000_1_275514f5-024a-477a-ad87-04677c883dbc.jpg?v=1736494566&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAJL003_MLT000_2_2623c294-673b-4551-bfe5-d9ef6f533bde.jpg?v=1736494566&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAJL003_MLT000_3_05259848-992c-4a9d-ae8a-5c9a9b825fa4.jpg?v=1736494566&width=1200', 'https://jellybunny.com/cdn/shop/files/B25SAJL003_MLT000_4_d5f9a764-9f50-444c-9a4e-47d48927f04c.jpg?v=1736494566&width=1200', 'MEN', 'Winter', 'Cozy V-neck cardigan featuring an all-over checkered pattern with delicate floral motifs and logo details in two-tone. The relaxed silhouette includes practical button closures and ribbed trims for a polished finish. This versatile piece combines classic collegiate style with feminine pattern work, perfect for layering over casual or preppy ensembles.', 1790, 7);

CREATE TABLE administrators (
    admin_id CHAR(6) PRIMARY KEY NOT NULL,
    admin_fname VARCHAR(32),
    admin_lname VARCHAR(32),
    admin_email VARCHAR(32),
    admin_age INT
);

CREATE TABLE Login (
    login_id CHAR(6) PRIMARY KEY NOT NULL,
	login_email VARCHAR(32),
    login_username VARCHAR(32),
    login_password VARCHAR(32),
    login_role VARCHAR(16),
    admin_id  CHAR(6),
    FOREIGN KEY (admin_id) REFERENCES administrators(admin_id)
);

CREATE TABLE login_logs (
    log_id CHAR(10) PRIMARY KEY NOT NULL,
    logdate DATE,
    logtime TIME,
    editprod CHAR(1),
    addprod CHAR(1),
    removeprod CHAR(1),
    prod_ID CHAR(13),
    admin_id CHAR(6),
    FOREIGN KEY (prod_ID) REFERENCES Product(prod_ID),
	FOREIGN KEY (admin_id) REFERENCES administrators(admin_id)
);

INSERT INTO administrators (admin_ID, admin_fname, admin_lname, admin_email, admin_age) VALUES
('A0001', 'Alice', 'Lim', 'alice.lim@gmail.com', 35),
('A0002', 'Ben', 'Chan', 'ben.chan@gmail.com', 30),
('A0003', 'Clara', 'Wong', 'clara.wong@gmail.com', 28),
('A0004', 'David', 'Tan', 'david.tan@gmail.com', 40),
('A0005', 'Emily', 'Koh', 'emily.koh@gmail.com', 32),
('A0006', 'Felix', 'Yeo', 'felix.yeo@gmail.com', 29),
('A0007', 'Grace', 'Lim', 'grace.lim@gmail.com', 34),
('A0008', 'Henry', 'Goh', 'henry.goh@gmail.com', 38),
('A0009', 'Irene', 'Teo', 'irene.teo@gmail.com', 33),
('A0010', 'James', 'Lee', 'james.lee@gmail.com', 36);


INSERT INTO Login (login_id, login_email, login_username, login_password, login_role, admin_id) VALUES
('L00001', 'alice.lim@gmail.com', 'alicelim', 'secure123', 'Admin', 'A0001'),
('L00002', 'ben.chan@gmail.com', 'benchan', 'password1', 'Admin', 'A0002'),
('L00003', 'clara.wong@gmail.com', 'claraw', 'abc123', 'Admin', 'A0003'),
('L00004', 'david.tan@gmail.com', 'davidt', 'pass456', 'Admin', 'A0004'),
('L00005', 'emily.koh@gmail.com', 'emilyk', 'empass789', 'Admin', 'A0005'),
('L00006', 'felix.yeo@gmail.com', 'felixy', 'yeopass12', 'Admin', 'A0006'),
('L00007', 'grace.lim@gmail.com', 'gracelim', 'gracepw', 'Admin', 'A0007'),
('L00008', 'henry.goh@gmail.com', 'henryg', 'hgohpass', 'Admin', 'A0008'),
('L00009', 'irene.teo@gmail.com', 'irenet', 'itsecure', 'Admin', 'A0009'),
('L00010', 'james.lee@gmail.com', 'jamesl', 'jlpass432', 'Admin', 'A0010');

INSERT INTO login_logs (log_id, logdate, logtime, editprod, addprod, removeprod, prod_ID, admin_id) VALUES
('LLOG001', '2025-04-01', '08:30:00', 'Y', 'N', 'N', 'PRDA0GORKTA65', 'A0001'),
('LLOG002', '2025-04-02', '09:00:00', 'N', 'Y', 'N', 'PRDVE6DX18KER', 'A0002'),
('LLOG003', '2025-04-03', '10:15:00', 'N', 'N', 'Y', 'PRDDZOQLMFE5C', 'A0003'),
('LLOG004', '2025-04-04', '11:00:00', 'Y', 'N', 'N', 'PRDZUVFA7PK07', 'A0004'),
('LLOG005', '2025-04-05', '12:30:00', 'Y', 'Y', 'N', 'PRDUW3R327YMC', 'A0005'),
('LLOG006', '2025-04-06', '14:45:00', 'N', 'Y', 'Y', 'PRDUFDZ1EU8LS', 'A0006'),
('LLOG007', '2025-04-07', '15:00:00', 'Y', 'N', 'N', 'PRD5Q6JJNCQCH', 'A0007'),
('LLOG008', '2025-04-08', '16:30:00', 'N', 'N', 'Y', 'PRDTDWQQY83QO', 'A0008'),
('LLOG009', '2025-04-09', '17:00:00', 'Y', 'Y', 'N', 'PRDVE6DX18KER', 'A0009'),
('LLOG010', '2025-04-10', '18:15:00', 'N', 'Y', 'N', 'PRDD5C9AGBRTA', 'A0010');

-- select * from product where prod_id = 'PRDD5C9AGBRTA'