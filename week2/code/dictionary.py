taxa = [ ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'),
        ]

# Write a python script to populate a dictionary called taxa_dic derived from
# taxa so that it maps order names to sets of taxa and prints it to screen.
# 
# An example output is:
#  
# 'Chiroptera' : set(['Myotis lucifugus']) ... etc. OR, 'Chiroptera': {'Myotis
#  lucifugus'} ... etc

#### Your solution here #### 

taxa_dic = dict()

for i in taxa:
        #print(i[1])
        if i[1] in taxa_dic:
                this_key = i[1]
                #print(this_key)
                taxa_dic[this_key].add(i[0])
        else:
                taxa_dic[i[1]] = set([i[0]])
                #taxa_dic[i[1]] = set(taxa_dic[i[1]])

# for key in taxa_dic:
#         taxa_dic[key] = set(taxa_dic[key])
        
print(taxa_dic)

# Now write a list comprehension that does the same (including the printing after the dictionary has been created)  
 
#### Your solution here #### 

#taxa_dic_lc = {taxa_dic_lc[i[1]].add if i[1] in taxa_dic_lc else taxa_dic_lc[i[1]] = [i[0]] for i in taxa}

taxa_dic_lc ={}
#d = {(order,d[order].append(name)) if order in d else (order, set(name)) for name, order in taxa}
#taxa_dic_lc = {order:(taxa_dic_lc[order].append(name) if order in taxa_dic_lc else [name]) for name, order in taxa}

for name, order in taxa:
        if order in taxa_dic_lc:
                taxa_dic_lc[order].add(name)
        else:
                taxa_dic_lc[order] = set([name])

print(taxa_dic_lc)

taxa_dic_lc={}
taxa_dic_lc = {x[1]:set() for x in taxa}
print(taxa_dic_lc)
for species, order in taxa:
        #print(species, order)
        taxa_dic_lc[order].add(species)

print(taxa_dic_lc)

{x[1]:set(y[0] for y in taxa if x[1] == y[1]) for x in taxa}