import time
import tracemalloc  # Para medir memória

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
        

# Leitura do arquivo, ordenação e salvamento
def main():
    # Nome do arquivo
    file_name = "C:\\Users\\mclar\\Documents\\Analise de Desempenho - Codigo\\atv3\\arq.txt"

    # Leitura da lista do arquivo
    with open(file_name, "r") as file:
        arr = list(map(int, file.read().split()))

    # Medição de tempo e memória
    tracemalloc.start()
    start_time = time.time()
    shell_sort(arr)
    end_time = time.time()
    current, peak = tracemalloc.get_traced_memory()
    tracemalloc.stop()

    # Salvando a lista ordenada
    output_file = "shell_sort_python.txt"
    with open(output_file, "w") as file:
        file.write(" ".join(map(str, arr)))

    print(f"Lista ordenada salva em: {output_file}")
    print(f"Tempo de execução: {end_time - start_time:.6f} segundos")
    print(f"Uso de memória: {current / 1024:.2f} KB")
    print(f"Pico de memória: {peak / 1024:.2f} KB")

if __name__ == "__main__":
    main()
