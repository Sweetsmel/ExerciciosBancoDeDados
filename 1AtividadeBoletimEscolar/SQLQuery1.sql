select 
	al.Nome,
	SUM(nt.Nota1+Nota2+Nota3+Nota4) / COUNT(fr.Ativo) as 'Media',
	IIF((SUM(nt.Nota1+Nota2+Nota3+Nota4) / COUNT(fr.Ativo) >= 7), 'Aprovado','Reprovado') as 'Status Média',
	IIF(((SUM(CONVERT(money,fr.Ativo)) / CONVERT(money,COUNT(fr.Ativo)) * 100) >= 75), 'Aprovado','Reprovado') as 'Status Frequencia'
	from Alunos al
inner join Freq fr on al.Id = fr.Aluno
inner join Notas nt on al.Id = nt.IdAluno
group by al.Nome