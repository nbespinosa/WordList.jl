export load_words
function load_words(fn::String)
    txt = read(fn, String)
    words = split(txt, "\n")
    return words
end

