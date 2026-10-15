CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE Categoria (
    idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    designacao VARCHAR(100) NOT NULL
);

CREATE TABLE Livro (
    idLivro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anoEdicao INT,
    idCategoria INT,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

CREATE TABLE Socio (
    idSocio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    dataInscricao DATE
);

CREATE TABLE Emprestimo (
    idEmprestimo INT AUTO_INCREMENT PRIMARY KEY,
    idLivro INT,
    idSocio INT,
    dataEmprestimo DATE,
    dataDevolucao DATE,
    FOREIGN KEY (idLivro) REFERENCES Livro(idLivro),
    FOREIGN KEY (idSocio) REFERENCES Socio(idSocio)
);

-- Inserção de dados
INSERT INTO Categoria (designacao) VALUES 
('Romance'), ('Ficção Científica'), ('História'), ('Fantasia');

INSERT INTO Livro (titulo, autor, anoEdicao, idCategoria) VALUES 
('Ensaio sobre a Cegueira', 'José Saramago', 1995, 1),
('O Ano da Morte de Ricardo Reis', 'José Saramago', 1984, 1),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 1997, 4),
('Harry Potter e a Câmara dos Segredos', 'J.K. Rowling', 1998, 4),
('Dune', 'Frank Herbert', 1965, 2),
('O Despertar da História', 'António Silva', 2018, 3),
('Caminhos do Passado', 'Maria Silva', 2020, 3);

INSERT INTO Socio (nome, email, dataInscricao) VALUES 
('Carlos Sousa', 'carlos@gmail.com', '2025-03-15'),
('Ana Martins', 'anamartins@hotmail.com', '2025-06-20'),
('Miguel Silva', 'miguelsilva@gmail.com', '2026-01-10'),
('Beatriz Costa', 'biacosta@yahoo.com', '2026-02-14');

INSERT INTO Emprestimo (idLivro, idSocio, dataEmprestimo, dataDevolucao) VALUES 
(1, 1, '2026-01-05', '2026-01-15'),
(3, 3, '2026-02-10', NULL),
(4, 3, '2026-02-20', NULL),
(3, 3, '2026-03-01', '2026-03-10'),
(5, 2, '2026-02-15', '2026-02-28'),
(6, 4, '2026-03-02', NULL);

Select*from Socio;
 
Select titulo, anoEdicao from livro order by anoEdicao asc;
 
Select  nome, email From socios where year(dataInscricao) = 2025;
 
Select titulo  from Livro where autor Like  "J.K. Rowling";
 
Select titulo from livro where year(anoEdicao) <2000;
 
Select nome, dataInscricao from socio order by dataInscricao DESC;
 
Select * from Livro where (anoEdicao) between  2015 and 2020;
 
Select * from socio where email like '%@gmail.com';

Select * from socio where nome like '%Silva%';

Select * from Emprestimo where dataDevolucao is null;

Select count(*) as total_livro from livro;

Select count(*) as total_emprestimos from Emprestimo;

Select count(*) as total_socios from Socio where nome like 'M%';

Select count(*) as total_livros_cat3 from Livro where idCategoria = 3;

Select Livro.titulo, Livro.autor, Categoria.designacao from Livro inner join Categoria on Livro.idCategoria = Categoria.idCategoria;

Select Socio.nome, Emprestimo.dataEmprestimo from Emprestimo inner join Socio on Emprestimo.idSocio = Socio.idSocio where year(Emprestimo.dataEmprestimo) = 2026;

Select idCategoria, count(*) as quantidade_livros from Livro group by idCategoria;

Select idSocio, count(*) as total_emprestimos from Emprestimo group by idSocio having count(*) > 2;

Select Socio.nome, Livro.titulo, Emprestimo.dataEmprestimo from Emprestimo inner join Socio on Emprestimo.idSocio = Socio.idSocio inner join Livro on Emprestimo.idLivro = Livro.idLivro;