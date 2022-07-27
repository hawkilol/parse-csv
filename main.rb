require 'csv'

tabela = CSV.parse(File.read("boletim-covid-21-04-2021.csv"), headers: true)

confirmados = tabela["confirmed"].map(&:to_i)
mortes = tabela["deaths"].map(&:to_i)
estados = tabela["states"]
vacinacao = tabela["vaccination"].map(&:to_i)

#soma de casos confirmados e mortes
soma_confirmados= confirmados.sum
soma_mortes= mortes.sum


print "\nTotal de casos confirmados: ",soma_confirmados

print "\nTotal de mortes: ", soma_mortes

#estados com mais casos confirmados
confirmados_menorTomaior= confirmados.sort {|menor,maior|   maior<=>menor}
puts "\n\nTop3 mais casos confirmados:", confirmados_menorTomaior[0..2]
confirmados_menorTomaiortop3 = confirmados_menorTomaior[0..2]
confirmados_menorTomaior_index = confirmados_menorTomaiortop3.map! {|valor| confirmados.find_index(valor)}
confirmados_menorTomaior_index.map! {|valor| tabela[valor.to_i]['state']}
puts "\nTop3 estados com mais casos confirmados:" , confirmados_menorTomaior_index


#maisvacinacao
vacinacao_menorTomaior= vacinacao.sort {|menor,maior| maior <=> menor}
puts "\nTop3 mais vacinacao:" , vacinacao_menorTomaior[0..2]
vacinacao_menorTomaiortop3 = vacinacao_menorTomaior[0..2]
vacinacao_menorTomaior_index = vacinacao_menorTomaiortop3.map! {|valor| vacinacao.find_index(valor)}
vacinacao_menorTomaior_index.map! {|valor| tabela[valor.to_i]['state']}
puts "\nTop3 estados com mais vacinacao:" , vacinacao_menorTomaior_index


#maismortes 
mortes_menorTomaior= mortes.sort {|menor,maior| maior <=> menor}
puts "\nTop3 mais mortes:" , mortes_menorTomaior[0..2]
mortes_menorTomaiortop3 = mortes_menorTomaior[0..2]
mortes_menorTomaior_index = mortes_menorTomaiortop3.map! {|valor| mortes.find_index(valor)}
mortes_menorTomaior_index.map! {|valor| tabela[valor.to_i]['state']}
puts "\nTop3 estados com mais mortes:" , mortes_menorTomaior_index

# estados com menos casos confirmados
confirmados_menorTomaior= confirmados.sort 
puts "\n\nTop3 menos casos confirmados:", confirmados_menorTomaior[0..2]
confirmados_menorTomaiortop3 = confirmados_menorTomaior[0..2]
confirmados_menorTomaior_index = confirmados_menorTomaiortop3.map! {|valor| confirmados.find_index(valor)}
confirmados_menorTomaior_index.map! {|valor| tabela[valor.to_i]['state']}
puts "\nTop3 estados com menos casos confirmados:" , confirmados_menorTomaior_index

#menosvacinacao
vacinacao_menorTomaior= vacinacao.sort
puts "\nTop3 menos vacinacao:" , vacinacao_menorTomaior[0..2]
vacinacao_menorTomaiortop3 = vacinacao_menorTomaior[0..2]
vacinacao_menorTomaior_index = vacinacao_menorTomaiortop3.map! {|valor| vacinacao.find_index(valor)}
vacinacao_menorTomaior_index.map! {|valor| tabela[valor.to_i]['state']}
puts "\nTop3 estados com menos vacinacao:" , vacinacao_menorTomaior_index

#menosmortes
mortes_menorTomaior= mortes.sort 
puts "\nTop3 menos mortes:" , mortes_menorTomaior[0..2]
mortes_menorTomaiortop3 = mortes_menorTomaior[0..2]
mortes_menorTomaior_index = mortes_menorTomaiortop3.map! {|valor| mortes.find_index(valor)}
mortes_menorTomaior_index.map! {|valor| tabela[valor.to_i]['state']}
puts "\nTop3 estados com menos mortes:" , mortes_menorTomaior_index
