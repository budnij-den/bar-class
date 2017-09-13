# encoding: utf-8
#barclass.rb

	#создаём базу напитков, хэш соответствующей им посуды
	#предполагаем, что база напитков будет автономной, подгружаемой
ALLDRINKS=[:apperol,:brendy,:chinzano,:distilled_spirit]
GLASSES={apperol: :highball, brendy: :glass, chinzano: :wineglass,distilled_spirit: :shot}
WEEK=[:monday,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday]

module Party
  #взаимодействие бармена и бара
    #задаём "блюдо дня". пусть оно зависит от дня недели
    def bar_supply
      @bardrink = ALLDRINKS[Time.now.wday-4]
    end
end

#classing
class BarContent
  include Party
	attr_accessor :bardrink

		def initialize
			@bardrink = ALLDRINKS[rand(ALLDRINKS.size)]
      @glass = GLASSES[@bardrink]
		end
end

class Barmen
include Party
	attr_accessor :name, :barmendrink

	def initialize name
		@name=name
	end
		#создаём "предпочтение бармена"
		def barmens_choice
			@barmendrink=ALLDRINKS[rand(ALLDRINKS.size)]
		end

#бармен случайным образом разбивает налитое
		def barmens_shaking_hands
      puts "Ох ты ж псыж! Разбил #{@glass}!" if rand(4)==0
		end

#если то, что есть в баре, совпадает с выбором бармена, у него поднимается настроение
		def barmens_mood
			puts "Йо-хо!! Прекрасный вечер!" if @bardrink==@barmendrink
			puts "Наливаю тебе #{@bardrink} в #{@glass}"
		end

end



monday_bar=BarContent.new
p monday_bar
nick = Barmen.new("Nick")
p nick
nick.barmens_choice
p nick
