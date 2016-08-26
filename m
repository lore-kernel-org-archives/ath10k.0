Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua0-x22d.google.com ([2607:f8b0:400c:c08::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bdD0b-0000Jt-Pe
 for ath10k@lists.infradead.org; Fri, 26 Aug 2016 09:01:06 +0000
Received: by mail-ua0-x22d.google.com with SMTP id n59so127254613uan.2
 for <ath10k@lists.infradead.org>; Fri, 26 Aug 2016 02:00:44 -0700 (PDT)
MIME-Version: 1.0
From: Changmok Yang <cmyang@mwnl.snu.ac.kr>
Date: Fri, 26 Aug 2016 18:00:43 +0900
Message-ID: <CABYpaOcSNF_bwO8VUYRhrct0KD1w4SB3KfYtFXtiu4sdMquNhg@mail.gmail.com>
Subject: Questions for ath10k rate control, bandwidth, and channel sensing
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi.
We are trying to change transmission bandwidth and data rate.

1. We found that we can only control per-station channel width, and
rate control, like Minstrel, is not controlled by ath10k and in
firmware. Then, can ath10k select the transmission data rate manually?
If so, how? We cannot find the part the data rate is determined.

2. Is it possible to change operating bandwidth per station while
maintaining association?

3. We also want to use parameters related to channel sensing. Although
we found that CCA related parameters are in firmware, we alternatively
want to use parameters related to Ethtool in survey_info structure (in
include/net/cfg80211.h, the structure below). However, when we read
this variable in the log after Ethtrool running, the value does not
seem to reflect channel sensing. Where and how can we use channel
sensing parameters in ath10k? Is it possible?

struct survey_info {
struct ieee80211_channel *channel;
u64 time;
u64 time_busy;
u64 time_ext_busy;
u64 time_rx;
u64 time_tx;
u64 time_scan;
u32 filled;
s8 noise;
};

Thank you.
Sincerely yours,
Changmok Yang.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
