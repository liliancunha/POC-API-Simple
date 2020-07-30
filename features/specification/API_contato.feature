#language: pt
@APIContato
Funcionalidade: REST - Criação e Consulta do Contato
Nessa funcionalidade será realizado a adição de um contato
e depois a consulta desse contato de forma válida

@APIContato1 @severity=trivial @TESTECASE:CT01 @TESTPLAN:APIContato
Cenário: Salvar um contato válido
Dado que tenha o arquivo de payload 'contatoObrigatorioPayload.json' para contato
Quando é enviada uma requisição de contato usando esse arquivo
Então recebe-se o status "200"
E é recebido um identificador

@APIContato2 @severity=normal @TESTECASE:CT02 @TESTPLAN:APIContato
Cenário: Consultar contato registrado
Dado que tenha um identificador de um contato cadastrado
Quando é consultado esse 'identificador'
Então recebe-se os dados desse contato
| cpf           | nomeCompleto                 | email                                        | ddd | telefone  |
| "52272160450" | "Osvaldo Kaique Mário Porto" | "osvaldokaiquemarioporto-80@tirantea.com.br" | 21  | 981234567 |
E recebe-se o status "200"


@APIContato3 @severity=trivial @TESTECASE:CT01 @TESTPLAN:APIContato
Esquema do Cenário: Salvar um contato inválido
Dado que tenha o arquivo com a situação '<status>' para contato
Quando é enviada uma requisição usando o arquivo '<arquivo>'
Então recebe-se o status "404"
 Exemplos:
    | status                  | arquivo                                    |
    | camposEmBranco          | contatoTudoEmBrancoPayload.json            |
    | camposComEspacoEmBranco | contatoCamposComEspacoEmBrancoPayload.json |
    | nomeIncompleto          | contatoNomeIncompletoPayload.json          |
    | nomeMaiorEsperado       | contatoNomeMaiorPayload.json               |
    | nomeCaracterEspecial    | contatoNomeCaracterEspecialPayload.json    |
    | nomeNumeros             | contatoNomeNumerosPayload.json             |
    | emailIncompleto         | contatoEmailIncompletoPayload.json         |
    | emailMaiorEsperado      | contatoEmailMaiorPayload.json              |
    | emailCaracterEspecial   | contatoEmailCaracterEspecialPayload.json   |
    | emailNumeros            | contatoEmailNumerosPayload.json            |
    | celularIncompleto       | contatoCelularIncompletoPayload.json       |
    | celularMaiorEsperado    | contatoCelularMaiorPayload.json            |
    | celularCaracterEspecial | contatoCelularCaracterEspecialPayload.json |
    | celularLetras           | contatoCelularLetrasPayload.json           |
    | cpfIncompleto           | contatoCpfIncompletoPayload.json           |
    | cpfMaiorEsperado        | contatoCpfMaiorPayload.json                |
    | cpfCaracterEspecial     | contatoCpfCaracterEspecialPayload.json     |
    | cpfLetras               | contatoCpfLetrasPayload.json               |
