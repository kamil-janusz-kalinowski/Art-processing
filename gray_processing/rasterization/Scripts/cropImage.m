function img_croped = cropImage(img, box)
    img_croped = img(box(2):box(4), box(1):box(3));
end
