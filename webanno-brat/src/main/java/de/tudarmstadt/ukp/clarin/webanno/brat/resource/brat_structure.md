## brat结构
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
                    - SVG基础数据设置
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
            - action 当前选中的标注id
            - args
                - focus
            - collection project name
            - document id
            - entities 所有标注
                - 标注id
                - 标注类型
                - 标注位置
                - 标注颜色
            - font_zoom 字体缩放
            - sentence_offsets 每一句从第几个字符开始到结束
            - text document整篇文字
            - token_offsets 每个token从第几个字符开始到结束
        - data 
            - chunks 标注分段
            - sizes 文字宽高
                - fragments 所有标注内容文字的宽度
                - texts 所有单词的宽度
            - spans 每个标注对应的信息
                - fragments
                - headFragment
                - 
- visualize
r_ui
- annotatio
n_ui


3. 修改步骤

- 两侧添加括号 easy
- 增加每行距离 general
- 给每个单词添加标识符 difficult first
    在chunk增加每个token 包括from to text信息 T
    将chunk里token放入对应的fragments中 T
    计算token的curly值
- 标识符绑定数据 very difficult

entities > span > fragments
token_offsets > chunks 确定chunk的text
将fragments添加到chunks中 排序fragments 添加fragment的text
根据chunk的text生成svg 计算chunk和fragment文字宽度

主动标注
被动标注
    批改

需要解决的问题 跨行 换行 数据绑定 颜色

遗留样式问题
    标注范围 对同一段文字文字标注 不会创建新的括号 原因是将其放入同一个tower中 complete
    重叠 修改重叠算法 complete
    跨行 跨行时他会创建新行 修改 他是按照chunk进行文字渲染 需要将chunk渲染改成单个文字渲染
数据交互问题