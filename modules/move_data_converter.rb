module DataConverter
    def data_converter(data)
        value = data 
        value = true if data == "true"
        value = false if data == "false"
        value = nil if data == "nil"
        value 
    end 
end 