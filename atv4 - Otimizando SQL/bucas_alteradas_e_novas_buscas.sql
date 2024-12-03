SELECT Autor.Nome, Livro.Titulo 
FROM Autor LEFT JOIN livro
ON Autor.ID_Autor = Livro.ID_Autor;

SELECT Emprestimo.ID_Emprestimo, Usuario.Nome 
FROM Emprestimo LEFT JOIN Usuario 
ON Emprestimo.ID_Usuario = Usuario.ID_Usuario;

SELECT Livro.Titulo, Categoria.Nome 
FROM Livro LEFT JOIN Livro_Categoria  
ON Livro.ID_Livro = Livro_Categoria.ID_Livro 
LEFT JOIN Categoria 
ON Livro_Categoria.ID_Categoria = Categoria.ID_Categoria;

SELECT Livro.Titulo, Usuario.Nome 
FROM Livro LEFT JOIN Emprestimo
ON Livro.ID_Livro = Emprestimo.ID_Livro 
LEFT JOIN Usuario 
ON Emprestimo.ID_Usuario = Usuario.ID_Usuario;

SELECT Autor.Nome, Livro.Titulo 
FROM Autor LEFT JOIN Livro 
ON Autor.ID_Autor = Livro.ID_Autor;

-- novas buscas
-- ano de publicação depois do ano 2000
SELECT Titulo, Ano_Publicacao 
FROM Livro
WHERE Ano_Publicacao > 2000;

-- quantidade de livro por categora
SELECT Categoria.Nome, COUNT(Livro_Categoria.ID_Livro) AS Quantidade_Livros
FROM Categoria
LEFT JOIN Livro_Categoria ON Categoria.ID_Categoria = Livro_Categoria.ID_Categoria
GROUP BY Categoria.Nome;

-- quantidade de emprestimos 
SELECT COUNT(Id_Emprestimo)
AS Total_Emprestimo
FROM Emprestimo;