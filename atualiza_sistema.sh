#!/bin/zsh

LOGFILE="/var/log/atualiza_sistema.log"

echo "========== Início da atualização: $(date) ==========" >> "$LOGFILE"

# ------------------ apt update ------------------
echo "--- Etapa: apt update ---" >> "$LOGFILE"
if sudo apt update -y >> "$LOGFILE" 2>&1; then
    echo "[OK] apt update executado com sucesso" >> "$LOGFILE"
else
    echo "[ERRO] apt update falhou" >> "$LOGFILE"
fi
echo "" >> "$LOGFILE"

# ------------------ apt upgrade ------------------
echo "--- Etapa: apt upgrade ---" >> "$LOGFILE"
UPGRADE_OUTPUT=$(sudo apt list --upgradable 2>/dev/null | grep -v "Listing...")

if [ -n "$UPGRADE_OUTPUT" ]; then
    UPDATED_PACKAGES=$(echo "$UPGRADE_OUTPUT" | wc -l)

    echo "[INFO] Pacotes que serão atualizados:" >> "$LOGFILE"
    echo "$UPGRADE_OUTPUT" >> "$LOGFILE"
    echo "" >> "$LOGFILE"

    APT_UPGRADE_OUTPUT=$(sudo apt upgrade -y 2>&1)
    echo "[INFO] Saída do apt upgrade:" >> "$LOGFILE"
    echo "$APT_UPGRADE_OUTPUT" >> "$LOGFILE"

    echo "[OK] $UPDATED_PACKAGES pacotes atualizados" >> "$LOGFILE"
else
    echo "[OK] Nenhuma atualização disponível" >> "$LOGFILE"
fi
echo "" >> "$LOGFILE"

# ------------------ apt autoremove ------------------
echo "--- Etapa: apt autoremove ---" >> "$LOGFILE"
APT_AUTOREMOVE_OUTPUT=$(sudo apt autoremove -y 2>&1)
echo "[INFO] Saída do apt autoremove:" >> "$LOGFILE"
echo "$APT_AUTOREMOVE_OUTPUT" >> "$LOGFILE"

# Captura pacotes removidos
REMOVED_PACKAGES=$(echo "$APT_AUTOREMOVE_OUTPUT" | grep -i "removido")

if [ -n "$REMOVED_PACKAGES" ]; then
    echo "[INFO] Pacotes removidos:" >> "$LOGFILE"
    echo "$REMOVED_PACKAGES" >> "$LOGFILE"
else
    echo "[INFO] Nenhum pacote removido." >> "$LOGFILE"
fi

echo "[OK] apt autoremove executado com sucesso" >> "$LOGFILE"
echo "" >> "$LOGFILE"

# ------------------ Verificar necessidade de reinicialização ------------------
if [ -f /var/run/reboot-required ]; then
    echo "[INFO] A máquina precisa ser reinicializada" >> "$LOGFILE"
else
    echo "[INFO] Não é necessário reiniciar a máquina" >> "$LOGFILE"
fi

echo "========== Fim da atualização: $(date) ==========" >> "$LOGFILE"
echo "" >> "$LOGFILE"





#    echo "Atualização executada com sucesso em $(date)" >> /var/log/atualiza_sistema.log
#else
#    echo "Erro na atualização em $(date)" >> /var/log/atualiza_sistema.log
#fi



#sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
 
#echo "Atualização executada com sucesso em $(date)" >> /var/log/atualiza_sistema.log
