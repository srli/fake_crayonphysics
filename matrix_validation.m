p_length = [1, 1, 1];
p_mass = [1, 1, 1];
t_init = [pi/4, pi/4, pi/4];
tv_init = [0.1, 0.1, 0.1];
g = 9.81;
[m, n_size] = size(p_length);

A = zeros(n_size*3);
r = zeros(n_size*3, 1);
i = 1;
j = 1;
initial_vals = zeros(n_size*2, 1);

while j <= n_size
    initial_vals((j*2)-1) = t_init(j);
    initial_vals((j*2)) = tv_init(j);
    j = j + 1;
end

Z = initial_vals;

while i <= n_size
    Mi = p_mass(i);
    Li = p_length(i);
    ti = Z(2*i - 1);
    tid = Z(2*i);
    o = 1;
    while o <= i
        A(3*i-2, o) = -Mi*p_length(o)*cos(Z(2*o -1));
        A(3*i-1, o) = Mi*p_length(o)*sin(Z(2*o - 1));
        o = o + 1;
    end
    A(3*i-2, i) = A(3*i-2, i) + (Mi*Li/2)*cos(ti);
    A(3*i-1, i) = A(3*i-1, i) - (Mi*Li/2)*sin(ti);

    A(3*i-2, n_size+(2*i-1)) = -1;
    A(3*i-1, n_size+(2*i)) = -1;

    if (n_size+(2*i+2)) <= (n_size*3)
        A(3*i-2, n_size+(2*i+1)) = 1;
        A(3*i-1, n_size+(2*i+2)) = 1;
    end

    A(3*i, i) = -Mi*Li^2/12;
    A(3*i, n_size+(2*i)-1) = (Li/2)*cos(ti);
    A(3*i, n_size+(2*i)) = -(Li/2)*sin(ti);
    if i < n_size
        A(3*i, n_size+2*i+1) = (Li/2)*cos(ti);
        A(3*i, n_size+(2*i)+2) = -(Li/2)*sin(ti);
    end
    o = 1;
    c = 1;
    while o < n_size*3
        tempx = 0;
        tempy = 0;
        while c <= i
            %tempx = -Mi*p_length(c)*Z(2*c)^2*sin(Z(2*c-1))
            %tempy = -Mi*p_length(c)*Z(2*c)^2*cos(Z(2*c-1))
            tempx = tempx - Mi*p_length(c)*Z(2*c)^2*sin(Z(2*c-1));
            tempy = tempy - Mi*p_length(c)*Z(2*c)^2*cos(Z(2*c-1));
            c = c+1;
        end
        r(o, 1) = tempx + (Mi*Li/2)*tid^2*sin(ti);
        r(o+1,1) = tempy + (Mi*Li/2)*tid^2*cos(ti) - Mi*g;
        r(o+2,1) = 0;
        o = o + 3;
    end
    i = i+1;
end