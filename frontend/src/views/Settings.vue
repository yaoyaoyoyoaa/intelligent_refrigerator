<template>
  <div class="settings-view">
    <h2>设置</h2>
    <div class="settings-container">
      <div class="settings-card">
        <h3>系统设置</h3>
        <div class="setting-item">
          <label>冰箱名称</label>
          <input v-model="settings.fridgeName" type="text" placeholder="输入冰箱名称">
        </div>
        <div class="setting-item">
          <label>识别灵敏度</label>
          <input v-model="settings.sensitivity" type="range" min="0" max="100">
          <span>{{ settings.sensitivity }}%</span>
        </div>
        <div class="setting-item">
          <label>过期提醒天数</label>
          <input v-model.number="settings.expiryReminder" type="number" min="1" max="30">
        </div>
      </div>

      <div class="settings-card">
        <h3>摄像头设置</h3>
        <div class="setting-item">
          <label>摄像头分辨率</label>
          <select v-model="settings.resolution">
            <option value="720p">720p</option>
            <option value="1080p">1080p</option>
            <option value="2k">2K</option>
          </select>
        </div>
        <div class="setting-item">
          <label>帧率</label>
          <select v-model="settings.fps">
            <option value="15">15 FPS</option>
            <option value="30">30 FPS</option>
            <option value="60">60 FPS</option>
          </select>
        </div>
        <div class="setting-item checkbox">
          <input v-model="settings.nightMode" type="checkbox">
          <label>夜间模式</label>
        </div>
      </div>

      <div class="settings-card">
        <h3>数据库设置</h3>
        <div class="setting-item">
          <label>数据库地址</label>
          <input v-model="settings.dbHost" type="text" placeholder="localhost">
        </div>
        <div class="setting-item">
          <label>数据库端口</label>
          <input v-model.number="settings.dbPort" type="number" placeholder="3306">
        </div>
        <div class="setting-item">
          <label>数据库名称</label>
          <input v-model="settings.dbName" type="text" placeholder="intelligent_refrigerator">
        </div>
      </div>

      <div class="button-group">
        <button class="btn-primary" @click="saveSettings">保存设置</button>
        <button class="btn-secondary" @click="resetSettings">重置</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Settings',
  data() {
    return {
      settings: {
        fridgeName: '我的冰箱',
        sensitivity: 80,
        expiryReminder: 3,
        resolution: '1080p',
        fps: '30',
        nightMode: false,
        dbHost: 'localhost',
        dbPort: 3306,
        dbName: 'intelligent_refrigerator'
      }
    }
  },
  methods: {
    saveSettings() {
      alert('设置已保存！')
      console.log('保存设置:', this.settings)
    },
    resetSettings() {
      if (confirm('确定要重置为默认设置吗？')) {
        this.settings = {
          fridgeName: '我的冰箱',
          sensitivity: 80,
          expiryReminder: 3,
          resolution: '1080p',
          fps: '30',
          nightMode: false,
          dbHost: 'localhost',
          dbPort: 3306,
          dbName: 'intelligent_refrigerator'
        }
      }
    }
  }
}
</script>

<style scoped>
.settings-view {
  max-width: 800px;
  margin: 0 auto;
}

.settings-view h2 {
  color: #2c3e50;
}

.settings-container {
  background: white;
  border-radius: 8px;
  padding: 2rem;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.settings-card {
  margin-bottom: 2rem;
  padding-bottom: 2rem;
  border-bottom: 1px solid #eee;
}

.settings-card:last-of-type {
  border-bottom: none;
}

.settings-card h3 {
  margin-top: 0;
  color: #2c3e50;
}

.setting-item {
  margin-bottom: 1.5rem;
  display: flex;
  align-items: center;
  gap: 1rem;
}

.setting-item.checkbox {
  flex-direction: row-reverse;
  gap: 0.5rem;
}

.setting-item label {
  font-weight: 500;
  color: #333;
  min-width: 120px;
}

.setting-item input[type="text"],
.setting-item input[type="number"],
.setting-item select {
  flex: 1;
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
}

.setting-item input[type="range"] {
  flex: 1;
  max-width: 200px;
}

.setting-item input[type="checkbox"] {
  width: 20px;
  height: 20px;
  cursor: pointer;
}

.setting-item span {
  color: #666;
  min-width: 50px;
}

.button-group {
  display: flex;
  gap: 1rem;
  margin-top: 2rem;
}

.btn-primary,
.btn-secondary {
  flex: 1;
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
}

.btn-primary {
  background-color: #42b983;
  color: white;
}

.btn-primary:hover {
  background-color: #369970;
}

.btn-secondary {
  background-color: #e8e8e8;
  color: #333;
}

.btn-secondary:hover {
  background-color: #d0d0d0;
}
</style>
