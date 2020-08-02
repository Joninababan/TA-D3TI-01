function varargout = TA(varargin)
% TA MATLAB code for TA.fig
%      TA, by itself, creates a new TA or raises the existing
%      singleton*.
%
%      H = TA returns the handle to a new TA or the handle to
%      the existing singleton*.
%
%      TA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TA.M with the given input arguments.
%
%      TA('Property','Value',...) creates a new TA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TA

% Last Modified by GUIDE v2.5 13-Jul-2020 10:42:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TA_OpeningFcn, ...
                   'gui_OutputFcn',  @TA_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before TA is made visible.
function TA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TA (see VARARGIN)

% Choose default command line output for TA
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in pushbutton1.
function loaddata_Callback(hObject, eventdata, handles)
try
%mendapatkan file dengan format xlsx    
[filename,path] = uigetfile('.xlsx')
data = xlsread(fullfile(path,filename),'sheet1','A2:G100');
      
        global skor;
        global ipk;
        global gjbb;
        global ID;
       
        cla
        axes(handles.axes1)
        ipk = data(:,7)
        plot(ipk,'-b.')
        grid on
        legend('Data Mahasiswa')
        ylabel('IPK')
        set(gca,'xtick',0:5:size(ipk))
        set(gca,'XtickLabel',0:5:size(ipk))
        set(gca, 'FontSize', 8)
        axes(handles.axes2)
        skor = data(:,6)
        plot(skor,'-b.')
        grid on
        legend('Data Mahasiswa')
        ylabel('Skor')
        set(gca,'xtick',0:5:size(skor))
        set(gca,'XtickLabel',0:5:size(skor))
        set(gca, 'FontSize', 8)
        axes(handles.axes3)
        gjbb = data(:,5)
        plot(gjbb,'-b.')
        grid on
        legend('Data Mahasiswa')
        ylabel('Gaji Beban(Juta)')
        set(gca,'xtick',0:5:size(gjbb))
        set(gca,'XtickLabel',0:5:size(gjbb))
        set(gca, 'FontSize', 8)
        ID = data(:,1)
        
catch 
    msgbox('Format data file yang dimasukkan tidak valid');
end
        



 



% --- Executes on button press in processbutton.
function processbutton_Callback(hObject, eventdata, handles)
try
FuzzyGa=newfis('Beasiswa');
% Tambahkan input IPK
FuzzyGa=addvar(FuzzyGa,'input','IPK',[3 4]); 
FuzzyGa=addmf(FuzzyGa,'input',1,'Rendah','trimf',[3 3 3.4]);
FuzzyGa=addmf(FuzzyGa,'input',1,'Sedang','trimf',[3.2 3.5 3.8]);
FuzzyGa=addmf(FuzzyGa,'input',1,'Tinggi','trimf',[3.6 4 4]);

FuzzyGa=addvar(FuzzyGa,'input','skorperilaku',[0 9]);
FuzzyGa=addmf(FuzzyGa,'input',2,'Rendah','trimf',[0 0 4]);
FuzzyGa=addmf(FuzzyGa,'input',2,'Sedang','trimf',[3 5 7]);
FuzzyGa=addmf(FuzzyGa,'input',2,'Tinggi','trimf',[6 9 9]);

FuzzyGa=addvar(FuzzyGa,'input','gajibeban',[0 15000000]);
FuzzyGa=addmf(FuzzyGa,'input',3,'Rendah','trimf',[0 0 5000000]);
FuzzyGa=addmf(FuzzyGa,'input',3,'Sedang','trimf',[4000000 6000000 10000000]);
FuzzyGa=addmf(FuzzyGa,'input',3,'Tinggi','trimf',[9000000 15000000 15000000]);

FuzzyGa=addvar(FuzzyGa,'output','Kelayakan',[0 1]);
FuzzyGa=addmf(FuzzyGa,'output',1,'Rendah','trimf',[0 0 0.3]);
FuzzyGa=addmf(FuzzyGa,'output',1,'Sedang','trimf',[0.3 0.5 0.7]);
FuzzyGa=addmf(FuzzyGa,'output',1,'Tinggi','trimf',[0.7 1 1]);


 rules = [1 1 1, 2 1 1
1 1 2 2 1 1
1 1 3 1 1 1
1 2 1 2 1 1
1 2 2 2 1 1
1 2 3 1 1 1
1 3 1 2 1 1
1 3 2 1 1 1
1 3 3 1 1 1
2 1 1 3 1 1
2 1 2 3 1 1
2 1 3 1 1 1
2 2 1 2 1 1
2 2 2 2 1 1
2 2 3 1 1 1
2 3 1 1 1 1
2 3 2 1 1 1
2 3 3 1 1 1
3 1 1 3 1 1
3 1 2 3 1 1
3 1 3 1 1 1
3 2 1 3 1 1
3 2 2 2 1 1
3 2 3 1 1 1
3 3 1 2 1 1
3 3 2 2 1 1
3 3 3 1 1 1];

FuzzyGa = addrule(FuzzyGa,rules);
%fuzzy(Beasiswa)

        global ipk
        global skor
        global gjbb
        global ID
        

JumGen = length(FuzzyGa.input);
gen = FuzzyGa.input;
gen.name;
Out=FuzzyGa.output;


MaxIter = 100;
UkPop = 10;
pcross = 0.9;
pmutasi = 0.1;




%fuzzy parameters
tablegen = struct2table(gen);
ParamIPK = tablegen.range(1,1:2);
ParamSkor = tablegen.range(2,1:2);
ParamGJBB = tablegen.range(3,1:2);
tableparam = tablegen.mf;
ipk1 = tableparam(1,1);
ipk2 = tableparam(1,2);
ipk3 = tableparam(1,3);
i1 = ipk1.params;
i2 = ipk2.params;
i3 = ipk3.params;
skor1 = tableparam(2,1);
skor2 = tableparam(2,2);
skor3 = tableparam(2,3);
s1 = skor1.params;
s2 = skor2.params;
s3 = skor3.params;
gjbb1 = tableparam(3,1);
gjbb2 = tableparam(3,2);
gjbb3 = tableparam(3,3);
g1 = gjbb1.params;
g2 = gjbb2.params;
g3 = gjbb3.params;





minipk = min(i1);
maxipk = max(i3);
ipkrl = length (i1);
ipksl = length (i2);
ipktl = length (i3);
ipklength = ipkrl + ipksl + ipktl;

%Pop =  (maxrendah-minrendah).* rand(UkPop,ipklength) + minrendah;

%Inisiasi Populasi
minskor = min(s1);
maxskor = max(s3);
skorrl = length(s1);
skorsl = length(s2);
skortl = length(s3);
skorlength = skorrl + skorsl+ skortl;

mingjbb = min(g1);
maxgjbb = max(g3);
gjbbrl = length(g1);
gjbbsl = length(g2);
gjbbtl = length(g3);
gjbblength = gjbbrl + gjbbsl + gjbbtl;


Pop1= InisiasiPopulasi(maxskor,UkPop);
Pop2= GInisiasiPopulasi(maxgjbb,UkPop);
Pop3= IInisiasiPopulasi(maxipk,UkPop,minipk);

fitness = myFitness(Pop1);
fitness2 = GmyFitness(Pop2);
fitness3 = ImyFitness(Pop3);


Populasi = struct();


for i = 1:UkPop
    Populasi(i).pop = Pop1(:,i);
    Populasi(i).fitness = fitness(:,i);
    
end

Populasi2 = struct();

for i = 1:UkPop
    Populasi2(i).pop2 = Pop2(:,i);
    Populasi2(i).fitness2 = fitness2(:,i);
    
end

Populasi3 = struct();

for i = 1:UkPop
    Populasi3(i).pop3 = Pop3(:,i);
    Populasi3(i).fitness3 = fitness3(:,i);
    
end



Populasi.fitness;

for i = 1:MaxIter
    
[parent1, parent2] = selection(Populasi);
[Gparent1, Gparent2] = Gselection(Populasi2);
[Iparent1, Iparent2] = Iselection(Populasi3);

[child1,child2] = crossover(parent1,parent2,pcross);
[Gchild1,Gchild2] = Gcrossover(Gparent1,Gparent2,pcross);
[Ichild1,Ichild2] = Icrossover(Iparent1,Iparent2,pcross);

parent1.pop;
parent2.pop;
Gparent1.pop2;
Gparent2.pop2;
child1.pop;
child2.pop;


mutant1 = mutation(child1,pmutasi,maxskor);
mutant2 = mutation(child2,pmutasi,maxskor);

Gmutant1 = Gmutation(Gchild1,pmutasi,maxgjbb);
Gmutant2 = Gmutation(Gchild2,pmutasi,maxgjbb);

Imutant1 = Imutation(Ichild1,pmutasi,maxipk);
Imutant2 = Imutation(Ichild2,pmutasi,maxipk);

mutant1.fitness = myFitness(mutant1.pop);
mutant2.fitness = myFitness(mutant2.pop);

Gmutant1.fitness2 = GmyFitness(Gmutant1.pop2);
Gmutant2.fitness2 = GmyFitness(Gmutant2.pop2);

Imutant1.fitness3 = ImyFitness(Imutant1.pop3);
Imutant2.fitness3 = ImyFitness(Imutant2.pop3);


offspring1 = mutant1;
offspring2 = mutant2;
children = [offspring1, offspring2];

Goffspring1 = Gmutant1;
Goffspring2 = Gmutant2;
Gchildren = [Goffspring1, Goffspring2];

Ioffspring1 = Imutant1;
Ioffspring2 = Imutant2;
Ichildren = [Ioffspring1, Ioffspring2];

Populasi = elitism(children,Populasi);
Populasi2 = Gelitism(Gchildren,Populasi2);
Populasi3 = Ielitism(Ichildren,Populasi3);

[best_solution_skor,~] = selection(Populasi);
best_solution_skor.pop(1) = minskor;
best_solution_skor.pop(10) = maxskor;
best_solution_skor.pop;
best_solution_skor.fitness;

[best_solution_gjbb,~] = Gselection(Populasi2);
best_solution_gjbb.pop2(1) = mingjbb;
best_solution_gjbb.pop2(10) = maxgjbb;
best_solution_gjbb.pop2;
best_solution_gjbb.fitness2;

[best_solution_ipk,~] = Iselection(Populasi3);
best_solution_ipk.pop3(1) = minipk;
best_solution_ipk.pop3(10) = maxipk;
best_solution_ipk.pop3;
best_solution_ipk.fitness3;



end


x1=sort(best_solution_skor.pop);
x1 = x1';

x2=sort(best_solution_gjbb.pop2);
x2 = x2';

x3=sort(best_solution_ipk.pop3);
x3 = x3';

FuzzyGa=newfis('Beasiswa');



FuzzyGa=addvar(FuzzyGa,'input','gajibeban',[mingjbb maxgjbb]);
FuzzyGa=addmf(FuzzyGa,'input',1,'Rendah','trimf',[x2(1) x2(2) x2(4)]);
FuzzyGa=addmf(FuzzyGa,'input',1,'Sedang','trimf',[x2(3) x2(5) x2(7)]);
FuzzyGa=addmf(FuzzyGa,'input',1,'Tinggi','trimf',[x2(6) x2(8) x2(10)]);

FuzzyGa=addvar(FuzzyGa,'input','skorperilaku',[minskor maxskor]);
FuzzyGa=addmf(FuzzyGa,'input',2,'Rendah','trimf',[x1(1) x1(2) x1(4)]);
FuzzyGa=addmf(FuzzyGa,'input',2,'Sedang','trimf',[x1(3) x1(5) x1(7)]);
FuzzyGa=addmf(FuzzyGa,'input',2,'Tinggi','trimf',[x1(6) x1(8) x1(10)]);


FuzzyGa=addvar(FuzzyGa,'input','IPK',[minipk maxipk]); 
FuzzyGa=addmf(FuzzyGa,'input',3,'Rendah','trimf',[x3(1) x3(2) x3(4)]);
FuzzyGa=addmf(FuzzyGa,'input',3,'Sedang','trimf',[x3(3) x3(5) x3(7)]);
FuzzyGa=addmf(FuzzyGa,'input',3,'Tinggi','trimf',[x3(6) x3(8) x3(10)]);


FuzzyGa=addvar(FuzzyGa,'output','Kelayakan',[0 1]);
FuzzyGa=addmf(FuzzyGa,'output',1,'Rendah','trimf',[0 0 0.3]);
FuzzyGa=addmf(FuzzyGa,'output',1,'Sedang','trimf',[0.3 0.5 0.7]);
FuzzyGa=addmf(FuzzyGa,'output',1,'Tinggi','trimf',[0.7 1 1]);


rules = [1 1 1, 3 1  1
1 1 2 3 1  1
1 1 3 3 1  1
1 2 3 3 1  1
1 2 2 2 1  1
1 2 1 2 1  1
1 3 2 2 1  1
1 3 1 1 1  1
1 3 3 2 1  1
2 1 1 1 1  1
2 1 2 2 1  1
2 1 3 2 1  1
2 2 1 2 1  1
2 2 2 2 1  1
2 2 3 2 1  1
2 3 1 1 1  1
2 3 2 1 1  1
2 3 3 2 1  1
3 1 1 1 1  1
3 1 2 1 1  1
3 1 3 1 1  1
3 2 1 1 1  1
3 2 2 1 1  1
3 2 3 1 1  1
3 3 1 1 1  1
3 3 2 1 1  1
3 3 3 1 1  1];

FuzzyGa = addrule(FuzzyGa,rules);

out = evalfis([gjbb, skor, ipk],FuzzyGa);

fis = FuzzyGa;

tableData = [ID,gjbb, skor,ipk,out];
tableData = flipud(sortrows(tableData,5));
set(handles.uitable1,'data',tableData(1:10,:),'ColumnName',{'ID';'Gaji Beban';'Skor Perilaku';'IPK';'Kelayakan'});


catch
    msgbox('Data belum dimasukkan');
end


% --- Executes on button press in savebutton.
function savebutton_Callback(hObject, eventdata, handles)
try
[excelName,excelPath] = uiputfile('*.xlsx')
headers = {'ID','Gaji Beban','Skor Perilaku','IPK','Kelayakan'}
data = get(handles.uitable1, 'data');
datacell = num2cell(data);
a = [headers;datacell];
x1Range = 'A1';
xlswrite([excelPath excelName],a,x1Range)
catch
    msgbox('Data error')
end
