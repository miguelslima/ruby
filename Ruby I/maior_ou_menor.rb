def da_boas_vindas
    puts
    puts "        P  /_\\  P                              "
    puts "       /_\\_|_|_/_\\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                              "
    puts
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    nome
end

def pede_dificuldade
    puts "Qual o nível de dificuldade?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
    puts "Escolha: "
    dificuldade = gets.to_i
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

def sorteia_numero_secreto(dificuldade)
	case dificuldade
	when 1
		maximo = 30
	when 2
		maximo = 60
	when 3
		maximo = 100
	when 4
		maximo = 150
	else
		maximo = 200
	end
	puts "Escolhendo um número secreto entre 1 e #{maximo -1}..."
	sorteado = rand(maximo) + 1
	puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
	sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativa)
	puts "\n\n\n"
	puts "Tentativa #{tentativa} de #{limite_de_tentativa}"
	puts "Chutes até agora #{chutes}" 
	puts "Entre com o numero:"
	chute = gets
	puts "Será que acerto? Você chutou #{chute}"
	puts "\n\n\n"
	chute 
end

def verifica_se_acertou(numero_secreto, chute)
	acertou = numero_secreto == chute.to_i
	if acertou
		ganhou
		return true
	end
	maior = numero_secreto > chute.to_i
	if maior
		puts "O numero secreto é maior"
	else 
		puts "O numero secreto é menor"
	end
	return false
end

def joga(nome, dificuldade)
	numero_secreto = sorteia_numero_secreto
	pontos_ate_agora = 1000
	limite_de_tentativa = 5
	chutes = []

	for tentativa in 1..limite_de_tentativa
		chute = pede_um_numero chutes, tentativa, limite_de_tentativa
		chutes << chute

		pontos_a_perder = (chutes - numero_secreto).abs / 2.0
		pontos_ate_agora -= pontos_a_perder

		break if verifica_se_acertou numero_secreto, chute
	end
	puts "Você ganhou #{pontos_ate_agora} pontos"
end

def nao_quer_jogar?
	puts "Deseja jogar novamente? (S/N)"
	quer_jogar = gets.strip
	nao_quero_jogar = quer_jogar.upcase == "N"
end

da_boas_vindas
dificuldade = pede_dificuldade

loop do
	joga nome, dificuldade
	if nao_quer_jogar?
		break
	end
end