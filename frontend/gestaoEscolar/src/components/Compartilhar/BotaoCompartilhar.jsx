import { App as AntApp, Button } from 'antd'

function BotaoCompartilhar({ caminho, texto = 'Compartilhar' }) {
  const { message } = AntApp.useApp()

  async function copiar() {
    const url = window.location.origin + caminho
    try {
      await navigator.clipboard.writeText(url)
      message.success('Link copiado!')
    } catch {
      window.prompt('Copie o link abaixo:', url)
    }
  }

  return <Button onClick={copiar}>{texto}</Button>
}

export default BotaoCompartilhar