import java.io.*;
import java.time.*;
import java.util.*;

public class App {
    public static void shellSort(int[] arr) {
        int n = arr.length;

        // Inicializa o intervalo (gap)
        for (int gap = n / 2; gap > 0; gap /= 2) {
            // Ordena os elementos com base no intervalo atual0,010,008
            for (int i = gap; i < n; i++) {
                int temp = arr[i];
                int j;
                for (j = i; j >= gap && arr[j - gap] > temp; j -= gap) {
                    arr[j] = arr[j - gap];
                }
                arr[j] = temp;
            }
        }
    }

    // Método principal
    public static void main(String[] args) {
        String fileName = "arq-desafio.txt";
        List<Integer> list = new ArrayList<>();
        
        // Leitura do arquivo
        try (Scanner sc = new Scanner(new File(fileName))) {
            while (sc.hasNextInt()) {
                list.add(sc.nextInt());
            }
        } catch (FileNotFoundException e) {
            System.err.println("Arquivo não encontrado!");
            return;
        }
        
        // Conversão para array
        int[] arr = list.stream().mapToInt(i -> i).toArray();
        
        // Medição de memória antes da execução
        Runtime runtime = Runtime.getRuntime();
        runtime.gc(); // Sugestão de limpeza de lixo
        long memoryBefore = runtime.totalMemory() - runtime.freeMemory();

        // Medição de tempo
        Instant start = Instant.now();
        shellSort(arr);
        Instant end = Instant.now();

        // Medição de memória depois da execução
        long memoryAfter = runtime.totalMemory() - runtime.freeMemory();

        System.out.println("Tempo de execução: " + Duration.between(start, end).toMillis() + " ms");
        System.out.println("Uso de memória: " + (memoryAfter - memoryBefore) / 1024 + " KB");
    }
}
