import dayjs from 'dayjs'

export const formatarData = (valor) => (valor ? dayjs(valor).format('DD/MM/YYYY') : '-')

export const formatarMoeda = (valor) =>
  Number(valor).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })

export const idDe = (ref) => (ref && typeof ref === 'object' ? ref.id : ref)