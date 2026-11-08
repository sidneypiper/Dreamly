-- Tag colors offered by the color picker
INSERT INTO "Color" ("id", "hex") VALUES
    ('color_peach', '#FDE4CF'),
    ('color_rose', '#FFCFD2'),
    ('color_orchid', '#F1C0E8'),
    ('color_lavender', '#CFBAF0'),
    ('color_periwinkle', '#A3C4F3'),
    ('color_sky', '#90DBF4'),
    ('color_aqua', '#8EECF5'),
    ('color_mint', '#98F5E1'),
    ('color_pistachio', '#B9FBC0')
ON CONFLICT ("id") DO NOTHING;
