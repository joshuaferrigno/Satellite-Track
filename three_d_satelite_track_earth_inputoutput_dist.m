% Joshua Ferrigno
% Department of Mechanical and Aerospace Engineering - UT Arlington

%------------------------------------------
%Find your x,y,z coordinates --->
%http://www.oc.nps.edu/oc2902w/coord/llhxyz.htm
%--------------------------------------------------------------------------
%Find the ISS x,y,z coordinates --->
%https://spaceflight.nasa.gov/realdata/sightings/SSapplications/Post/JavaSSOP/orbit/ISS/SVPOST.html
%Make sure to use the vector time corresponding to the correct epoch, and
%use the M50 Cartesian coordinates IN METERS
%--------------------------------------------------------------------------
%This code uses Mesa, AZ as the observer location
%And the ISS coordinates for 12:00:00 GMT 12/23/18 
%--------------------------------------------------------------------------

clear all;close all;clc

%initlize earth
rad=6.371e6;
%initilize observer
% xo=1000*input('Enter the observer x coordinates in km - ');
% yo=1000*input('Enter the observer y coordinates in km - ');
% zo=1000*input('Enter the observer z coordinates in km - ');
xo=-1981.952*1000;
yo=4947.342*1000;
zo=3492.696*1000;
axis square
%initilize satelite
sat=[-4820178.16 -725722.76 4710902.23];
%initilize satelite velocity
avsat=pi/12.5; %angular velcocity in rad/s
%graph
    %sphere
[x,y,z]=sphere;
surf(rad*x,rad*y,rad*z,'facecolor','none')
xlabel('X')
ylabel('Y')
zlabel('Z')
title('3D Satelite Tracking')
    %observer 
hold on
LP(1)=plot3(xo,yo,zo,'o','MarkerSize',9,'MarkerEdgeColor','c','MarkerFaceColor','c'); %observer coords
LS{1}='Observer';
plot3([0 xo],[0 yo],[0 zo],'b','Linewidth',3) %vector from inertial ref to observer
    %satelite
LP(2)=plot3(sat(1),sat(2),sat(3),'o','MarkerSize',9,'MarkerEdgeColor','g','MarkerFaceColor','g'); %satelite coords
LS{2}='Satelite';
plot3([xo sat(1)],[yo sat(2)],[zo sat(3)],':r','Linewidth',3) %vector from observer to satelite
hold off
legend(LP,LS)
%output satement
fprintf('The vector from the observer to the ISS =\nx = %.2f\ny = %.2f\nz = %.2f\n',sat(1)-xo,sat(2)-yo,sat(3)-zo);
vector=[sat(1)-xo sat(2)-yo sat(3)-zo];
vector=vector/norm(vector)



