import axios from 'axios'

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || 'http://localhost:8000/api'

const apiClient = axios.create({
  baseURL: API_BASE_URL,
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json'
  }
})

// 请求拦截器
apiClient.interceptors.request.use(
  config => {
    return config
  },
  error => {
    return Promise.reject(error)
  }
)

// 响应拦截器
apiClient.interceptors.response.use(
  response => {
    return response
  },
  error => {
    console.error('API错误:', error)
    return Promise.reject(error)
  }
)

export const api = {
  // 健康检查
  checkHealth() {
    return apiClient.get('/health')
  },

  // 获取库存列表
  getInventory() {
    return apiClient.get('/inventory')
  },

  // 添加食材
  addItem(data) {
    return apiClient.post('/inventory/add', data)
  },

  // 删除食材
  removeItem(itemId) {
    return apiClient.delete(`/inventory/${itemId}`)
  },

  // 更新食材信息
  updateItem(itemId, data) {
    return apiClient.put(`/inventory/${itemId}`, data)
  }
}

export default apiClient
