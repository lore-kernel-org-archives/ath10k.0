Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3Q39-0006nw-Nq
 for ath10k@lists.infradead.org; Mon, 30 Nov 2015 15:07:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: stop abusing GFP_DMA
References: <1448361412-22589-1-git-send-email-nbd@openwrt.org>
Date: Mon, 30 Nov 2015 17:06:38 +0200
In-Reply-To: <1448361412-22589-1-git-send-email-nbd@openwrt.org> (Felix
 Fietkau's message of "Tue, 24 Nov 2015 11:36:52 +0100")
Message-ID: <87two3il1d.fsf@kamboji.qca.qualcomm.com>
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
To: Felix Fietkau <nbd@openwrt.org>
Cc: poh@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Felix Fietkau <nbd@openwrt.org> writes:

> Allocations from the DMA zone were originally added for legacy ISA
> stuff, or PCI devices that have specific limitations in their DMA
> addressing capabilities. It has no place in ath10k, which can do
> full 32-bit DMA.
>
> Fixes memory allocation errors on some platforms.
>
> Signed-off-by: Felix Fietkau <nbd@openwrt.org>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
