Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VkaET-0003ej-Ve
 for ath10k@lists.infradead.org; Sun, 24 Nov 2013 14:00:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/8] ath10k: don't consume other's shared interrupts
References: <1385125518-13461-1-git-send-email-michal.kazior@tieto.com>
 <1385125518-13461-2-git-send-email-michal.kazior@tieto.com>
Date: Sun, 24 Nov 2013 15:59:49 +0200
In-Reply-To: <1385125518-13461-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 22 Nov 2013 14:05:11 +0100")
Message-ID: <87bo19sxwq.fsf@kamboji.qca.qualcomm.com>
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

> ath10k assumed all interrupts were directed to it.
> This isn't the case for legacy shared interrupts.
> ath10k consumed interrupts for other devices.
>
> Check device irq status and return IRQ_NONE when
> appropriate.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> @@ -2085,6 +2103,9 @@ static irqreturn_t ath10k_pci_interrupt_handler(int irq, void *arg)
>  	struct ath10k *ar = arg;
>  	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
>  
> +	if (!ath10k_pci_irq_pending(ar))
> +		return IRQ_NONE;
> +
>  	if (ar_pci->num_msi_intrs == 0) {
>  		/*
>  		 * IMPORTANT: INTR_CLR regiser has to be set after

What if you move ath10k_pci_irq_pending() call after
ar_pci->num_msi_intrs == 0 check? That way you could remove the
"ar_pci->num_msi_intrs == 0" check from irq_pending() function.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
