# [S] Single Responsibility principle
# # Description # # # # # # # # # # #
# This principle is based on the fact that a class should be responsible of only one aspect of a program
# # # # # # # # # # # # # # # # # # #

# Bad example

class ExportData
    def csv; end

    def xlsx; end

    def json; end
end

# Good example

class CsvExport
    # ...
end

class XlsxExport
    # ...
end


# [O] Open/Closed principle
# # Description # # # # # # # # # # #
# This principle is based on the fact that a class should be open for extension and closed for modification.
# # # # # # # # # # # # # # # # # # #

# Bad example

class Array
    def smart_sort(name)
        case name
        when :bubble_sort
            # ...
        when :quick_sort
            # ...
        end
    end
end

# Good example

class BubbleSort
    def self.call
        # ...
    end
end

class QuickSort
    def self.call
        # ...
    end
end

class Array
    def smart_sort(sort=BubbleSort)
        sort.call
    end
end 

[2,1,0].smart_sort
[2,5,8].smart_sort(QuickSort)

# [L] Liskov Substitution principle
# # Description # # # # # # # # # # #
# This principle is based on the fact that a derived class must be substitutable by its base class.
# # # # # # # # # # # # # # # # # # #

# Bad example

class A
    def to_s
        'A'
    end
end

class B < A
    def to_s
        ['B']
    end
end

# Good example

class A
    def to_s
        'A'
    end
end

class B < A
    def to_s
        'B'
    end
end



# [D] Dependency Inversion Principle
# # Description # # # # # # # # # # #
# High level modules should not depend upon low level modules. both should depend upon abstractions.
# # # # # # # # # # # # # # # # # # #

# Bad example

class UsersController
    def export
        users = UserModel.all

        case params[:format]
        when :xlsx
            XLSXExport.call(users)
        when :csv
            CSVExport.call(users)
        end 
    end
end


# Good example

class ExportService
    FORMATS = {
        xlsx: XlsxExport,
        csv:  CsvExport
    }

    def initialize(format:, users:)
        @format = format
        @users = users
    end

    def call
        FORMATS[format].call(users)
    end

    private

    attr_reader :format, :users
end

class UsersController
    def export
        users = UserModel.all

        export_service = ExportService.new(format: params[:format], users: users)
        export_service.call
    end
end