Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WoTGB-0002Bf-OC
 for ath10k@lists.infradead.org; Sun, 25 May 2014 07:54:24 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/3] ath10k: revert incomplete scatter-gather pci tx
References: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
 <1400158139-13836-3-git-send-email-michal.kazior@tieto.com>
Date: Sun, 25 May 2014 10:53:57 +0300
In-Reply-To: <1400158139-13836-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 15 May 2014 14:48:58 +0200")
Message-ID: <87fvjytht6.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, apenwarr@gmail.com

Michal Kazior <michal.kazior@tieto.com> writes:

> This prevents leaving incomplete scatter-gather
> transfer on CE rings which can lead firmware to
> crash.
>
> Reported-By: Avery Pennarun <apenwarr@gmail.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

The title is a bit misleading as usually the commit log with the word
revert means that the commit is reverting another git commit. Maybe
something like this is better:

ath10k: drop incomplete scatter-gather pci tx transfers

> +	if (WARN_ON(src_ring->write_index == src_ring->sw_index))
> +		return;
> +
> +	if (WARN_ON(src_ring->write_index ==
> +		    ath10k_ce_src_ring_write_index_get(ar, ctrl_addr)))
> +		return;

WARN_ON() on data path is dangerous. WARN_ON_ONCE() or ath10k_warn() is
better.

> +err:
> +	for (; i > 0; i--)

Isn't this just a fancy way to say 'while (i-- > 0)'?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
