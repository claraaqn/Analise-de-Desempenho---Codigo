import time
import tracemalloc
import numpy as np

def main():
    # Nome do arquivo
    file_name = r"arq-desafio.txt"

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

    print(f"Tempo de execução: {end_time - start_time:.6f} segundos")
    print(f"Uso de memória: {current / 1024:.2f} KB")
    print(f"Pico de memória: {peak / 1024:.2f} KB")

if __name__ == "__main__":
    main()
