FROM ansible/ubuntu14.04-ansible:stable

# Dockerイメージにansibleディレクトリを追加
ADD ansible /srv/example/
WORKDIR /srv/example

# Playbookをローカルマシンで実行
RUN ansible-playbook site.yml -c local

# 動作確認のための設定
EXPOSE 22 3000 80
