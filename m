Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZx96-0004Hw-E4
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 12:09:45 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fix warning due to msdu limit error
References: <1542613703-9704-1-git-send-email-bperumal@codeaurora.org>
Date: Thu, 20 Dec 2018 14:09:30 +0200
In-Reply-To: <1542613703-9704-1-git-send-email-bperumal@codeaurora.org>
 (Bhagavathi Perumal S.'s message of "Mon, 19 Nov 2018 13:18:23 +0530")
Message-ID: <87tvj8tn5x.fsf@kamboji.qca.qualcomm.com>
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
To: Bhagavathi Perumal S <bperumal@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bhagavathi Perumal S <bperumal@codeaurora.org> writes:

> Some hardwares variants(QCA99x0) are limiting msdu deaggregation with
> some threshold value(default limit in QCA99x0 is 64 msdus), it was introduced to
> avoid excessive MSDU-deaggregation in error cases. When number of sub frames
> exceeds the limit, target hardware will send all msdus starting from present
> msdu in RAW format as a single msdu packet and it will be indicated with
> error status bit "RX_MSDU_END_INFO0_MSDU_LIMIT_ERR" set in rx descriptor.
> This msdu frame is a partial raw MSDU and does't have first msdu and ieee80211
> header. It caused below warning message.
>
> [  320.151332] ------------[ cut here ]------------
> [  320.155006] WARNING: CPU: 0 PID: 3 at drivers/net/wireless/ath/ath10k/htt_rx.c:1188
>
> In our issue case, MSDU limit error happened due to FCS error and generated
> this warning message.
>
> This fixes the warning by handling the MSDU limit error. If msdu limit error
> happens, driver adds first MSDU's ieee80211 header and sets A-MSDU present bit
> in QOS header so that upper layer processes this frame if it is valid or drop it
> if FCS error set. And removed the warning message, hence partial msdus without
> first msdu is expected in msdu limit error cases.
>
> Tested on QCA9984, Firmware 10.4-3.6-00104
>
> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>

This introduced a new checkpatch warning:

drivers/net/wireless/ath/ath10k/rx_desc.h:681: please, no space before tabs

I fixed that in the pending branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
