Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bugti-0004Ft-Fr
 for ath10k@lists.infradead.org; Thu, 13 Oct 2016 14:22:16 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix kernel panic due to race in accessing arvif list
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1476109278-7957-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1476109278-7957-1-git-send-email-vthiagar@qti.qualcomm.com>
Message-ID: <030f922c81064fa9aa26523b2e7f318d@euamsexm01a.eu.qualcomm.com>
Date: Thu, 13 Oct 2016 16:21:47 +0200
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> wrote:
> arvifs list is traversed within data_lock spin_lock in tasklet
> context to fill channel information from the corresponding vif.
> This means any access to arvifs list for add/del operations
> should also be protected with the same spin_lock to avoid the
> race. Fix this by performing list add/del on arvfis within the
> data_lock. This could fix kernel panic something like the below.
> 
>  LR is at ath10k_htt_rx_pktlog_completion_handler+0x100/0xb6c [ath10k_core]
>  PC is at ath10k_htt_rx_pktlog_completion_handler+0x1c0/0xb6c [ath10k_core]
>  Internal error: Oops: 17 [#1] PREEMPT SMP ARM
>  [<bf4857f4>] (ath10k_htt_rx_pktlog_completion_handler+0x2f4/0xb6c [ath10k_core])
>  [<bf487540>] (ath10k_htt_txrx_compl_task+0x8b4/0x1188 [ath10k_core])
>  [<c00312d4>] (tasklet_action+0x8c/0xec)
>  [<c00309a8>] (__do_softirq+0xdc/0x208)
>  [<c0030d6c>] (irq_exit+0x84/0xe0)
>  [<c005db04>] (__handle_domain_irq+0x80/0xa0)
>  [<c00085c4>] (gic_handle_irq+0x38/0x5c)
>  [<c0009640>] (__irq_svc+0x40/0x74)
> 
> (gdb) list *(ath10k_htt_rx_pktlog_completion_handler+0x1c0)
> 0x136c0 is in ath10k_htt_rx_h_channel (drivers/net/wireless/ath/ath10k/htt_rx.c:769)
> 764		struct cfg80211_chan_def def;
> 765
> 766		lockdep_assert_held(&ar->data_lock);
> 767
> 768		list_for_each_entry(arvif, &ar->arvifs, list) {
> 769			if (arvif->vdev_id == vdev_id &&
> 770			    ath10k_mac_vif_chan(arvif->vif, &def) == 0)
> 771				return def.chan;
> 772		}
> 773
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

ebaa4b1620bf ath10k: fix kernel panic due to race in accessing arvif list

-- 
https://patchwork.kernel.org/patch/9369573/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
