<template>
  <div class="inventory-view">
    <div class="inventory-header">
      <h2>库存管理</h2>
      <button class="btn-primary" @click="showAddModal">+ 添加食材</button>
    </div>

    <div class="inventory-filter">
      <input 
        v-model="searchText" 
        type="text" 
        placeholder="搜索食材..."
        class="search-input"
      >
      <select v-model="selectedCategory" class="category-select">
        <option value="">所有分类</option>
        <option value="蔬果">蔬果类</option>
        <option value="肉蛋">肉蛋生鲜类</option>
        <option value="饮料">饮料乳品类</option>
        <option value="包装">包装食品类</option>
      </select>
    </div>

    <div v-if="items.length > 0" class="inventory-table-wrapper">
      <table class="inventory-table">
        <thead>
          <tr>
            <th>食材名称</th>
            <th>分类</th>
            <th>数量</th>
            <th>存放位置</th>
            <th>添加日期</th>
            <th>过期日期</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in filteredItems" :key="item.id" class="item-row">
            <td>{{ item.name }}</td>
            <td><span class="category-badge">{{ item.category }}</span></td>
            <td>{{ item.quantity }}</td>
            <td>{{ item.location }}</td>
            <td>{{ formatDate(item.addedDate) }}</td>
            <td :class="getExpiryClass(item.expiryDate)">{{ formatDate(item.expiryDate) }}</td>
            <td>
              <button class="btn-small" @click="editItem(item)">编辑</button>
              <button class="btn-small btn-danger" @click="deleteItem(item.id)">删除</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div v-else class="empty-state">
      <p>暂无食材记录，请添加食材</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Inventory',
  data() {
    return {
      items: [
        {
          id: 1,
          name: '西红柿',
          category: '蔬果',
          quantity: '3个',
          location: '冷藏室',
          addedDate: '2024-01-15',
          expiryDate: '2024-01-25'
        },
        {
          id: 2,
          name: '牛奶',
          category: '饮料',
          quantity: '2盒',
          location: '冷藏室门架',
          addedDate: '2024-01-10',
          expiryDate: '2024-02-10'
        }
      ],
      searchText: '',
      selectedCategory: ''
    }
  },
  computed: {
    filteredItems() {
      return this.items.filter(item => {
        const matchSearch = item.name.toLowerCase().includes(this.searchText.toLowerCase())
        const matchCategory = !this.selectedCategory || item.category === this.selectedCategory
        return matchSearch && matchCategory
      })
    }
  },
  methods: {
    showAddModal() {
      alert('添加食材功能即将实现')
    },
    editItem(item) {
      alert(`编辑食材: ${item.name}`)
    },
    deleteItem(itemId) {
      if (confirm('确定要删除该食材吗？')) {
        this.items = this.items.filter(item => item.id !== itemId)
      }
    },
    formatDate(date) {
      return date || '-'
    },
    getExpiryClass(expiryDate) {
      // 简单的过期检查
      const today = new Date()
      const expiry = new Date(expiryDate)
      const daysLeft = Math.floor((expiry - today) / (1000 * 60 * 60 * 24))
      
      if (daysLeft < 0) return 'expired'
      if (daysLeft < 3) return 'expiring-soon'
      return ''
    }
  }
}
</script>

<style scoped>
.inventory-view {
  max-width: 1200px;
  margin: 0 auto;
}

.inventory-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1.5rem;
}

.inventory-header h2 {
  margin: 0;
  color: #2c3e50;
}

.btn-primary {
  background-color: #42b983;
  color: white;
  border: none;
  padding: 0.75rem 1.5rem;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
}

.btn-primary:hover {
  background-color: #369970;
}

.inventory-filter {
  display: flex;
  gap: 1rem;
  margin-bottom: 1.5rem;
}

.search-input,
.category-select {
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
}

.search-input {
  flex: 1;
}

.inventory-table-wrapper {
  background: white;
  border-radius: 8px;
  overflow-x: auto;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.inventory-table {
  width: 100%;
  border-collapse: collapse;
}

.inventory-table thead {
  background-color: #f8f9fa;
}

.inventory-table th {
  padding: 1rem;
  text-align: left;
  font-weight: 600;
  color: #2c3e50;
  border-bottom: 2px solid #ddd;
}

.inventory-table td {
  padding: 1rem;
  border-bottom: 1px solid #eee;
}

.item-row:hover {
  background-color: #f8f9fa;
}

.category-badge {
  display: inline-block;
  background-color: #e8f5e9;
  color: #2e7d32;
  padding: 0.25rem 0.75rem;
  border-radius: 20px;
  font-size: 0.9rem;
}

.btn-small {
  background-color: #2196F3;
  color: white;
  border: none;
  padding: 0.4rem 0.8rem;
  border-radius: 4px;
  cursor: pointer;
  font-size: 0.9rem;
  margin-right: 0.5rem;
}

.btn-small:hover {
  background-color: #1976D2;
}

.btn-danger {
  background-color: #f44336;
}

.btn-danger:hover {
  background-color: #da190b;
}

.expiring-soon {
  color: #ff9800;
  font-weight: bold;
}

.expired {
  color: #f44336;
  font-weight: bold;
}

.empty-state {
  background: white;
  padding: 3rem;
  border-radius: 8px;
  text-align: center;
  color: #999;
}
</style>
