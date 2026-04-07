<template>
  <div id="app" class="app-container">
    <header class="app-header">
      <h1>🧊 智能冰箱食材识别系统</h1>
      <nav class="nav-menu">
        <router-link to="/" class="nav-link">首页</router-link>
        <router-link to="/inventory" class="nav-link">库存管理</router-link>
        <router-link to="/recognition" class="nav-link">识别系统</router-link>
        <router-link to="/settings" class="nav-link">设置</router-link>
      </nav>
    </header>
    
    <main class="app-main">
      <router-view></router-view>
    </main>

    <footer class="app-footer">
      <p>&copy; 2024 智能冰箱食材识别系统</p>
    </footer>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style scoped>
.app-container {
  display: flex;
  flex-direction: column;
  height: 100vh;
  background-color: #f5f5f5;
}

.app-header {
  background-color: #2c3e50;
  color: white;
  padding: 1rem 2rem;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.app-header h1 {
  margin: 0;
  font-size: 1.8rem;
}

.nav-menu {
  display: flex;
  gap: 2rem;
}

.nav-link {
  color: white;
  text-decoration: none;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  transition: background-color 0.3s;
}

.nav-link:hover {
  background-color: rgba(255,255,255,0.1);
}

.nav-link.router-link-active {
  background-color: #42b983;
}

.app-main {
  flex: 1;
  overflow-y: auto;
  padding: 2rem;
}

.app-footer {
  background-color: #2c3e50;
  color: white;
  text-align: center;
  padding: 1rem;
  margin-top: auto;
}

.app-footer p {
  margin: 0;
}
</style>
