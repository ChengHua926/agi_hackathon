import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '私人理财师',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text(
                      '请您提供一下您的平均月收入和税务情况，以便我们从收入状态这一维度进行分析。', style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text('我每个月赚3000块钱'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text(
                      '了解了您的月收入为3000元。接下来，请问您每月的固定支出有哪些？比如房贷、车贷、保险、软件订阅费等。同时，如果您有尚未购买的保险，也请告知。', style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text(
                      '我没有房贷车贷和保险，我每个月有10块钱的QQ会员音乐。',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text(
                      '好的，您每月的固定支出中包括10元的QQ音乐会员费。现在我们来看一下您的变动支出，比如餐饮、购物、旅行等开销。根据您提供的上周支出记录，我们会帮您分析哪些方面可以节省开支。您是否需要我们根据这些数据帮您做一个详细的节省开支计划？同时，如果您有其他的变动支出也请告诉我们。',style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text('好的，请帮我做。'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text(
                      '根据您上周的消费记录，我们发现：\n\n*   您在餐饮上的平均每日支出约为269元；\n*   购物约为262元；\n*   旅行约为258元；\n*   社交活动约为295元；\n*   其他开销约为253元。\n\n鉴于您每月收入为3000元，建议重点关注减少社交活动和餐饮上的支出，这两项是您支出最大的部分。可以考虑减少外出就餐次数，选择性价比更高的社交活动。\n\n接下来，请告诉我您是否有任何债务，例如使用蚂蚁花呗、信用卡等。我们将为您规划还债计划。同时，如果您有任何特定的还债需求或目标，也请告知。', style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text('我的花呗欠了4000块钱，没有信用卡', ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text(
                      '了解到您的花呗欠款为4000元。鉴于此，我们建议制定一个还款计划，以避免逾期利息增加您的负担。考虑到您每月3000元的收入和较低的固定支出（QQ音乐会员10元），我们可以为您设计一个适合的还款策略。请问您每月能分配多少金额用于偿还花呗欠款？同时，如果您有偏好的还款周期（比如希望尽快还清或希望分几个月还），也请告诉我。这将帮助我们更好地为您规划。',style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text('我不知道，你可以帮我做规划吗'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text(
                      '当然可以。考虑到您的月收入为3000元，以及较低的固定开销，我们可以制定一个合理的还款计划，既确保生活必需品和适当的娱乐开销，也能有效还清债务。\n\n首先，我们建议您每月至少为生活必需品和娱乐预留出1000元。剩余的2000元中，考虑到需要一定的灵活性应对突发事件，我们建议每月用1500元来还款，这样既可以确保有足够的资金应对紧急情况，也能在大约3个月左右的时间内还清花呗欠款。这样的规划能为您提供一个平衡点，避免财务压力过大，同时也能逐步解决债务问题。当然，如果您的收入有变化或者有额外的支出需要考虑，请随时调整还款计划。接下来，我们将讨论您的储蓄和投资情况。请问您目前有储蓄或投资吗？例如存款、股票等。同时，如果您有定期存款或投资的计划，请分享给我们。',style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text('没有任何存款和投资'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[200],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text(
                      '考虑到您的情况，我们可以制定一个基本的还款和节省开支的策略，同时注意到您没有任何存款和投资，这意味着我们在规划时需要为您预留一定的应急金。\n\n还款计划\n\n既然您的月收入为3000元，固定支出为10元QQ音乐会员费，且根据您上周的消费习惯，我们发现有节省开支的空间。建议每月至少安排1000元用于偿还花呗欠款，这样可以在4个月内还清欠款，同时避免逾期利息的累积。\n\n节省开支\n\n*   餐饮：考虑减少外出就餐，自己做饭，月节省目标设为200元。\n*   社交活动：选择性参加，减少开支，月节省目标设为100元。\n*   其他开销：审视"其他"类开销，找出非必需品，月节省目标设为100元。\n\n应急金\n\n鉴于您目前没有存款和投资，建议在还清花呗欠款后，开始建立应急基金，每月尽可能存入一定金额，至少覆盖3个月的生活费用。\n\n动作计划\n\n1.  即刻开始：限制非必需开支，优化消费结构。\n2.  每月还款：从下个月起，每月安排1000元用于偿还花呗。\n3.  建立应急金：欠款还清后，开始积累应急基金。\n\n请问您是否需要帮助制定具体的月度预算表，包括详细的开支和还款计划？这将有助于您更好地管理财务。',style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),
                    child: const Text('是的，我需要一个更详细具体的月度预算表'),
                  ),
                ),
                Align(
  alignment: Alignment.centerLeft,
  child: Container(
    decoration: BoxDecoration(
      color: Colors.deepPurple[200],
      borderRadius: BorderRadius.circular(16.0),
    ),
    padding: const EdgeInsets.all(12.0),
    margin: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '根据我们的计划，这里是您接下来四个月的详细预算表：',
          style: TextStyle(color: Colors.white),
        ),
        Image.asset(
          'assets/graph 1.png', // Replace with your image asset path or use Image.network for a network image
          fit: BoxFit.cover,
        ),
        const Text(
          '每月剩余金额为1590元，建议您使用这部分资金来建立应急基金，并在还清花呗欠款后考虑投资和储蓄。\n\n这个预算表旨在帮助您有效管理财务，并逐步实现财务安全和自由。如果您对此计划有任何疑问或需要进一步的调整，请随时告诉我。同时，我将把这个计划的链接发送到我们的钱眼群聊 https://discord.gg/qianyan，您可以随时查看和讨论。',
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  ),
)

              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(32.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            margin: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    // controller: _textController,
                    decoration: InputDecoration(
                      hintText: '输入消息...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.deepPurple,
                  onPressed: () => {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
