import shutil
import os


ignoreFileList = ['.DS_Store', '.sass-cache', '.gitignore', '.git']


folder_path_variable = "conferences"

files = os.listdir(folder_path_variable)

for v in files:
	if v not in ignoreFileList:
		filepath = os.path.join(folder_path_variable, v)
		if os.path.isdir(filepath):
			shutil.rmtree(filepath)
		else:
			os.remove(filepath)