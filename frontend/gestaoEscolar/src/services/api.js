const URL_BASE = 'http://localhost:8080'

async function pedir(caminho, opcoes = {}) {
  const resposta = await fetch(URL_BASE + caminho, {
    headers: { 'Content-Type': 'application/json' },
    ...opcoes,
  })

  if (!resposta.ok) {
    const erro = new Error('Erro ' + resposta.status)
    erro.status = resposta.status
    throw erro
  }

  if (resposta.status === 204) return null   // DELETE não devolve corpo
  return resposta.json()
}

export const api = {
  listar:    (rec)           => pedir(`/${rec}`),
  buscar:    (rec, id)       => pedir(`/${rec}/${id}`),
  criar:     (rec, dados)    => pedir(`/${rec}`,     { method: 'POST',   body: JSON.stringify(dados) }),
  atualizar: (rec, id, dados)=> pedir(`/${rec}/${id}`, { method: 'PUT',    body: JSON.stringify(dados) }),
  excluir:   (rec, id)       => pedir(`/${rec}/${id}`, { method: 'DELETE' }),
}