import time
import tracemalloc 

def shell_sort(arr):
    n = len(arr)
    gap = n // 2
    
    while gap > 0:
        for i in range(gap, n):
            temp = arr[i]
            j = i
            while j >= gap and arr[j - gap] > temp:
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
        gap //= 2  
        

def main():
    # Nome do arquivo
    file_name = "atv5 - Desafio 1/arq-desafio.txt"

    with open(file_name, "r") as file:
        arr = list(map(int, file.read().split()))

    tracemalloc.start()
    start_time = time.time()
    shell_sort(arr)
    end_time = time.time()
    current, peak = tracemalloc.get_traced_memory()
    tracemalloc.stop()

    print(f"Tempo de execução: {end_time - start_time:.6f} segundos")
    print(f"Uso de memória: {current / 1024:.2f} KB")
    print(f"Pico de memória: {peak / 1024:.2f} KB")

if __name__ == "__main__":
    main()
