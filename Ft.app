<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>تطبيق سؤال وجواب</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .btn-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .btn {
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>اختبر معلوماتك!</h1>
        <div id="question-container">
            <div id="question">السؤال سيظهر هنا</div>
            <div id="answer-buttons" class="btn-container">
                <button class="btn">اختيار 1</button>
                <button class="btn">اختيار 2</button>
                <button class="btn">اختيار 3</button>
                <button class="btn">اختيار 4</button>
            </div>
        </div>
        <button id="next-button" class="btn" style="display: none;">السؤال التالي</button>
    </div>
    <script>
        const questions = [
            {
                question: "ما هي عاصمة فرنسا؟",
                answers: [
                    { text: "باريس", correct: true },
                    { text: "برلين", correct: false },
                    { text: "مدريد", correct: false },
                    { text: "روما", correct: false }
                ]
            },
            {
                question: "ما هو أكبر كوكب في النظام الشمسي؟",
                answers: [
                    { text: "الأرض", correct: false },
                    { text: "المشتري", correct: true },
                    { text: "المريخ", correct: false },
                    { text: "زحل", correct: false }
                ]
            },
            {
                question: "ما هي اللغة الأكثر تحدثًا في العالم؟",
                answers: [
                    { text: "الإنجليزية", correct: false },
                    { text: "الصينية", correct: true },
                    { text: "الإسبانية", correct: false },
                    { text: "العربية", correct: false }
                ]
            }
        ];

        let currentQuestionIndex = 0;

        const questionContainer = document.getElementById('question-container');
        const questionElement = document.getElementById('question');
        const answerButtons = document.getElementById('answer-buttons');
        const nextButton = document.getElementById('next-button');

        function startGame() {
            currentQuestionIndex = 0;
            nextButton.style.display = 'none';
            showQuestion(questions[currentQuestionIndex]);
        }

        function showQuestion(question) {
            questionElement.innerText = question.question;
            answerButtons.innerHTML = '';
            question.answers.forEach(answer => {
                const button = document.createElement('button');
                button.innerText = answer.text;
                button.classList.add('btn');
                button.addEventListener('click', () => selectAnswer(answer));
                answerButtons.appendChild(button);
            });
        }

        function selectAnswer(answer) {
            const correct = answer.correct;
            if (correct) {
                alert('إجابة صحيحة!');
            } else {
                alert('إجابة خاطئة!');
            }

            nextButton.style.display = 'block';
        }

        nextButton.addEventListener('click', () => {
            currentQuestionIndex++;
            if (currentQuestionIndex < questions.length) {
                showQuestion(questions[currentQuestionIndex]);
            } else {
                alert('انتهى الاختبار!');
                nextButton.style.display = 'none';
                currentQuestionIndex = 0; // إعادة تعيين للفحص الجديد
                startGame();
            }
        });

        startGame();
    </script>
</body>
</html>
