const URL_BASE = 'http://localhost:8080'

async function pedir(caminho, opcoes = {}) {
  let resposta
  try {
    resposta = await fetch(URL_BASE + caminho, {
      headers: { 'Content-Type': 'application/json' },
      ...opcoes,
    })
  } catch {
    const erro = new Error('Servidor indisponível')
    erro.status = 0 
    throw erro
  }

  if (!resposta.ok) {
    const erro = new Error('Erro ' + resposta.status)
    erro.status = resposta.status
    throw erro
  }

  if (resposta.status === 204) return null
  return resposta.json()
}

export const api = {
  listar:    (rec)            => pedir(`/${rec}`),
  buscar:    (rec, id)        => pedir(`/${rec}/${id}`),
  criar:     (rec, dados)     => pedir(`/${rec}`,       { method: 'POST',   body: JSON.stringify(dados) }),
  atualizar: (rec, id, dados) => pedir(`/${rec}/${id}`, { method: 'PUT',    body: JSON.stringify(dados) }),
  excluir:   (rec, id)        => pedir(`/${rec}/${id}`, { method: 'DELETE' }),
}

export function mensagemDeErro(erro, padrao) {
  console.error(erro)
  if (erro.status === 0) return 'Não foi possível conectar ao servidor. O backend está rodando?'
  if (erro.status === 404) return 'Registro não encontrado.'
  if (erro.status === 400) return 'Dados inválidos. Confira os campos preenchidos.'
  return padrao
}