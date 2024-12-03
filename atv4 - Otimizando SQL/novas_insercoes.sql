-- Inserção de novos livros
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (4, 'Harry Potter e a Câmara Secreta', 1, 1998);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (5, 'Harry Potter e o Prisioneiro de Azkaban', 1, 1999);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (6, 'O Festim dos Corvos', 2, 2005);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (7, 'A Dança dos Dragões', 2, 2011);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (8, 'O Hobbit', 3, 1937);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (9, 'Silmarillion', 3, 1977);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (10, 'O Cavaleiro dos Sete Reinos', 2, 1998);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (11, 'Animais Fantásticos e Onde Habitam', 1, 2001);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (12, 'Os Filhos de Húrin', 3, 2007);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (13, 'Ventos do Inverno (em produção)', 2, 2024);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (14, 'O Conto de Beren e Lúthien', 3, 2017);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (15, 'Harry Potter e o Cálice de Fogo', 1, 2000);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (16, 'Harry Potter e a Ordem da Fênix', 1, 2003);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (17, 'Harry Potter e o Enigma do Príncipe', 1, 2005);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (18, 'Harry Potter e as Relíquias da Morte', 1, 2007);

-- Relacionamento de novos livros com categorias
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (4, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (5, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (6, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (6, 2);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (7, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (8, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (8, 3);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (9, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (10, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (11, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (12, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (13, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (14, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (15, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (16, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (17, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (18, 1);
