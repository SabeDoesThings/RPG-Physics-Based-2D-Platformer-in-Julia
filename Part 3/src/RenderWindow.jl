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

function clean_up(rw::RenderWindow)
    SDL_DestroyRenderer(rw.renderer)
    SDL_DestroyWindow(rw.window)
end