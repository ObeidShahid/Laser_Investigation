function f0=fzeros(FunFcn,emin,emax,de)
%FZEROS(XMIN,XMAX,DX) program that finds multiple zeros of the function FunFcn 
%                    in the interval between emin and emax with scanning step de.

nzeros=0;  %counter of number of zeros 
e=emin;    %initial value

      funstr=0;
while e<=emax
      funnov=feval(FunFcn,e);
%       is it initial value of the funtion immidietaly =0?
        if funnov==0;
          f0(nzeros+1)=e;
          e=e+de/10;
          nzeros=nzeros+1;
        end
%       looking for change of the sign of function
        if funstr*funnov<0
          eblizu=e-de/2;
          f0(nzeros+1)=fzero(FunFcn,[e-de e]);
            if f0(nzeros+1)>=emax  %is it zero slightly larger of emax?
              break
            end
          e=f0(nzeros+1)+de/10;
          nzeros=nzeros+1;
          funstr=0;
         else
          funstr=funnov;
          estr=e;
          vrh=emax-e;
          if vrh==0,break,end
            if vrh<=de;
               e=emax;
            else
               e=e+de;
            end
         end
end