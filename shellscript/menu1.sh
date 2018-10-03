#!/bin/bash

#5. Crie um script que gere o seguinte menu e faça as operações mencionadas:
#Escolha a opção desejada:

function menu() {
    echo "1 - Fazer uma contagem regressiva começando do número informado como parâmetro"
    echo "2 - Verificar se o parâmetro informado é um arquivo presente no diretório /etc/"
    echo "3 - Analisar o /etc/passwd e exibir apenas o nome do usuário (campo 1) e seu ID (campo 3), considerando linhas que possuam /bin/bash"
    echo "4 - Sair"

    opt=0
    until [ $opt -gt 0 2> /dev/null ] ; do
        echo -n "Opção: "
        read opt
    done

    case $opt in
        1) contagem_regressiva ;;
        2) arquivo_existe ;;
        3) usuario_id ;;
        4) exit 0 ;;
        *) echo "Opção inválida!" ;;
    esac
}

function contagem_regressiva() {
    n=-1
    until [ $n -gt 0 2> /dev/null ] ; do
        echo -n "Defina um número > 0: "
        read n
    done

    while [ $n -ge 0 ] ; do
            echo "$n "
            n=$(( $n-1 ))
    done
}

function arquivo_existe() {
    echo -n "Arquivo: "
    read f

    if [ -f /etc/$f ] ; then
        echo Existe!
    else
        echo Não existe!
    fi
}

function usuario_id() {
    grep "bash$" /etc/passwd | cut -d: -f1,3
}

opt=0
while [ $opt -ne 3 ] ; do
    menu
done
