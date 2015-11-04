Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu2MV-0005Cw-24
 for ath10k@lists.infradead.org; Wed, 04 Nov 2015 18:00:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH V2 0/3] Fix few WMI/HTT interfaces
References: <1446638737-7953-1-git-send-email-vthiagar@qti.qualcomm.com>
Date: Wed, 4 Nov 2015 19:59:39 +0200
In-Reply-To: <1446638737-7953-1-git-send-email-vthiagar@qti.qualcomm.com>
 (Vasanthakumar Thiagarajan's message of "Wed, 4 Nov 2015 17:35:34
 +0530")
Message-ID: <87h9l1bq7o.fsf@kamboji.qca.qualcomm.com>
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:

> This patch set fixes mismatch in peer_assoc complete wmi command for
> version 10.4 and peer_id configuration for HTT version < 3.4.
>
> V2:
> 	- Add cover letter
> 	- Rename ath10k_mac_need_offchan_tx_work() to
> 	  ath10k_mac_tx_frm_has_freq(). Add htt-op-version check
> 	  to the helper and use it in ath10k_htt_tx() while configuring
> 	  peerid.
>
> Vasanthakumar Thiagarajan (3):
>   ath10k: Fix peer assoc complete WMI command for 10.4
>   ath10k: Rename the helper which is used for off-channel tx
>   ath10k: Fix peerid configuration in htt tx desc for htt version < 3.4

These had a conflict but you didn't use ath.git as the baseline so I
can't easily fix them. Please try always to use clean ath.git master
branch as the baseline for your patches.

Applying: ath10k: Fix peer assoc complete WMI command for 10.4
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/wmi.h).
Repository lacks necessary blobs to fall back on 3-way merge.
Cannot fall back to three-way merge.
Patch failed at 0001 ath10k: Fix peer assoc complete WMI command for 10.4

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
