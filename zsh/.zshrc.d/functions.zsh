beep() {
    timeout ${2} speaker-test --frequency ${1} --test sine;
    return 0;
}
