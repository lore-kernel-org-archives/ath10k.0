Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwxVl-0001a9-KL
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 19:26:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH V3 0/3] Fix few WMI/HTT interfaces
References: <1446703440-13880-1-git-send-email-vthiagar@qti.qualcomm.com>
Date: Thu, 12 Nov 2015 21:25:41 +0200
In-Reply-To: <1446703440-13880-1-git-send-email-vthiagar@qti.qualcomm.com>
 (Vasanthakumar Thiagarajan's message of "Thu, 5 Nov 2015 11:33:57
 +0530")
Message-ID: <87r3jv58ay.fsf@kamboji.qca.qualcomm.com>
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
> V3:
> 	- Rebase on top of ath:master TOT
>
> Vasanthakumar Thiagarajan (3):
>   ath10k: Fix peer assoc complete WMI command for 10.4
>   ath10k: Rename the helper which is used for off-channel tx
>   ath10k: Fix peerid configuration in htt tx desc for htt version < 3.4

All three applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
