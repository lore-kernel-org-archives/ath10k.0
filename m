Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5A0K-0000Iw-Nn
 for ath10k@lists.infradead.org; Fri, 02 Aug 2013 07:42:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: fix device teardown
References: <1374129572-6079-1-git-send-email-michal.kazior@tieto.com>
 <1375427747-9539-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 2 Aug 2013 10:41:56 +0300
In-Reply-To: <1375427747-9539-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 2 Aug 2013 09:15:47 +0200")
Message-ID: <87bo5gpmij.fsf@kamboji.qca.qualcomm.com>
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

> This fixes interrupt-related issue when no
> interfaces were running thus the device was
> considered powered down.
>
> The power_down() function isn't really powering
> down the device. It simply assumed it won't
> interrupt. This wasn't true in some cases and
> could lead to paging failures upon FW indication
> interrupt (i.e. FW crash) because some structures
> aren't allocated in that device state.
>
> One reason for that was that ar_pci->started
> wasn't reset. The other is interrupts should've
> been masked when teardown starts.
>
> The patch reorganized interrupt setup and makes
> sure ar_pci->started is reset accordingly.
>
> Reported-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
> v2:
>  * updated commit message
>  * added Reported-By: Ben
>  * added disable_irq() in hif_stop()
>  * added ar_pci->started resetting
>  * removed ar_pci->intr_started

Thanks, this looks much better now.

But I still have one question:

> @@ -1742,6 +1761,12 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
>  {
>  	int ret;
>  
> +	ret = ath10k_pci_start_intr(ar);
> +	if (ret) {
> +		ath10k_err("could not start interrupt handling (%d)\n", ret);
> +		goto err;
> +	}

So now we call start_intr() during power_up(), which means that we do
the request_irq() calls during every interface up event. Does that cause
any meaningful overhead?

For me it looks better to do all resource allocation in
ath10k_pci_probe(), like request_irq(), and free the resources in
ath10k_pci_remove(). But then we would need to immeadiately call
disable_irq() and then enable_irq() from power_up() so I'm not sure if
that's any better.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
