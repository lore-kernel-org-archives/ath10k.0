Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMCsK-00056d-Cr
 for ath10k@lists.infradead.org; Sun, 20 Oct 2019 15:12:09 +0000
Received: by mail-wr1-x443.google.com with SMTP id w18so10475571wrt.3
 for <ath10k@lists.infradead.org>; Sun, 20 Oct 2019 08:12:07 -0700 (PDT)
From: =?UTF-8?q?Tomislav=20Po=C5=BEega?= <pozega.tomislav@gmail.com>
Subject: Re: WARNING at net/mac80211/sta_info.c:1057
 (__sta_info_destroy_part2())
Date: Sun, 20 Oct 2019 17:12:00 +0200
Message-Id: <1571584320-29816-1-git-send-email-pozega.tomislav@gmail.com>
In-Reply-To: <87lfuuln5n.fsf@tynnyri.adurom.net>
References: <87lfuuln5n.fsf@tynnyri.adurom.net>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: kvalo@codeaurora.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, johannes@sipsolutions.net, torvalds@linux-foundation.org, davem@davemloft.net

> -11 is -EAGAIN which would mean that the HTC credits have run out some
>  reason for the WMI command:
> 
> if (ep->tx_credits < credits) {
>         ath10k_dbg(ar, ATH10K_DBG_HTC,
>                 "htc insufficient credits ep %d required %d available %d\n",
>                 eid, credits, ep->tx_credits);
>         spin_unlock_bh(&htc->tx_lock);
>         ret = -EAGAIN;
>         goto err_pull;
> }
> 
> Credits can run out, for example, if there's a lot of WMI command/event
> activity and are not returned during the 3s wait, firmware crashed or
> problems with the PCI bus.

Hi

Can this occur if the target memory is not properly allocated?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
