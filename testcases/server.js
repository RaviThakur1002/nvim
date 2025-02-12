import express from "express";
import fs from "fs/promises";

const app = express();
const port = 10043;

const CONFIG = {
  INPUT_FILE_PATH: "/home/devil/cp/projectone/input1.txt",
  TEST_CASES_FILE: "/home/devil/cp/projectone/test_cases.json",
};

// Raw body parsing middleware for text/plain
app.use(express.text({ type: 'text/plain' }));
app.use(express.json({ type: 'application/json' }));


app.post("/", async (req, res) => {
  try {
    // Parse the body based on content type
    let data = req.body;
    
    // If the body is a string (text/plain), try to parse it as JSON
    if (typeof data === 'string') {
      try {
        data = JSON.parse(data);
        console.log('Successfully parsed text/plain data');
      } catch (e) {
        console.error('Failed to parse text/plain data:', e);
        throw new Error('Invalid JSON in request body');
      }
    }

    console.log('Parsed data:', data);

    if (!data || !data.tests || !Array.isArray(data.tests) || data.tests.length === 0) {
      throw new Error('Invalid or missing test cases in request');
    }

    // Save first test case to input file
    const formattedContent = `${data.tests[0].input}\nExpected Output:\n${data.tests[0].output}`;
    await fs.writeFile(CONFIG.INPUT_FILE_PATH, formattedContent);

    // Save all test cases and problem info
    const testCasesData = {
      problemName: data.name,
      problemGroup: data.group,
      url: data.url,
      timestamp: new Date().toISOString(),
      tests: data.tests.map((test, index) => ({
        id: index + 1,
        input: test.input,
        output: test.output,
      })),
    };

    await fs.writeFile(
      CONFIG.TEST_CASES_FILE,
      JSON.stringify(testCasesData, null, 2)
    );

    console.log(`✓ Successfully saved test cases for problem: ${data.name}`);
    res.status(200).json({ success: true });

  } catch (error) {
    console.error('Error:', error.message);
    res.status(500).json({
      error: error.message,
    });
  }
});

app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});
