select				--inner por sequencia de filtro
	a.Aluno,
	SUM(n.Nota) / COUNT(d.[Data]) as 'Média Turma 1'

FROM Alunos a

	inner join TurmaAlunos tr on a.Id = tr.Aluno		--pegou turmaalunos, associou a turma com aluno
	inner join Diarios d on tr.Turma = d.Turma			--pegou todos os diarios da tal turma
	left join Notas n on d.Id = n.Diario and a.Id = n.Aluno		--pegou as notas do diario, vai trazer todas msmo q ñ tenha

where tr.Turma = 1
group by a.Aluno;

select				
	a.Aluno,
	SUM(n.Nota) / COUNT(d.[Data]) as 'Média Turma 2'

FROM Alunos a

	inner join TurmaAlunos tr on a.Id = tr.Aluno		
	inner join Diarios d on tr.Turma = d.Turma			
	left join Notas n on d.Id = n.Diario and a.Id = n.Aluno		

where tr.Turma = 2
group by a.Aluno