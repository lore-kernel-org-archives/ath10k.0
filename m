Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YyNTF-00046M-Vb
 for ath10k@lists.infradead.org; Fri, 29 May 2015 16:49:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Add debugfs support to configure beacon tx mode
In-Reply-To: <1431594885-32346-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Thu, 14 May 2015 14:44:45 +0530")
References: <1431594885-32346-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Fri, 29 May 2015 19:48:43 +0300
Message-ID: <878uc7wcr8.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Introduce debugfs entry to select beacon tx mode to
> staggered or bursted mode. In staggered mode, software beacon
> alert will be evenly distributed for each beaconing interfaces
> by (beacon intval / number of vif). In bursted mode, batch of
> beacons will be sent out as batch at beacon interval.
>
> By default, staggered mode is selected.
>
> To select bursted mode
>
> echo 1 > /sys/kernel/debug/ieee80211/phyX/ath10k/beacon_tx_mode
>
> For staggered mode,
>
> echo 0 > /sys/kernel/debug/ieee80211/phyX/ath10k/beacon_tx_mode
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

In my opinion this should be configured via nl80211, not from debugfs.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
