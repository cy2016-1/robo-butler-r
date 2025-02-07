
function [map_local]=move_local_map(cog_n,map_n,map_param,color,line)%

%MAP_W=map_param(2);
%MAP_H=map_param(1);
MAP_H=40;
MAP_W=40;
MAP_SIZE=map_param(5);
MAP=ones(MAP_H,MAP_W)*0.01;

for i=1:MAP_H%获取全局地图
   for j=1:MAP_W
       pos_grid_n=[i*MAP_SIZE-MAP_H*MAP_SIZE/2+cog_n(1)+MAP_SIZE/2,j*MAP_SIZE-MAP_W*MAP_SIZE/2+cog_n(2)+MAP_SIZE/2];
       [Gx_n,Gy_n]=find_pos_on_map_n(pos_grid_n,map_param);
       MAP(i,j)=map_n(Gx_n,Gy_n)+0.001;
   end
end
  
X = linspace(0, MAP_H*MAP_SIZE, MAP_H)+cog_n(1)-MAP_H*MAP_SIZE/2;
Y = linspace(0, MAP_W*MAP_SIZE, MAP_W)+cog_n(2)-MAP_W*MAP_SIZE/2;
%mesh(Y,X,MAP)
s = surf(Y,X,MAP);
s.EdgeColor = 'interp';
s.FaceColor = 'g';
alpha(1)
map_local=MAP;
hold on;
end