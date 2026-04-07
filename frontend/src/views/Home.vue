<template>
  <div class="home-view">
    <div class="welcome-section">
      <h2>欢迎使用智能冰箱食材识别系统</h2>
      <p>这是一个能够识别冰箱内食材并进行智能库存管理的系统。</p>
    </div>

    <div class="quick-stats">
      <div class="stat-card">
        <div class="stat-number">{{ itemCount }}</div>
        <div class="stat-label">当前食材</div>
      </div>
      <div class="stat-card">
        <div class="stat-number">{{ categoryCount }}</div>
        <div class="stat-label">分类数</div>
      </div>
      <div class="stat-card">
        <div class="stat-number">{{ expiringItems }}</div>
        <div class="stat-label">即将过期</div>
      </div>
    </div>

    <div class="features">
      <h3>主要功能</h3>
      <ul>
        <li>📷 实时摄像头识别</li>
        <li>🗂️ 食材智能分类</li>
        <li>📊 库存动态跟踪</li>
        <li>⏰ 过期提醒</li>
        <li>🔍 快速搜索查询</li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {
      itemCount: 24,
      categoryCount: 5,
      expiringItems: 2
    }
  },
  mounted() {
    this.loadDashboard()
  },
  methods: {
    loadDashboard() {
      // 加载仪表板数据
      console.log('加载仪表板数据')
    }
  }
}
</script>

<style scoped>
.home-view {
  max-width: 1200px;
  margin: 0 auto;
}

.welcome-section {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  margin-bottom: 2rem;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.welcome-section h2 {
  color: #2c3e50;
  margin-top: 0;
}

.quick-stats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.stat-card {
  background: white;
  padding: 1.5rem;
  border-radius: 8px;
  text-align: center;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  transition: transform 0.3s;
}

.stat-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}

.stat-number {
  font-size: 2.5rem;
  font-weight: bold;
  color: #42b983;
}

.stat-label {
  color: #666;
  margin-top: 0.5rem;
}

.features {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.features h3 {
  color: #2c3e50;
  margin-top: 0;
}

.features ul {
  list-style: none;
  padding: 0;
}

.features li {
  padding: 0.5rem 0;
  color: #555;
  font-size: 1.1rem;
}
</style>
