mutable struct RenderWindow
    window::Ptr{SDL_Window}
    renderer::Ptr{SDL_Renderer}

    function RenderWindow(p_title::String, p_w::Int, p_h::Int)
        window = SDL_CreateWindow(p_title, SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, p_w, p_h, SDL_WINDOW_SHOWN)
    
        if window == C_NULL
            println("Window failed to init. Error: ", SDL_GetError())
        end
    
        renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED)

        return new(window, renderer)
    end
end

function load_texture(p_filePath::String, rw::RenderWindow)
    texture = IMG_LoadTexture(rw.renderer, p_filePath)

    if texture == C_NULL
        println("Failed to load texture. Error: $(unsafe_string(SDL_GetError()))")
    end

    return texture
end

function clear(rw::RenderWindow)
    SDL_RenderClear(rw.renderer)
end

function render(p_tex::Ptr{SDL_Texture}, rw::RenderWindow)
    src = SDL_Rect(0, 0, 32, 32)
    dst = SDL_Rect(400, 200, 32 * 4, 32 * 4)

    SDL_RenderCopy(rw.renderer, p_tex, Ref(src), Ref(dst))
end

function display(rw::RenderWindow)
    SDL_RenderPresent(rw.renderer)
end

function clean_up(rw::RenderWindow)
    SDL_DestroyRenderer(rw.renderer)
    SDL_DestroyWindow(rw.window)
end