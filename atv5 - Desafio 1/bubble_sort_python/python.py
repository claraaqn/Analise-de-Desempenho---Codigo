import time
import tracemalloc  # Para medir memória

# Função de Bubble Sort
def bubble_sort(alist):
    for passnum in range(len(alist)-1,0,-1):
        for i in range(passnum):
            if alist[i]>alist[i+1]:
                temp = alist[i]
                alist[i] = alist[i+1]
                alist[i+1] = temp

# Leitura do arquivo, ordenação e salvamento
def main():
    # Nome do arquivo
    file_name = "arq-desafio.txt"

    # Leitura da lista do arquivo
    with open(file_name, "r") as file:
        arr = list(map(int, file.read().split()))

    # Medição de tempo e memória
    tracemalloc.start()
    start_time = time.time()
    bubble_sort(arr)
    end_time = time.time()
    current, peak = tracemalloc.get_traced_memory()
    tracemalloc.stop()

    print(f"Tempo de execução: {end_time - start_time:.6f} segundos")
    print(f"Uso de memória: {current / 1024:.2f} KB")
    print(f"Pico de memória: {peak / 1024:.2f} KB")

if __name__ == "__main__":
    main()
