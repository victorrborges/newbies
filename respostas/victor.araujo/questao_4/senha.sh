#!/bin/bash
clear

safe=true
problems=""

echo "Entre com a senha:"
read senha

if ! [ ${#senha} -ge 8 ] 
then 
	safe=false
	problems="$problems Senha deve ter no mínimo 8 caracteres. "
fi
if ! [[ $senha =~ [A-Za-z0-9]*([A-Za-z]+[0-9]+|[0-9]+[A-Za-z])[A-Za-z0-9]* ]] 
then
	safe=false
	problems="$problems Senha deve conter letras e números. "
fi
if ! [[ $senha =~ [^A-Za-z0-9]*[A-Z]+[^A-Za-z0-9]* ]] 
then
	safe=false
	problems="$problems Senha deve ter pelo menos uma letra maiúscula."
fi

if [ "$safe" = true ] 
then
	echo "Senha segura!"
else
	echo "Senha insegura! $problems"
fi
