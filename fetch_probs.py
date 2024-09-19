import sys
import re
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def fetch_problems(contest_id):
    url = f"https://codeforces.com/contest/{contest_id}"
    driver = webdriver.Firefox()
    driver.get(url)
    wait = WebDriverWait(driver, 10)
    wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, 'table.problems')))

    problem_rows = driver.find_elements(By.CSS_SELECTOR, 'table.problems tbody tr')
    problems = []
    
    for row in problem_rows[1:]:
        problem_id_element = row.find_element(By.CSS_SELECTOR, 'td a')
        problem_id = problem_id_element.text.strip()
        problem_name_element = row.find_elements(By.CSS_SELECTOR, 'td')[1].find_element(By.CSS_SELECTOR, 'a')
        problem_name = problem_name_element.text.strip()
        problems.append(f"{problem_id}|{problem_name}")

    driver.quit()
    return problems 

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 fetch_probs.py <contest_id>")
        sys.exit(1)

    contest_id = sys.argv[1]
    problems = fetch_problems(contest_id)

    for problem in problems:
        print(problem)

