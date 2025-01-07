import express from "express";
import fs from "fs/promises";
import path from "path";

const app = express();
const port = 10043;

// Your specific input file path
const INPUT_FILE_PATH = "/home/devil/cp/projectone/input1.txt";
// Path to store all test cases for Telescope
const TEST_CASES_FILE = "/home/devil/cp/projectone/test_cases.json";

app.use(express.json());

app.post("/", async (req, res) => {
  //const startTime = Date.now();
  try {
    const data = req.body;

    // Save first test case to input file
    if (data.tests && data.tests.length > 0) {
      const formattedContent = `${data.tests[0].input}\nExpected Output:\n${data.tests[0].output}`;
      await fs.writeFile(INPUT_FILE_PATH, formattedContent);
    }
    // Save all test cases and problem info for Telescope
    const testCasesData = {
      problemName: data.name,
      problemGroup: data.group,
      url: data.url,
      tests: data.tests.map((test, index) => ({
        id: index + 1,
        input: test.input,
        output: test.output,
      })),
    };

    await fs.writeFile(TEST_CASES_FILE, JSON.stringify(testCasesData, null, 2));

    //const endTime = Date.now();
    //const executionTime = (endTime - startTime) ;
    //console.log(`Execution time: ${executionTime} ms`);

    console.log(`Saved test cases for problem: ${data.name}`);
    res.sendStatus(200);
  } catch (error) {
    console.error("Error processing request:", error);
    res.sendStatus(500);
  }
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
