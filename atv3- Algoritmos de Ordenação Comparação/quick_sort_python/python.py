import time
import tracemalloc
import numpy as np

def main():
    # Nome do arquivo
    file_name = r"C:\\Users\\mclar\\Documents\\Analise de Desempenho - Codigo\\atv3- Algoritmos de Ordenação Comparação\\arq.txt"

    try:
        # Leitura da lista do arquivo
        with open(file_name, "r") as file:
            arr = list(map(int, file.read().split()))
    except ValueError:
        print("Erro ao ler os dados do arquivo. Certifique-se de que o arquivo contém apenas números inteiros.")
        return

    tracemalloc.start()
    start_time = time.time()
    sorted_arr = np.sort(arr, kind='quicksort').tolist()
    end_time = time.time()
    current, peak = tracemalloc.get_traced_memory()
    tracemalloc.stop()

    output_file = "quick_sort_python.txt"
    with open(output_file, "w") as file:
        file.write(" ".join(map(str, sorted_arr)))

    print(f"Lista ordenada salva em: {output_file}")
    print(f"Tempo de execução: {end_time - start_time:.6f} segundos")
    print(f"Uso de memória: {current / 1024:.2f} KB")
    print(f"Pico de memória: {peak / 1024:.2f} KB")

if __name__ == "__main__":
    main()
