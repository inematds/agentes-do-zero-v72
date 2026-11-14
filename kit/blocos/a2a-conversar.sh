cd ~/agente-do-zero
cp ~/agentes-do-zero-v72/kit/aula2/agente.py .
python3 agente.py "Explique em uma frase o que é um agente de IA."
ollama list | grep -q "^llama3.1:8b" || ollama pull llama3.1:8b 2>/dev/null   # 5 GB, uma vez só
MODELO=llama3.1:8b python3 agente.py "Explique em uma frase o que é um agente de IA."
