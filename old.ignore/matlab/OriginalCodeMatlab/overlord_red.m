function overlord_red

%open file storing latin squares that work
fid = fopen('reduced_works.dat', 'w');

%loop through file of reduced latin squares
for i=1:24
    %open file containing reduced latin squares order 4
    fid2 = fopen('reduced_ls.dat');
    
    %read in dummies
    for k=1:(i-1)
        dummy = fscanf (fid2,'%u',[4 4]);
    end
    
    %read in first ls
    A = fscanf(fid2,'%u', [4 4]);
    %A = A';
    for j=i+1:24
        
        %read in ls to be compared
        B = fscanf(fid2,'%u',[4,4]);
        %B = B';
        %if the work output ls' that work
        if ( check_latin_square(A,B) == 1)
            fprintf(fid,'%u ', i);
            fprintf(fid,'%u', j);
            fprintf(fid,'\n');
            
        end
    end
    fclose(fid2);
end

fclose(fid);
            