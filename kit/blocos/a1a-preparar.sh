python3 --version                    # precisa ser 3.10 ou mais novo
cd ~ && git clone -q https://github.com/inematds/agentes-do-zero-v72     # o kit: todos os arquivos do curso
mkdir -p ~/agente-do-zero/trabalho   # a pasta do seu agente
ollama list | grep -q "^llama3.2" || ollama pull llama3.2     # baixa só se ainda não tiver (2 GB)
ollama run llama3.2 "Diga oi em cinco palavras." 2>/dev/null
