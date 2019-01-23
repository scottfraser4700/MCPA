%initializing important stuff
q = 1.602e-19;
m_e = 9.11e-31;
nParticles = 2;
X = zeros(1,nParticles);
VX = zeros(1,nParticles);
t = 0;
dt = 1;
nSteps = 100;
E = 4;
sumVX = 0;
previousX = zeros(1,nParticles);
previousVX = zeros(1,nParticles);


%update electron's position and velocity while force is present
for t = 1:nSteps
    r = rand(1, nParticles);
    previousX(1) = X(1);
    previousVX(1) = VX(1);
    if (r(1) < 0.05)
        VX(1) = 0;
    else
        VX(1) = VX(1) + q*E*dt / m_e;
    end
    X(1) = X(1) + VX(1) * dt;
    sumVX = sumVX + VX(1);
    
    
    previousX(2) = X(2);
    previousVX(2) = VX(2);
    if (r(2) < 0.05)
        VX(2) = 0;
    else
        VX(2) = VX(2) + q*E*dt / m_e;
    end
    X(2) = X(2) + VX(2) * dt;
    sumVX = sumVX + VX(2);
    
    %plotting stuff
    
    subplot(2,1,1);
    plot([t-1 t], [previousX(1) X(1)], 'b')
    title('Position')
    pause(0.1)
    hold on
    plot([t-1 t], [previousX(2) X(2)], 'r')
    
    subplot(2,1,2);
    plot([t-1 t],[previousVX(1) VX(1)], 'b')
    title('Velocity')
    pause(0.1)
    hold on
    plot([t-1 t],[previousVX(2) VX(2)], 'r')
end

%calculate drift velocity
VD = sumVX /(nSteps*nParticles)


