--CREATE DATABASE Cardinalite;
USE Cardinalite;

CREATE TABLE Categorie(
idCat INT PRIMARY KEY IDENTITY(1,1),
nameCat VARCHAR(30)
);

CREATE TABLE Produit(
idPro INT PRIMARY KEY IDENTITY(1,1),
namePro VARCHAR(30),
prix DECIMAL(10,2),
FK_categorieID INT FOREIGN KEY REFERENCES Categorie(idCat)
);

CREATE TABLE StockProduit(
stockID INT PRIMARY KEY IDENTITY(1,1),
FK_produitStockID INT FOREIGN KEY REFERENCES Produit(idPro)
);

CREATE TABLE Achat(
idAchat INT PRIMARY KEY IDENTITY(1,1),
id_produit INT NOT NULL,
dateAchat DATE NOT NULL,
CONSTRAINT fk_produitAchete FOREIGN KEY (id_produit) 
REFERENCES Produit(idPro),

);

INSERT INTO Categorie(nameCat) VALUES ('peluche'),
									  ('livre'),
									  ('film');

INSERT INTO Produit(namePro,prix,FK_categorieID) VALUES ('Krokmou', 15, 1),
														('Loup',20,1),
														('Niffler',10,1),
														('Mercy Thompson',7,2),
														('Harry potter',7,2),
														('L''assassin royal',7,2),
														('Captain America : Civil War', 20,3),
														('Spider-Man', 20, 3),
														('Detective Pikachu',20,3);

INSERT INTO StockProduit(FK_produitStockID) VALUES (1),(1),(1),(2),(2),(3),(5),(5),(5)

INSERT INTO Achat(id_produit, dateAchat) VALUES (1, '20190510'),
												(2, '20191010'),
												(3, '20191212'),
												(1, '20200110'),
												(2, '20200510'),
												(3, '20200301'),
												(4, '20190510'),
												(5, '20190101'),
												(6, '20190510'),
												(4, '20200212'),
												(5, '20200110'),
												(6, '20200209'),
												(7, '20191210'),
												(8,'20190709'),
												(9, '20190606'),
												(7,'20200208'),
												(8, '20200104'),
												(9, '20200210');



SELECT COUNT(prs.FK_produitStockID) AS NbProduitStock, ca.nameCat
FROM Produit AS pr
INNER JOIN Categorie AS ca ON ca.idCat=pr.FK_categorieID
INNER JOIN StockProduit AS prs ON pr.idPro=prs.FK_produitStockID
GROUP BY ca.idCat, ca.nameCat