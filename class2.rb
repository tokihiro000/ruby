sports = ARGV[0]

class Boll
@@count = 0
      def Boll.ct()
          print "boll_kakuninn is called ", @@count, ".\n"
      end

      def initialize(myboll="soccer")
          @boll = myboll
      end

      attr_accessor :boll

      def boll_kakuninn
          print "It is ", @boll, "boll.\n"
          @@count += 1
      end
end

if sports != nil
   s = Boll.new(sports)
else
   s = Boll.new()
end

s.boll_kakuninn
s.boll_kakuninn
t = Boll.new()
t.boll_kakuninn
t.boll_kakuninn

Boll.ct()