## brat 结构

1. 界面

- svg
  - 自定义标签
  - group
    - background
      - rect 每一行背景色
    - glow
    - highlight 标注区域的颜色高亮 每个标注都会有一个
    - text 对应每一行
      - span 行间隙
      - textrow
        - text 每个单词和空格
    - row 每一行的标注
      - group 每个单词起始位置
        - group 高亮 当前选中的标注才会高亮 才有内容
          - rect 上方的高亮
        - group (class span)
          - rect 标注上方矩形
          - text 标注的内容
          - path 花括号
    - num
      - text 行号

2. code

- dispatcher
- visualizer
  - 数据结构
    - DocumentData
    - Span
    - Fragment
    - Chunk
    - Arc
  - 数据解析工具
    - tokenizer
    - sentence splitter
    - setDefaultData 错误数据矫正
  - 其他工具
    - isRTL 判断文字翻转
    - bgToFgColor 标注文字颜色
  - 可视化（ 重点 ）
    - Visualizer
      - 数据初始化（ 字体、颜色、宽高 ）
      - 注册自定义事件
        - renderData 界面初始化渲染数据
        - renderDataPatch 界面修改渲染数据
      - 主要方法
        - setData 格式化数据
        - renderDataReal 数据渲染
          - SVG 基础数据设置
          - chunkInvisible a
            - fInvisible a
      - 阶段
        - render
        - Init
        - measures
        - chunks
        - arcsPrep
        - arcs
        - fragmentConnectors
        - rows
        - chunkFinish
        - finish
  - 主要数据格式
    - sourceData
      - action 当前选中的标注 id
      - args
        - focus
      - collection project name
      - document id
      - entities 所有标注
        - 标注 id
        - 标注类型
        - 标注位置
        - 标注颜色
      - font_zoom 字体缩放
      - sentence_offsets 每一句从第几个字符开始到结束
      - text document 整篇文字
      - token_offsets 每个 token 从第几个字符开始到结束
    - data
      - chunks 标注分段
      - sizes 文字宽高
        - fragments 所有标注内容文字的宽度
        - texts 所有单词的宽度
      - spans 每个标注对应的信息
        - fragments
        - headFragment
        -
- visualizer_ui
- annotation_ui

3. 修改步骤

- 两侧添加括号 easy
- 增加每行距离 general
- 给每个单词添加标识符 difficult first
  在 chunk 增加每个 token 包括 from to text 信息 T
  将 chunk 里 token 放入对应的 fragments 中 T
  计算 token 的 curly 值
- 标识符绑定数据 very difficult

entities > span > fragments
token_offsets > chunks 确定 chunk 的 text
将 fragments 添加到 chunks 中 排序 fragments 添加 fragment 的 text
根据 chunk 的 text 生成 svg 计算 chunk 和 fragment 文字宽度

主动标注
被动标注
批改

需要解决的问题 跨行 换行 数据绑定 颜色

遗留样式问题
    标注范围 对同一段文字文字标注 不会创建新的括号 原因是将其放入同一个 tower 中 complete
    重叠 修改重叠算法 complete
    跨行 跨行时他会创建新行 修改 他是按照 chunk 进行文字渲染 需要将 chunk 渲染改成单个文字渲染
        记录每个 token 宽度 complete
        通过 token 宽度计算 currentX
        超出 canvasWidth 创建新行
        将按 chunk 渲染改成按 token 渲染(需要计算 space)
        增加 currentX
数据交互问题 complete
