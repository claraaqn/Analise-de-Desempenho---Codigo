import java.io.*;
import java.time.*;
import java.util.*;

public class App {
    public static void main(String[] args) {
        String fileName = "C:\\Users\\mclar\\Documents\\Analise de Desempenho - Codigo\\atv3- Algoritmos de Ordenação Comparação\\arq.txt";
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
        
        Runtime runtime = Runtime.getRuntime();
        runtime.gc(); 
        long memoryBefore = runtime.totalMemory() - runtime.freeMemory();

        Instant start = Instant.now();
        Arrays.sort(arr);
        Instant end = Instant.now();

        long memoryAfter = runtime.totalMemory() - runtime.freeMemory();

        String outputFile = "quick_sort_java.txt";
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
