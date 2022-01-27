class Category
    attr_accessor :category

    def initialize(category)
        @category = category
    end
end

class StudyItem < Category
    attr_accessor :nome, :item

    def initialize(nome, category, item)
        @item = [{nome: nome, category: category}]
    end

    def adicionar_item
        puts 'Digite o nome do item:'
        nome = gets.chomp
        puts 'Digite a categoria'
        category = gets.chomp
        @item << {nome: nome, category: category}
        puts "\n"
        puts "Item criado!"
    end

    def mostrar_itens
        @item.each do |item|
            puts "#{item[:nome]} -> #{item[:category]}"
          puts "\n"
        end
    end

    def buscar_item
        puts 'Digite o nome do item que procura: '
        nome = gets.chomp

        @item.each do |item_buscar|
          if item_buscar[:nome].downcase.include?(nome.downcase)
            puts "#{item_buscar[:nome]} -> #{item_buscar[:category]}"
          end
        end
    end

    def editar_item
        puts "Digite o item que quer editar: "
        nome = gets.chomp

        @item.each do |item_editar|
            if item_editar[:nome].downcase.include?(nome.downcase)
                puts "Item para editar: (Se quiser manter, aperte o Enter)"
                item_salvo = item_editar[:nome]

                item_editar[:nome] = gets.chomp
                item_editar[:nome] = item_editar[:nome].empty? ? item_salvo : item_editar[:nome]

                puts 'Categoria para editar: (Se quiser manter, aperte o Enter.)'
                categoria_salvo = item_editar[:category]

                item_editar[:category] = gets.chomp
                item_editar[:category] = item_editar[:category].empty? ? categoria_salvo : item_editar[:category]
            end
        end
    end

    def remover_item
        puts 'Digite o item deseja remover: '
        nome = gets.chomp
    
        @item.each do |item_remover|
            if item_remover[:nome].downcase.include?(nome.downcase)
                indice = @item.index(item_remover)
                @item.delete_at(indice)
                break
            end
        end
    end
end

# Menu

opcao = nil

studyItem = StudyItem.new("Nome", "Categoria", "Item")

while opcao != 0
    puts 'Diário de estudos'
    puts '[1] Criar item de estudo'
    puts '[2] Visualizar todos os items de estudos'
    puts '[3] Buscar um item de estudo'
    puts '[4] Editar um item de estudo'
    puts '[5] Remover um item de estudo'
    puts '[0] Sair'
    puts 'Escolha uma opção:'
    opcao = gets.to_i

    case
    when opcao == 1
        studyItem.adicionar_item
    when opcao == 2
        studyItem.mostrar_itens
    when opcao == 3
        studyItem.buscar_item
    when opcao == 4
        studyItem.editar_item
    when opcao == 5
        studyItem.remover_item
    when opcao == 0
        puts 'Saindo...'
        break
    end
end