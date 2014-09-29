Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYXYY-0006o1-PM
 for ath10k@lists.infradead.org; Mon, 29 Sep 2014 09:47:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/2] ath10k: add firmware crash counters
References: <20140929094214.12889.97523.stgit@potku.adurom.net>
Date: Mon, 29 Sep 2014 12:47:01 +0300
In-Reply-To: <20140929094214.12889.97523.stgit@potku.adurom.net> (Kalle Valo's
 message of "Mon, 29 Sep 2014 12:42:15 +0300")
Message-ID: <8761g63giy.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Ben Greear <greearb@candelatech.com>
>
> kvalo: split into it's own patch, add debugfs file and add locking
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Oh, I forgot to add a commit log. I'm planning to add something like
this:

----------------------------------------------------------------------
Add three counters related to firmware crashes or resets.

Usage:

# cat /sys/kernel/debug/ieee80211/phy0/ath10k/fw_reset_stats 
fw_crash_counter                2
fw_warm_reset_counter           43
fw_cold_reset_counter           0
#

----------------------------------------------------------------------

Also I forgot to add the cover letter, here's the changelog for both
patches:

v2:

* remove unneeded ifdef from debug.c

* rebase on top of Michal's "ath10k: fix fw stats processing",
  dropping patch "ath10k: add helper method to grab debug stats"
  because it was not needed anymore

* remove ifdef from ath10k_ops with "#define foo NULL" hack

* hold mutex when reading pdev_stats in ath10k_debug_get_et_stats()

* move fw reset stats to struct ath10k::stats and add locking

* add fw_reset_stats debugfs file


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
