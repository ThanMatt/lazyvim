def get_data(url):
    print("Fetching data...")
    return fetch(url)

def process_string(text):
    result = text.strip().lower()
    print(result)
    return result

def calculate_total(items):
    total = sum(items)
    print(f"Total: {total}")
    return total

def get_data_from_api():
    data = get_data("https://api.example.com")
    return data
