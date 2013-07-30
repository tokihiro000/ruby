
sports = ARGV[0]

class Boll
      def initialize(myboll="soccer")
          @boll = myboll
      end


   attr_accessor :boll


      def boll_kakuninn
          print "It is ", @boll, "boll.\n"
      end
end

if sports != nil
   s = Boll.new(sports)
else
   s = Boll.new()
end

s.boll_kakuninn
s.boll = "soccer"
s.boll_kakuninn
