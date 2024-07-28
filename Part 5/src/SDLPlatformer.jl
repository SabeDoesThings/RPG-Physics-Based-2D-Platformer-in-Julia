using SimpleDirectMediaLayer
using SimpleDirectMediaLayer.LibSDL2
using Setfield

include("render_window.jl")
include("entity.jl")

function main()
    @assert SDL_Init(SDL_INIT_VIDEO) == 0 "error initializing SDL: $(unsafe_string(SDL_GetError()))"
    @assert IMG_Init(IMG_INIT_PNG) != 0 "error initializing IMG: $(unsafe_string(SDL_GetError()))"

    window = RenderWindow("GAME v1.0", 1280, 720)

    grass_texture = load_texture("res/ground_grass_1.png", window)

    game_running = true

    event = Ref{SDL_Event}()

    while game_running
        while Bool(SDL_PollEvent(event))
            if event[].type == SDL_QUIT
                game_running = false
            end
        end

        clear(window)
        render(grass_texture, window)
        display(window)
    end

    clean_up(window)
    SDL_Quit()
end

main()