import csv
import numpy as np


argument_file = "C:\\Users\\Jason\\Documents\\Git\\DataProcessing\\Test1\\Himogloban\\Hemoglobin.csv"
lambda_1 = 600
lambda_2 = 700
input1 = 1
input2 = 1

# Read the data from the file and convert it to np.array
Hemoglobin_data_String = []
with open(argument_file) as csvfile:
    csv_reader = csv.reader(csvfile)  # 使用csv.reader读取csvfile中的文件
    for row in csv_reader:  # 将csv 文件中的数据保存到birth_data中
        Hemoglobin_data_String.append(row)

Hemoglobin_data = [[float(x) for x in row] for row in Hemoglobin_data_String]  # 将数据从string形式转换为float形式
Hemoglobin_data = np.array(Hemoglobin_data)  # 将list数组转化成array数组便于查看数据结构
index1 = np.argwhere(Hemoglobin_data[:, 0] == lambda_1)  # 找到lambda_1的位置
index2 = np.argwhere(Hemoglobin_data[:, 0] == lambda_2)  # 找到lambda_2的位置

E_ox_1 = Hemoglobin_data[index1, 1]  # 找到lambda_1的吸收值
E_ox_2 = Hemoglobin_data[index2, 1]  # 找到lambda_2的吸收值
E_de_1 = Hemoglobin_data[index1, 2]  # 找到lambda_1的吸收值
E_de_2 = Hemoglobin_data[index2, 2]  # 找到lambda_2的吸收值

# 2 x 2 Matrix
Calculate_Matrix = np.array([[E_ox_1, E_de_1], [E_ox_2, E_de_2]])
Input_Vector = np.array([[input1/np.log(10)], [input2/np.log(10)]])

Calculate_Matrix = Calculate_Matrix.reshape(2, 2)

# Calculate the result
Result = np.linalg.solve(Calculate_Matrix, Input_Vector)
SO2 = Result[0] / (Result[0] + Result[1]) * 100
SO2 = SO2[0]
Hb = Result[0] + Result[1]
Hb = Hb[0]

print('SO2 = %.2f %%' % SO2)
print('Hb = %.2f g/L' % Hb)