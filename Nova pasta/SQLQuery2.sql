select 
	d.[Data],		--[] serve para informar q é uma palavra reservada
	tr.Aluno,
	ISNULL(n.Nota,0) as 'Nota',
	IIF(ISNULL(p.Id,0) >0,'Presente','Ausente') as 'Presenças'
from Diarios d 

--queria apenas as notas, por isso começou pelo diario
--se quisesse saber como esta a turma, então começa pela Turma
		inner join TurmaAlunos tr on d.Turma = tr.Turma
		left join Presenca p on d.Id = p.Diario and tr.Aluno = p.Aluno		
		left join Notas n on tr.Aluno = n.Aluno and d.Id = n.Diario
		
--group by d.[Data],tr.Aluno,n.Nota