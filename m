Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCn7W-0004UP-Mu
 for ath10k@lists.infradead.org; Tue, 14 Jun 2016 12:07:03 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix deadlock while processing rx_in_ord_ind
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160609060355.16219-1-rmanohar@qti.qualcomm.com>
Message-ID: <acc80c66985d43dfbc9d5a6a17fcc85e@euamsexm01a.eu.qualcomm.com>
Date: Tue, 14 Jun 2016 14:06:35 +0200
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, rmanohar@codeaurora.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:
> commit 5c86d97bcc1d ("ath10k: combine txrx and replenish task")
> introduced deadlock while processing rx in order indication message
> for qca6174 based devices. While merging replenish and txrx tasklets,
> replenish task should be called out of htt rx ring locking since it
> is also try to acquire the same lock.
> 
> Unfortunately this issue is not exposed by other solutions (qca988x,
> qca99x0 & qca4019), as rx_in_ord_ind message is specific to qca6174
> based devices. This patch fixes
> 
> =============================================
> [ INFO: possible recursive locking detected ]
> 4.7.0-rc2-wt-ath+ #1353 Tainted: G            E
> ---------------------------------------------
> swapper/3/0 is trying to acquire lock:
>  (&(&htt->rx_ring.lock)->rlock){+.-...}, at: [<f8d7ef19>]
> ath10k_htt_rx_msdu_buff_replenish+0x29/0x90 [ath10k_core]
> 
> but task is already holding lock:
>  (&(&htt->rx_ring.lock)->rlock){+.-...}, at: [<f8d82cab>]
> ath10k_htt_txrx_compl_task+0x21b/0x250 [ath10k_core]
> 
> other info that might help us debug this:
>  Possible unsafe locking scenario:
> 
>        CPU0
>        ----
>   lock(&(&htt->rx_ring.lock)->rlock);
>   lock(&(&htt->rx_ring.lock)->rlock);
> 
>  *** DEADLOCK ***
> 
>  May be due to missing lock nesting notation
> 
> 1 lock held by swapper/3/0:
>  #0:  (&(&htt->rx_ring.lock)->rlock){+.-...}, at: [<f8d82cab>]
> ath10k_htt_txrx_compl_task+0x21b/0x250 [ath10k_core]
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=119151
> Fixes: 5c86d97bcc1d ("ath10k: combine txrx and replenish task")
> Reported-by: Mike Lothian <mike@fireburn.co.uk>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Thanks, 1 patch applied to ath-current branch of ath.git:

e50525bef593 ath10k: fix deadlock while processing rx_in_ord_ind

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9166323/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
