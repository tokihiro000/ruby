module BollModule
       def kakuninn(boll)
           print "this is ", boll, " boll.\n"
       end

       module_function:kakuninn
end

class Module_test
      include BollModule

      def initialize(b)
          @boll = b
      end

      def pr
          BollModule.kakuninn(@boll)
      end
end

soccer = Module_test.new("soccer")
volleyboll = Module_test.new("volley")

soccer.pr
volleyboll.pr