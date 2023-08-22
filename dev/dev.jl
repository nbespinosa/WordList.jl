
using WordList


    fn = "/home/nayeris/.julia/dev/WordList/store/listado.txt"
    words = load_words(fn)    
    println.(words) 
    typeof(words)  


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1st condition: large

function large_words(palabras, len)
    yes_words =[]
    for word in palabras
        if length(word) == len
            push!(yes_words, word)
        end
    end
    println(yes_words)
    return yes_words
end
   

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Descomposicion 

function Diccionary(palabras)
    d = Dict()
    for word in palabras
        d[word] = []
        for letters in word
            push!(d[word], letters)
        end
    end
    return d
end

function solve(letters, len, palabras)
    filtradas = large_words(palabras, len)
    d = Diccionary(filtradas)
    verf = []
    n=length(letters)
    i=1
    while i<=n
        push!(verf,0)
        i += 1
    end 
    solution = []
    for words in filtradas
        v = true
        for letras in d[words]
            i = 1 
            k = false
            while i <= n
                if letters[i] == letras && verf[i]==0
                    verf[i] += 1
                    k=true
                    break
                end
                i+=1
            end
            if k==false
                v=false
                break
            end
        end
        if v
            push!(solution,words)
        end
        i=1
        while i<=n     
            verf[i]=0
            i+=1
        end
    end
    return solution
end

l = ['c','u','c','o','e','u','a','v','m','l','e','ñ']

println(solve(l,6,words))   





