class Map
    def initialize
        @map = []
    end

    def set(key, value)
        has_key = false
        @map.each do |entry|
            if entry[0] == key
                entry[1] = value
                has_key = true
                return
            end
        end
        @map << [key, value] unless has_key
    end

    def get(key)
        @map.each { |entry| return entry[1] if entry[0] == key }
    end

    def delete(key)
        @map.delete_if { |entry| entry[0] == key }
    end

    def show
        @map.each { |entry| puts "#{entry[0]} => #{entry[1]}" }
    end
end