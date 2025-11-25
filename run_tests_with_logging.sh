#!/bin/bash

LOG_DIR="molecule_logs"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_FILE="${LOG_DIR}/molecule_test_${TIMESTAMP}.log"

# Создать директорию для логов
mkdir -p "${LOG_DIR}"

echo "Starting Molecule tests at $(date)" | tee -a "${LOG_FILE}"
echo "Log file: ${LOG_FILE}" | tee -a "${LOG_FILE}"
echo "=========================================" | tee -a "${LOG_FILE}"

# Выполнить тесты с полным логированием
molecule test 2>&1 | tee -a "${LOG_FILE}"

EXIT_CODE=${PIPESTATUS[0]}

echo "=========================================" | tee -a "${LOG_FILE}"
echo "Molecule tests finished at $(date)" | tee -a "${LOG_FILE}"
echo "Exit code: ${EXIT_CODE}" | tee -a "${LOG_FILE}"

# Проверить наличие ошибок
if grep -q "FAILED\|ERROR\|CRITICAL" "${LOG_FILE}"; then
    echo "Found errors in log:" | tee -a "${LOG_FILE}"
    grep -n "FAILED\|ERROR\|CRITICAL" "${LOG_FILE}" | tee -a "${LOG_FILE}"
fi

exit ${EXIT_CODE}
