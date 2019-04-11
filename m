Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEisy-0003T4-I2
 for ath10k@lists.infradead.org; Thu, 11 Apr 2019 23:13:37 +0000
Received: by mail-it1-x12b.google.com with SMTP id 139so12488282ita.4
 for <ath10k@lists.infradead.org>; Thu, 11 Apr 2019 16:13:34 -0700 (PDT)
MIME-Version: 1.0
From: Joshua Zhao <swzhao@gmail.com>
Date: Thu, 11 Apr 2019 16:13:23 -0700
Message-ID: <CAKmTU=rcMYRg0oays=9AAwBaEnUDo3bMzfdW-5ytpUfaTvc2qg@mail.gmail.com>
Subject: Zero TID queue stats in dump_htt_stats?
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
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi,
I'm running ath10k driver on QCA IPQ4019. When I enable htt_stats_mask
by "echo 0x1FFFF >
/sys/kernel/debug/ieee80211/phy0/ath10k/htt_stats_mask" I can see tx
rates / rx rates / etc get updated. But the TID queue related stats
are always 0.
Is this known and expected?  Is there anything related to that now
fq_codel in mac80211 handles txq scheduling?

Thanks,
Joshua

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
