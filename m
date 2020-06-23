Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jndbL-0007ek-J4
 for ath10k@lists.infradead.org; Tue, 23 Jun 2020 07:44:20 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] net: ath10k: fix memcpy size from untrusted input
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200616132544.17478-1-bruceshenzk@gmail.com>
References: <20200616132544.17478-1-bruceshenzk@gmail.com>
Message-Id: <20200623074408.8A735C433CB@smtp.codeaurora.org>
Date: Tue, 23 Jun 2020 07:44:08 +0000 (UTC)
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
To: Zekun Shen <bruceshenzk@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

Zekun Shen <bruceshenzk@gmail.com> wrote:

> A compromized ath10k peripheral is able to control the size argument
> of memcpy in ath10k_pci_hif_exchange_bmi_msg.
> 
> The min result from previous line is not used as the size argument
> for memcpy. Instead, xfer.resp_len comes from untrusted stream dma
> input. The value comes from "nbytes" in ath10k_pci_bmi_recv_data,
> which is set inside _ath10k_ce_completed_recv_next_nolock with the line
> 
> nbytes = __le16_to_cpu(sdesc.nbytes);
> 
> sdesc is a stream dma region which device can write to.
> 
> Signed-off-by: Zekun Shen <bruceshenzk@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

aed95297250f ath10k: pci: fix memcpy size of bmi response

-- 
https://patchwork.kernel.org/patch/11607461/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
