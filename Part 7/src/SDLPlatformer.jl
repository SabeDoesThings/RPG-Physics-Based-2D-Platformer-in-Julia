using SimpleDirectMediaLayer
using SimpleDirectMediaLayer.LibSDL2
using Setfield

include("entity.jl")
include("render_window.jl")

function main()
    @assert SDL_Init(SDL_INIT_VIDEO) == 0 "error initializing SDL: $(unsafe_string(SDL_GetError()))"
    @assert IMG_Init(IMG_INIT_PNG) != 0 "error initializing IMG: $(unsafe_string(SDL_GetError()))"

    window = RenderWindow("GAME v1.0", 1280, 720)

    grass_texture = load_texture("res/ground_grass_1.png", window)

    entities = [
        Entity(0.0, 0.0, grass_texture),
        Entity(30.0, 0.0, grass_texture),
        Entity(30.0, 30.0, grass_texture),
        Entity(30.0, 60.0, grass_texture)
    ]

    game_running = true

    event = Ref{SDL_Event}()

    while game_running
        while Bool(SDL_PollEvent(event))
            if event[].type == SDL_QUIT
                game_running = false
            end
        end

        clear(window)
        for i in 1:4
            render(entities[i], window)
        end
        display(window)
    end

    clean_up(window)
    SDL_Quit()
end

main()