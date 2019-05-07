# Dependency Injection
# # Description # # # # # # # # # # #
# Dependency Injection is passing dependency to other objects
# # # # # # # # # # # # # # # # # # #

# Bad example

class NotePresenter
    def initialize
      @note_storage = NoteTextStorage.new
    end
    
    def pending_notes
      notes = @note_storage.get_all
      notes.select { |n| n.pending? }
    end
end

# Good example

class NotePresenter
    def initialize(storage)
      @note_storage = storage
    end

    def pending_notes
      notes = @note_storage.get_all
      notes.select { |n| n.pending? }
    end
  end