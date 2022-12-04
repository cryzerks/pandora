--- @region: callback system
local callbacks = {}

--- @param: event_type: string
--- @param: callback: function
--- @return: void
function callbacks.add(event_type, callback)
    if (event_type == nil) then
        error("callback_add: event_type")
    end

    if (callback == nil) then
        error("callback_add: callback")
    end

    local item = callbacks.register(event_type, callback)

    return item
end

--- @param: name: string
--- @param: func: string
function callbacks.set(name, func)
    if (name == nil) then
        error("callback_set: name")
    end

    if (func == nil) then
        error("callback_set: function")
    end

    local item = name:add_callback(func)

    return item
end
--- @endregion

--- @region: font
--- @class: font_c
local font_c = {}

--- @param: name: string
--- @param: size: string
--- @param: size: weight
--- @param: flags: number: optional
--- @return: font_c
function font_c.new(name, size, weight, flags)
    if (name == nil) then
        error("font_c: name")
    end

    if (size == nil) then
        error("font_c: size")
    end

    if (weight == nil) then
        error("font_c: weight")
    end

    local item = render.create_font(name, size, weight, flags)

    return item
end
--- @endregion

--- @region: menu items
local gui = {}

--- @class: checkbox
--- @param: name: string
function gui:new_checkbox(name)
    if (name == nil) then
        error("checkbox: name")
    end

    local item = ui.add_checkbox(name)

    return item
end

--- @class: combo
--- @param: name: string
--- @param: items: string
function gui:new_combo(name, ...)
    if (name == nil) then
        error("combo: name")
    end

    local items = ...

    if (items == nil) then
        error("combo: items")
    end

    local item = ui.add_dropdown(name, items)

    return item
end

--- @class: multicombo
--- @param: name: string
--- @param: items: string
function gui:new_multicombo(name, ...)
    if (name == nil) then
        error("multicombo: name")
    end

    local items = ...

    if (items == nil) then
        error("multicombo: items")
    end

    local item = ui.add_multi_dropdown(name, ...)

    return item
end

--- @class: button
--- @param: name: string
function gui:new_button(name)
    if (name == nil) then
        error("button: name")
    end

    local item = ui.add_button(name)

    return item
end

--- @class: input
--- @param: name: string
function gui:new_input(name)
    if (name == nil) then
        error("input: name")
    end

    local item = ui.add_textbox(name)

    return item
end

--- @class: label
--- @param: name: string
function gui:new_label(name)
    if (name == nil) then
        error("label: name")
    end

    local item = ui.add_label(name)

    return item
end

--- @class: slider
--- @param: name: string
--- @param: min: string
--- @param: max: string
function gui:new_slider(name, element_type, min, max)
    if (name == nil) then
        error("slider: name")
    end

    if (min == nil) then
        error("slider: min")
    end

    if (max == nil) then
        error("slider: max")
    end

    local item

    if (element_type == "int") then
        item = ui.add_slider(name, min, max)
    elseif (element_type == "float") then
        item = ui.add_slider_float(name, min, max)
    end
 
    return item
end
--- @endregion