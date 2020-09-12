a = int(input());
n = int(input());
arr = map(list.add,int(input()));
search(a,n,arr); 
 
def search (a,n,arr):
    for i in range(0,n):
        if arr[i] == a:
            print('element fount at this position',i);
        else:
            print('element not found');
