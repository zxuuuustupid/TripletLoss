clear all
clc

% ����·��
base_path = 'F:\Project\TripletLoss\BJTU-RAO Bogie Datasets\Data\BJTU_RAO_Bogie_Datasets\' ;

% ����Ƶ�ʲ���
forces = {'0kN', '+10kN', '-10kN'}; % �������
frequencies = [20, 40, 60];         % Ƶ�����

% ѭ������ G1 �� G8
for G = 6:8
    for sample = 1:9
        % ��������Ƶ�ʵ�����
        force_index = ceil(sample / 3);
        freq_index = mod(sample-1, 3) + 1;

        % �����ļ�·��
        sample_folder = sprintf('M0_G%d_LA0_RA0\\Sample_%d', G, sample);

        % �ж��Ƿ�Ϊ G3�����ǣ��޸��ļ���
        if G == 3
            file_name = sprintf('data_gearbox_M0_G%d_LA0_RA0_%dHz_%s��.csv', G, frequencies(freq_index), forces{force_index});
        else
            file_name = sprintf('data_gearbox_M0_G%d_LA0_RA0_%dHz_%s.csv', G, frequencies(freq_index), forces{force_index});
        end

        full_path = fullfile(base_path, sample_folder, file_name);

        % ��ȡ����
        data = xlsread(full_path);
        data = data(:, 6); % ��ȡ��6������

        % ��̬���ɱ���·��������
        name = sprintf('M0_G%d_LA0_RA0_gearbox_CH18', G);
        save_path = fullfile('CWT3-1000', 'gearbox', 'test', sprintf('G%d', G), 'anomaly', sprintf('WC%d', sample));

        % ��������·������������ڣ�
        if ~exist(save_path, 'dir')
            mkdir(save_path);
        end

        % �����Զ��庯��
        Untitled2(data, save_path, name);
    end
end



%clear all
%clc
%
%% ����·��
%base_path = 'F:\Project\TripletLoss\BJTU-RAO Bogie Datasets\Data\BJTU_RAO_Bogie_Datasets\M0_G0_LA0_RA0\';
%
%% ����Ƶ�ʲ���
%forces = {'0kN', '+10kN', '-10kN'}; % �������
%frequencies = [20, 40, 60];         % Ƶ�����
%
%for sample = 1:9
%    % ��������Ƶ�ʵ�����
%    force_index = ceil(sample / 3); % ÿ3��Sample��Ӧһ����ֵ
%    freq_index = mod(sample-1, 3) + 1; % ÿ3��Sampleѭ����ͬƵ��
%
%    % �ļ���������·��
%    file_name = sprintf('Sample_%d\\data_gearbox_M0_G0_LA0_RA0_%dHz_%s.csv', ...
%                        sample, frequencies(freq_index), forces{force_index});
%    full_path = fullfile(base_path, file_name);
%
%    % ��ȡ���ݲ���ȡ��6��
%    data = xlsread(full_path);
%    data = data(:, 6);
%
%    % ��̬����·�����ļ���
%    name = sprintf('M0_G0_LA0_RA0_gearbox_CH18_WC%d', sample);
%    save_path = 'CWT3-1000\gearbox\train\health';
%
%    % ����ԭʼ����
%    Untitled2(data, save_path, name);
%end

