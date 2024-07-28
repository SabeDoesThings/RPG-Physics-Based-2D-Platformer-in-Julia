using SimpleDirectMediaLayer
using SimpleDirectMediaLayer.LibSDL2

include("RenderWindow.jl")

function main()
    @assert SDL_Init(SDL_INIT_VIDEO) == 0 "error initializing SDL: $(unsafe_string(SDL_GetError()))"
    @assert IMG_Init(IMG_INIT_PNG) != 0 "error initializing IMG: $(unsafe_string(SDL_GetError()))"

    window = RenderWindow("GAME v1.0", 1280, 720)

    game_running = true

    event = Ref{SDL_Event}()

    while game_running
        while Bool(SDL_PollEvent(event))
            if event[].type == SDL_QUIT
                game_running = false
            end
        end
    end

    clean_up(window)
    SDL_Quit()
end

main()