mutable struct Entity
    pos::Vector2f
    tex::Ptr{SDL_Texture}
    current_frame::SDL_Rect

    function Entity(p_pos::Vector2f, p_tex::Ptr{SDL_Texture})
        current_frame = SDL_Rect(0, 0, 32, 32)
        pos = p_pos
        return new(pos, p_tex, current_frame)
    end
end