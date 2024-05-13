# Arquivos de configuração do PostgreSQL
PG_CONF="/etc/postgresql/16/main/postgresql.conf"
PG_HBA="/etc/postgresql/16/main/pg_hba.conf"

# Habilitar acesso remoto no PostgreSQL
echo "Habilitando acesso remoto no PostgreSQL..."
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" $PG_CONF

# Adicionar permissão de acesso remoto no pg_hba.conf
echo "Adicionando permissão de acesso remoto no pg_hba.conf..."
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a $PG_HBA > /dev/null

# Definir o fuso horário para America/Sao_Paulo
echo "Definindo o fuso horário para America/Sao_Paulo..."
sudo sed -i "s/#timezone = 'localtime'/timezone = 'America\/Sao_Paulo'/" $PG_CONF

# Reiniciar o serviço do PostgreSQL
echo "Reiniciando o serviço do PostgreSQL..."
sudo service postgresql restart

echo "Operações concluídas com sucesso!"