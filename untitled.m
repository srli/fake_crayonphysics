figure

load clown

imagesc(X)
colormap(map)
axis off

hold on

rectangle('position',[50 30 70 30], ...
    'facecolor','r')

f=getframe(gca)
[X, map] = frame2im(f);

imwrite(X,'test.jpg','jpeg')