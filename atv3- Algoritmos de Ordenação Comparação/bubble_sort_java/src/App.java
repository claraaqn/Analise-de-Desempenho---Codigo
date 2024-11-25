import java.io.*;
import java.time.*;
import java.util.*;

public class App {
    // Função de Bubble Sort
    public static void bubbleSort(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }

    // Método principal
    public static void main(String[] args) {
        String fileName = "C:\\Users\\mclar\\Documents\\Analise de Desempenho - Codigo\\atv3\\arq.txt";
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
        bubbleSort(arr);
        Instant end = Instant.now();

        // Medição de memória depois da execução
        long memoryAfter = runtime.totalMemory() - runtime.freeMemory();

        // Salvando a lista ordenada
        String outputFile = "bubble_sort_java.txt";
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(outputFile))) {
            for (int num : arr) {
                writer.write(num + " ");
            }
        } catch (IOException e) {
            System.err.println("Erro ao salvar o arquivo!");
        }

        System.out.println("Lista ordenada salva em: " + outputFile);
        System.out.println("Tempo de execução: " + Duration.between(start, end).toMillis() + " ms");
        System.out.println("Uso de memória: " + (memoryAfter - memoryBefore) / 1024 + " KB");
    }
}
