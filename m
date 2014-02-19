Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG6aR-0007Jo-SU
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 12:49:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC/RFT 3/7] ath10k: replace send_head() with tx_sg()
References: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
 <1392629563-31046-4-git-send-email-michal.kazior@tieto.com>
Date: Wed, 19 Feb 2014 14:48:48 +0200
In-Reply-To: <1392629563-31046-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 17 Feb 2014 10:32:39 +0100")
Message-ID: <87y517xo7j.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> PCI is capable of handling scatter-gather lists.
> This can be used to avoid copying memory.
>
> Change the name of the callback while at to
> reflect its purpose.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> +struct ath10k_hif_sg_item {
> +	u16 transfer_id;
> +	void *transfer_context;
> +	void *vaddr; /* for debugging mostly */
> +	u32 paddr;
> +	u16 len;
> +};

This is the part I don't like. Instead of adding our own structs we
instead should have everything in skb->cb and pass the skbs around. The
sad part was that last fall I was working on cleaning up that but never
found the time to finish it :(

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
