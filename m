Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWRCs-0008V9-6Y
 for ath10k@lists.infradead.org; Wed, 16 Oct 2013 13:32:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 6/7] ath10k: fix device initialization routine
References: <1381858196-17000-1-git-send-email-michal.kazior@tieto.com>
 <1381858196-17000-7-git-send-email-michal.kazior@tieto.com>
Date: Wed, 16 Oct 2013 16:31:42 +0300
In-Reply-To: <1381858196-17000-7-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 15 Oct 2013 10:29:55 -0700")
Message-ID: <877gdd735t.fsf@kamboji.qca.qualcomm.com>
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

> Hardware revision 2 does not support cold reset
> correctly. As such it would sometimes lead to host
> machine freeze or data bus errors.
>
> The patch introduces warm reset function which is
> used instead of the cold reset one. It also moves
> the reset before interrupts are being set up to
> prevent any kind of spurious interrupts from being
> handled.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> +	/* reset CE */
> +	addr = ar_pci->mem + RTC_SOC_BASE_ADDRESS + SOC_RESET_CONTROL_ADDRESS;
> +	val = ioread32(addr);
> +	val |= SOC_RESET_CONTROL_CE_RST_MASK;
> +	iowrite32(val, addr);
> +	val = ioread32(addr);
> +	msleep(10);
> +
> +	/* unreset CE */
> +	val &= ~SOC_RESET_CONTROL_CE_RST_MASK, addr;
> +	iowrite32(val, addr);

This looks wrong, I assume it was supposed to be this:

val &= ~SOC_RESET_CONTROL_CE_RST_MASK;

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
