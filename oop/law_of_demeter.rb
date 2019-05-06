# Law of Demeter
# # Description # # # # # # # # # # #
# This principle is tells us that it is a bad idea for single functions to know the entire navigation structure of the system.
# # # # # # # # # # # # # # # # # # #

# Bad example

class A
    def b
        B.new
    end
end

class B
    def greet
        puts 'Hello'
    end
end

a = A.new
a.b.greet

# Good example

class A
    def greet
        B.new.greet
    end
end

class B
    def greet
        puts 'Hello'
    end
end

a = A.new
a.greet