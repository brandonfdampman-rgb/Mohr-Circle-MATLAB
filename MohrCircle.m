repeat='y';                  %repeat equals 'y' helps supports line 2 while loop 
while strcmp(lower(repeat),'y')
sigmaX=input('Enter sigma x (stress in x direction, MPa): ');
while isempty(sigmaX)|sigmaX==char        % while used so sigma X can't be no value 
    sigmaX = input('Enter sigma x (stress in x direction, MPa): ');
end
sigmaY=input('Enter sigma y (stress in y direction, MPa): ');
while isempty(sigmaY)        % while used so sigma Y can't be no value 
    sigmaY = input('Enter sigma y (stress in y direction, MPa): ');
end
shear=input('Enter the shear stress (MPa): ');
while isempty(shear)         % while used so shear can't be no value 
    shear=input('Enter the shear stress (MPa): ');
end

avgsigma=(sigmaX+sigmaY)/2;
R=sqrt(((sigmaX-sigmaY)/2)^2+(shear)^2);
theta=linspace(0,2*pi);
xcoord=R*cos(theta)+avgsigma;
ycoord=R*sin(theta)+0;
x=0;    %needed for the x axis 
y1=0;
plot(xcoord,ycoord,'k','LineWidth',1.5)
hold on
plot([avgsigma,avgsigma],[0,R],'g')
plot(avgsigma,0,'ro','MarkerSize',5,'LineWidth',2)
hold off
grid on 
xlabel('Normal Stress (σ)')
ylabel('Shear Stress (τ)')
axis equal
xline(x,'k','LineWidth',1)
yline(y1,'k','LineWidth',1)
ylim([-1.5*R,1.5*R])
title('Mohr Circle Plot')
fprintf('The center of the circle is at (%g,%d)\n',[avgsigma;y1])
disp(['The Radius of the circle is ',num2str(R)])
disp('The Mohr circle is plotted')
repeat=input('Do you want to continue?(Y/N): ','s');
repeat=lower(repeat); 
while isempty(repeat) | ~strcmp(lower(repeat),'y')
if strcmp(lower(repeat),'n')       
    break 
end
    repeat=input('Do you want to continue?(Y/N): ','s');
end
end

