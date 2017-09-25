#barclass.rb 
#calling russian 
#encoding: utf-8
# if (Gem.win_platform?) 
# 	Encoding.default_external = Encoding.find(Encoding.locale_charmap) 
# 	Encoding.default_internal = __ENCODING__ 

# 		[STDIN, STDOUT].each do |io| 
# 		io.set_encoding(Encoding.default_external, Encoding.default_internal) 
# 		end 
# end 

require 'SQLite3'

	#создаём базу напитков, хэш соответствующей им посуды
	#предполагаем, что база напитков будет автономной, подгружаемой
  #убрать константу с напитками, оставить хэш
ALLDRINKS=[:apperol,:brendy,:chinzano,:distilled_spirit]
GLASSES={apperol: :highball, brendy: :glass, chinzano: :wineglass,distilled_spirit: :shot}

#задаем БД

# @db_store= SQLite3::Database.new
 # @db.execute 'SELECT * FROM store' do ||
 # end
# @db.close

#classing 
class BarContent 
	attr_accessor :bardrink, :glass
		#задаём "блюдо дня"
    def initialize
      @bardrink = ALLDRINKS[rand(0..3)] 
      @glass = GLASSES[@bardrink] 
		end 
end 

class Barmen
	
	attr_accessor :name, :barmendrink

	def initialize name
		@name=name
    @barmendrink=barmendrink
    @bardrink=''
	end
		#создаём "предпочтение бармена"
		def barmens_choice 
			@barmendrink=ALLDRINKS[rand(0..3)]
		end 

	#бармен случайным образом разбивает налитое
		def barmens_shaking_hands 
			puts "Ох ты ж псыж! Разбил #{@glass}!" if rand(0..4)==0 
		end 

	#если то, что есть в баре, совпадает с выбором бармена, у него поднимается настроение
		def barmens_mood 
			puts "Йо-хо!! Прекрасный вечер!" if @bardrink==@barmendrink 
			puts "Наливаю тебе #{@bardrink} в #{@glass}" 
		end 
end 

module Party 
	#взаимодействие бармена и бара
end 

monday_BarContent=BarContent.new

p monday_BarContent

nick = Barmen.new("Nick")
p nick
nick.barmens_shaking_hands
