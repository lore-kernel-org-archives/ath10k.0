Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFiGE-00081s-UJ
 for ath10k@lists.infradead.org; Wed, 02 Oct 2019 17:18:00 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix offchannel tx failure when
 noath10k_mac_tx_frm_has_freq
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1508284992-3574-1-git-send-email-greearb@candelatech.com>
References: <1508284992-3574-1-git-send-email-greearb@candelatech.com>
Message-Id: <20191002171758.121E760AD9@smtp.codeaurora.org>
Date: Wed,  2 Oct 2019 17:17:57 +0000 (UTC)
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com wrote:

> Offchannel management frames were failing:
> 
> [18099.253732] ath10k_pci 0000:01:00.0: timed out waiting for offchannel skb cf0e3780
> [18102.293686] ath10k_pci 0000:01:00.0: timed out waiting for offchannel skb cf0e3780
> [18105.333653] ath10k_pci 0000:01:00.0: timed out waiting for offchannel skb cf0e3780
> [18108.373712] ath10k_pci 0000:01:00.0: timed out waiting for offchannel skb cf0e3780
> [18111.413687] ath10k_pci 0000:01:00.0: timed out waiting for offchannel skb cf0e36c0
> [18114.453726] ath10k_pci 0000:01:00.0: timed out waiting for offchannel skb cf0e3f00
> [18117.493773] ath10k_pci 0000:01:00.0: timed out waiting for offchannel skb cf0e36c0
> [18120.533631] ath10k_pci 0000:01:00.0: timed out waiting for offchannel skb cf0e3f00
> 
> This bug appears to have been added between 4.0 (which works for us),
> and 4.4, which does not work.
> 
> I think this is because the tx-offchannel logic gets in a loop when
> ath10k_mac_tx_frm_has_freq(ar) is false, so pkt is never actually
> sent to the firmware for transmit.
> 
> This patch fixes the problem on 4.9 for me, and now HS20 clients
> can work again with my firmware.
> 
> Antonio: tested with 10.4-3.5.3-00057 on QCA4019 and QCA9888
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Tested-by: Antonio Quartulli <antonio.quartulli@kaiwoo.ai>
> [kvalo@codeaurora.org: improve commit log, remove unneeded parenthesis]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

cc6df017e557 ath10k: fix offchannel tx failure when no ath10k_mac_tx_frm_has_freq

-- 
https://patchwork.kernel.org/patch/10013117/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
