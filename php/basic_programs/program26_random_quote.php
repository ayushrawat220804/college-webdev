<?php
$quotes = [
    "Code is like humor. When you have to explain it, itâ€™s bad.",
    "Fix the cause, not the symptom.",
    "Optimism is an occupational hazard of programming."
];
$randomQuote = $quotes[array_rand($quotes)];
echo $randomQuote;
