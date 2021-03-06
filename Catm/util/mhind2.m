%Metropolis-Hastings: Independence Sampler
function [v logpi arind] = mhind2(v, u, lambdaV, nkd, K)

%Sample new value for v
vNew = normrnd(u, lambdaV);

%calculate invariant distribution
nkd2 = flipud(cumsum(flipud(nkd(2:K))));
phiold = nkd(1:K-1) .* -log(1+exp(-v)) + nkd2 .* -log(1 + exp(v));
phinew = nkd(1:K-1) .* -log(1+exp(-vNew)) + nkd2 .* -log(1 + exp(vNew));

%calculate acceptance ratio
ar = phinew - phiold;
arind = ar > log(rand(size(ar)));
v(arind) = vNew(arind);
logpi = v2pi(v);

