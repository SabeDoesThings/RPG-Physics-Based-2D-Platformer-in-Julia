mutable struct Entity
    x::Float64
    y::Float64
    current_frame::SDL_Rect
    tex::Ptr{SDL_Texture}

    function Entity(p_x::Float64, p_y::Float64, p_tex::Ptr{SDL_Texture})
        
    end
end