import random

def generate_random_numbers(file_name, count, lower_bound, upper_bound):
    with open(file_name, "w") as file:
        for _ in range(count):
            file.write(f"{random.randint(lower_bound, upper_bound)}\n")
            
            
# gera números entre 1 e 10.000            
file_name1 = "10000.txt"
generate_random_numbers(file_name1, 10000, 1, 10000)

# gera números entre 1 e 50.000  
file_name2 = "50000.txt"
generate_random_numbers(file_name2, 50000, 1, 50000)

# gera números entre 1 e 100.000  
file_name3 = "100000.txt"
generate_random_numbers(file_name3, 100000, 1, 100000)                        