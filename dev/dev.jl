
using WordList

let
    fn = "/home/nayeris/.julia/dev/WordList/store/blablo.txt"
    words = load_words(fn)
    println.(words)
    typeof(words)

    println("for (version 2)")
    for wordindex in eachindex(words)
        println(wordindex, ": ", words[wordindex]) 
     end
    
     for word in words
        esConA = startswith(word, "a") 
        if esConA
            println(word)
        end
    end

    function building_words(letters, words)
    build_words = []
        for word in words
        available_letters = copy(letters)
        is_build = true
            if is_build
                push!(build_words, word)
            end
        end
        letters = ['b', 'o', 'y'] 
        build_words = building_words(letters, words) # return built_words, letters = ['b', 'y', 'o']
        println(build_words)
    end

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    function large_words(t, len)
    yes_words = []
        for word in words
            if length(word) == len
                push!(yes_words, word)
            end
        end
        return yes_words
    end
    t = words
    large_words(words, 3)
end