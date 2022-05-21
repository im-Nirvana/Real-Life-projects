import pandas as pd 

#using | as delimeter and saving it to a new txt file

#line = []
#with open("old_files.txt", "r") as fo:
#    for x in fo.readlines():
#        #print(x)
#        val = x.split('|')
#        #print(val)
#        line.append(val)
#        
#with open("Out.txt", "w") as fw:
#    for i in line:
#        #print(i)
#        fw.write(' '.join(i) + '\n')
#    fo.close()
#    fw.close()
	

#using | as delimeter and saving it to a new txt file

df = pd.read_csv("/department/gld/casino/pdl/old_files.txt", delimiter = "|", names=["Files", "a", "b", "c", "d", "e", "f"])
#df.head()

#Dropping the columns that are not required

df.drop(['a','b','c','d','e','f'], axis=1, inplace=True)
#df.head()

#Saving the o/p after dropping the un-important columns to a new txt file.

df.to_csv("/department/gld/casino/pdl/ReqOut1.txt", header=None, index=None, sep=' ', mode='a')

# Use below unix command to remove unwanted " "
#cat cleaning.txt | sed -e 's/^"//' -e 's/"$//' >> cleaning1.txt