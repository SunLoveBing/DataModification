clear all;
close all;
clc;

path = 'D:\Landmark Detection\Database\Test\SUV\无侧窗';
dataPath = dir(path);

%统计数据文件的个数
dataFileNum = 0;
for i = 1 : length(dataPath)
    if strcmp(dataPath(i).name,'.') || strcmp(dataPath(i).name,'..')
        continue;
    else
        dataFileNum = dataFileNum + 1;
    end
end

%获得每一个数据文件的路径
dataFilePath = cell(dataFileNum,1);
for i = 1 : dataFileNum
    dataFilePath{i} = strcat(path,'\',dataPath(i+2).name);
end

%打开每一个数据文件,并进行数据整理
for i = 1 : dataFileNum
    [fid,message] = fopen(dataFilePath{i},'r');
    if fid == -1
        disp(message)
    else 
        data = textscan(fid,'%s','%d');
    end
    fclose(fid);
    
    %数据整理
    %第55条线
    data{1,1}{1085,1} = data{1,1}{1005,1};
    data{1,1}{1086,1} = data{1,1}{1006,1};
    data{1,1}{1090,1} = data{1,1}{1005,1};
    data{1,1}{1091,1} = data{1,1}{1006,1};
    data{1,1}{1094,1} = data{1,1}{1005,1};
    data{1,1}{1095,1} = data{1,1}{1006,1};
    data{1,1}{1098,1} = data{1,1}{1005,1};
    data{1,1}{1099,1} = data{1,1}{1006,1};

    %第56条线
    data{1,1}{1105,1} = data{1,1}{1005,1};
    data{1,1}{1106,1} = data{1,1}{1006,1};
    data{1,1}{1110,1} = data{1,1}{1010,1};
    data{1,1}{1111,1} = data{1,1}{1011,1};
    data{1,1}{1114,1} = data{1,1}{1014,1};
    data{1,1}{1115,1} = data{1,1}{1015,1};
    data{1,1}{1118,1} = data{1,1}{1018,1};
    data{1,1}{1119,1} = data{1,1}{1019,1};

    %第57条线
    data{1,1}{1125,1} = data{1,1}{1018,1};
    data{1,1}{1126,1} = data{1,1}{1019,1};
    data{1,1}{1130,1} = data{1,1}{1018,1};
    data{1,1}{1131,1} = data{1,1}{1019,1};
    data{1,1}{1134,1} = data{1,1}{1018,1};
    data{1,1}{1135,1} = data{1,1}{1019,1};
    data{1,1}{1138,1} = data{1,1}{1018,1};
    data{1,1}{1139,1} = data{1,1}{1019,1};
    
    %格式化输出到数据文件
    [fid,message] = fopen(dataFilePath{i},'w+');
    if fid == -1
        disp(message);
    else
       %格式化输出
        for j = 1 : 20 : 180
            fprintf(fid,'%s',data{1,1}{j,1},'  ',data{1,1}{j+1,1});
            fprintf(fid,'%8s',data{1,1}{j+2,1});
            fprintf(fid,'%12s',data{1,1}{j+3,1});
            fprintf(fid,'%16s',data{1,1}{j+4,1},data{1,1}{j+5,1},data{1,1}{j+6,1});
            fprintf(fid,' ');
            fprintf(fid,'%s',data{1,1}{j+7,1});
            fprintf(fid,'\n');

            fprintf(fid,'%s',data{1,1}{j+8,1});
            fprintf(fid,'%21s',data{1,1}{j+9,1});
            fprintf(fid,'%16s',data{1,1}{j+10,1},data{1,1}{j+11,1});
            fprintf(fid,'\n');

            fprintf(fid,'%s',data{1,1}{j+12,1});
            fprintf(fid,'%21s',data{1,1}{j+13,1});
            fprintf(fid,'%16s',data{1,1}{j+14,1},data{1,1}{j+15,1});
            fprintf(fid,'\n');

            fprintf(fid,'%s',data{1,1}{j+16,1});
            fprintf(fid,'%21s',data{1,1}{j+17,1});
            fprintf(fid,'%16s',data{1,1}{j+18,1},data{1,1}{j+19,1});
            fprintf(fid,'\n');
        end

        for j = 181 : 20 : 1921
            fprintf(fid,'%s',data{1,1}{j,1},'  ',data{1,1}{j+1,1});
            fprintf(fid,'%8s',data{1,1}{j+2,1});
            fprintf(fid,'%12s',data{1,1}{j+3,1});
            fprintf(fid,'%16s',data{1,1}{j+4,1},data{1,1}{j+5,1},data{1,1}{j+6,1});
            fprintf(fid,' ');
            fprintf(fid,'%s',data{1,1}{j+7,1});
            fprintf(fid,'\n');

            fprintf(fid,'%s',data{1,1}{j+8,1});
            fprintf(fid,'%20s',data{1,1}{j+9,1});
            fprintf(fid,'%16s',data{1,1}{j+10,1},data{1,1}{j+11,1});
            fprintf(fid,'\n');

            fprintf(fid,'%s',data{1,1}{j+12,1});
            fprintf(fid,'%20s',data{1,1}{j+13,1});
            fprintf(fid,'%16s',data{1,1}{j+14,1},data{1,1}{j+15,1});
            fprintf(fid,'\n');

            fprintf(fid,'%s',data{1,1}{j+16,1});
            fprintf(fid,'%20s',data{1,1}{j+17,1});
            fprintf(fid,'%16s',data{1,1}{j+18,1},data{1,1}{j+19,1});
            fprintf(fid,'\n');
        end 
    end
    fclose(fid);
end