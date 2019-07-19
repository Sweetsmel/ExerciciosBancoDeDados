CREATE TABLE [dbo].[Turmas] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Turma]      VARCHAR (100)  NOT NULL,
    [Observacao] VARCHAR (1000) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Alunos] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [Matricula] INT           NOT NULL,
    [Nome]      VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Notas] 
(
    [Id]    INT           IDENTITY (1, 1) NOT NULL,
    [IdAluno] INT NOT NULL,
    [Nota1] INT           NOT NULL,
    [Nota2] INT           NOT NULL,
    [Nota3] INT           NOT NULL,
    [Nota4] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC), 

    CONSTRAINT [FK_Notas_AlunoNome] FOREIGN KEY ([IdAluno]) REFERENCES [Alunos]([Id])
);

CREATE TABLE [dbo].[Freq]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Aluno] INT NOT NULL, 
    [Ativo] BIT NOT NULL, 

    CONSTRAINT [FK_Freq_MatriculaAluno] FOREIGN KEY ([Aluno]) REFERENCES [Alunos]([Id])
)



select 
	al.Nome,
	SUM(nt.Nota1+Nota2+Nota3+Nota4) / COUNT(fr.Ativo) as 'Media',
	IIF((SUM(nt.Nota1+Nota2+Nota3+Nota4) / COUNT(fr.Ativo) >= 7), 'Aprovado','Reprovado') as 'Status Média',
	IIF(((SUM(CONVERT(money,fr.Ativo)) / CONVERT(money,COUNT(fr.Ativo)) * 100) >= 75), 'Aprovado','Reprovado') as 'Status Frequencia'
	from Alunos al
inner join Freq fr on al.Id = fr.Aluno
inner join Notas nt on al.Id = nt.IdAluno
group by al.Nome