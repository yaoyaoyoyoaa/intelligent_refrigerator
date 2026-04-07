# 智能冰箱食材识别与管理系统

## 项目概述
这是一个面向家庭冰箱场景的智能食材识别与管理系统，通过摄像头感知冰箱内物品变化，自动识别并管理食材库存。

## 技术栈

### 后端
- **框架**: FastAPI 0.104.1
- **数据库**: MySQL
- **ORM**: SQLAlchemy 2.0.23
- **图像处理**: OpenCV 4.8.1.78
- **推理框架**: TensorFlow Lite (可选)
- **测试**: pytest 7.4.3

### 前端
- **框架**: Vue 3.3.10
- **构建工具**: Vite 5.0.7
- **路由**: Vue Router 4.2.5
- **HTTP客户端**: Axios 1.6.2
- **样式**: SASS/CSS

## 项目结构

```
intelligent_refrigerator/
├── backend/
│   ├── main.py                 # FastAPI应用入口
│   ├── requirements.txt         # Python依赖
│   ├── .env.example            # 环境变量示例
│   ├── .gitignore
│   ├── routers/                # API路由
│   ├── models/                 # 数据模型
│   ├── services/               # 业务逻辑
│   ├── utils/                  # 工具函数
│   └── tests/                  # 测试文件
│
└── frontend/
    ├── index.html              # HTML入口
    ├── package.json            # Node依赖
    ├── vite.config.js          # Vite配置
    ├── .gitignore
    ├── src/
    │   ├── main.js             # Vue应用入口
    │   ├── App.vue             # 根组件
    │   ├── router/             # 路由配置
    │   ├── views/              # 页面组件
    │   ├── components/         # 可复用组件
    │   ├── services/           # API服务
    │   └── assets/             # 静态资源
    └── public/                 # 公共文件
```

## 快速开始

### 环境准备

1. **创建Conda环境**
```bash
conda create -n intelligent_refrigerator python=3.11
conda activate intelligent_refrigerator
```

2. **安装后端依赖**
```bash
cd backend
pip install -r requirements.txt
```

3. **安装前端依赖**
```bash
cd ../frontend
npm install
```

### 配置

1. **后端配置** - 复制 `.env.example` 为 `.env` 并修改数据库配置
```bash
cp .env.example .env
```

2. **数据库初始化** - 创建MySQL数据库
```sql
CREATE DATABASE intelligent_refrigerator;
USE intelligent_refrigerator;
-- 运行迁移脚本（待实现）
```

### 运行

**启动后端服务**
```bash
cd backend
python main.py
# 或使用uvicorn
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

**启动前端开发服务器**
```bash
cd frontend
npm run dev
# 访问 http://localhost:5173
```

## 主要功能

### 已实现
- ✅ 项目框架搭建
- ✅ 前端UI设计（Home、Inventory、Recognition、Settings）
- ✅ 基础API接口框架
- ✅ 路由及状态管理基础

### 待实现
- 🔄 摄像头集成与图像捕获
- 🔄 食材识别模型部署
- 🔄 真实事件识别算法
- 🔄 库存数据库设计与CRUD
- 🔄 部分取出处理逻辑
- 🔄 过期提醒机制
- 🔄 用户认证与授权

## API端点（规划中）

### 健康检查
- `GET /api/health` - 服务健康状态

### 库存管理
- `GET /api/inventory` - 获取所有食材
- `POST /api/inventory/add` - 添加食材
- `PUT /api/inventory/{id}` - 更新食材
- `DELETE /api/inventory/{id}` - 删除食材
- `GET /api/inventory/categories` - 获取分类列表

### 识别服务
- `POST /api/recognition/capture` - 拍照识别
- `POST /api/recognition/analyze` - 分析图片
- `GET /api/recognition/results` - 获取识别结果

## 开发指南

### 添加新的API端点

1. **后端** - 在 `routers/` 中创建新文件
2. **前端** - 在 `services/api.js` 中添加API调用
3. **UI** - 在 `views/` 或 `components/` 中创建对应页面

### 运行测试

```bash
cd backend
pytest
```

## 性能指标

- **目标算力**: < 1 TOPS (端侧推理)
- **推荐模型**: MobileNet等轻量级模型
- **图像分辨率**: 支持720p/1080p
- **推理延迟**: < 500ms

## 部署

### 嵌入式平台支持
- ARM-based AIoT开发板
- 推荐: 树莓派、NVIDIA Jetson Nano、或其他搭载NPU的开发板

### Docker部署（可选）
```bash
# 构建镜像
docker build -t intelligent-refrigerator .
# 运行容器
docker run -p 8000:8000 -p 5173:5173 intelligent-refrigerator
```

## 贡献指南

1. Fork本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启Pull Request

## 许可证

MIT License

## 联系方式

如有问题或建议，欢迎提Issue或联系开发团队。

---

**最后更新**: 2026.4.7
**版本**: 1.0.0
