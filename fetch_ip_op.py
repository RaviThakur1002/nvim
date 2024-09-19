import sys
import re
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.remote.webdriver import create_matches
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def fetch_codeforces_problem(contest_id, problem_id):
    url = f"https://codeforces.com/contest/{contest_id}/problem/{problem_id}"
    driver = webdriver.Firefox()

    try:
        driver.get(url)
        input_section = driver.find_element(By.CLASS_NAME, 'input')
        output_section = driver.find_element(By.CLASS_NAME, 'output')

        input_text = input_section.text.strip()
        output_text = output_section.text.strip()

        input_text = re.sub(r'^\s*input\s+Copy\s+', '', input_text, count=1)
        output_text = re.sub(r'^\s*output\s+Copy\s+', '', output_text, count=1, flags=re.DOTALL)

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        input_text, output_text = None, None
    finally:
        driver.quit()

    return input_text, output_text

def create_input_output_file(input_text, output_text, filename):
    """Writes the input text to the file, clears previous content, and appends the output."""
    try:
        with open(filename, 'w') as f:
            f.write(input_text + '\n\n')          

        with open(filename, 'a') as f:
            f.write("Expected Output:\n")

        with open(filename, 'a') as f:
            f.write(output_text)
        
    except Exception as e:
        print(f"Error creating file: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python3 fetch_ip_op.py <contest_id> <problem_id>")
        sys.exit(1)

    contest_id, problem_id = sys.argv[1], sys.argv[2]
    input_text, output_text = fetch_codeforces_problem(contest_id, problem_id)

    if input_text and output_text:
        filename = "input1.txt"
        create_input_output_file(input_text, output_text, filename)
    else:
        print("Failed to fetch problem data.", file=sys.stderr)

