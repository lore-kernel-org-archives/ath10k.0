Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x22c.google.com ([2607:f8b0:4001:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d9BnU-0004Aj-NK
 for ath10k@lists.infradead.org; Fri, 12 May 2017 14:44:02 +0000
Received: by mail-io0-x22c.google.com with SMTP id k91so41398641ioi.1
 for <ath10k@lists.infradead.org>; Fri, 12 May 2017 07:43:39 -0700 (PDT)
MIME-Version: 1.0
From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Date: Fri, 12 May 2017 20:13:18 +0530
Message-ID: <CABPxzY+mQ-G6PTsQV9_WVgju4bmQHwxKKW070j7v6=DDgZop4Q@mail.gmail.com>
Subject: ath10k: controlling TX aggregation
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
To: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Hi,

I am doing some comparative tests, wanted to configure common
settings btw all STA's. wanted to limit agg_size to 24 in ath10k with
the below command.

echo "3 24" > /sys/kernel/debug/ieee80211/phy0/ath10k/htt_max_amsdu_ampdu

The ADDBA request still has 64 and when i run iperf it is aggregating 64 frames.

Except for 1 no number takes effect. If i configure 1 there is no ADDBA exchange
initiated by ath10k.

Is this expected? Can we control the aggregation size through driver?

latest wireless-drivers-next and linux-firmware git is used.

-- 
Thanks,
Regards,
Chaitanya T K.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
