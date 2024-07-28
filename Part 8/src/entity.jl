mutable struct Entity
    x::Float64
    y::Float64
    tex::Ptr{SDL_Texture}
    current_frame::SDL_Rect

    function Entity(p_x::Float64, p_y::Float64, p_tex::Ptr{SDL_Texture})
        current_frame = SDL_Rect(0, 0, 32, 32)
        return new(p_x, p_y, p_tex, current_frame)
    end
end

function getX(entity::Entity)
    return entity.x
end

function getY(entity::Entity)
    return entity.y
end

function getTex(entity::Entity)
    return entity.tex
end

function getCurrentFrame(entity::Entity)
    return entity.currentFrame
end