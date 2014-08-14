Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHqau-0007p1-8E
 for ath10k@lists.infradead.org; Thu, 14 Aug 2014 08:41:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/5] ath10k: split ce irq/handler setup
References: <1407402260-29854-1-git-send-email-michal.kazior@tieto.com>
 <1407402260-29854-5-git-send-email-michal.kazior@tieto.com>
Date: Thu, 14 Aug 2014 11:40:43 +0300
In-Reply-To: <1407402260-29854-5-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 7 Aug 2014 11:04:19 +0200")
Message-ID: <87a977o450.fsf@kamboji.qca.qualcomm.com>
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

> It doesn't make much sense to overwrite send_cb
> and recv_cb callbacks over and over again whenever
> transport starts. Just make sure to unmask copy
> engine interrupts when starting.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

The patch looks, just a followup question for the future:

> @@ -1674,7 +1639,9 @@ static int ath10k_pci_ce_init(struct ath10k *ar)
>  		pipe_info->hif_ce_state = ar;
>  		attr = &host_ce_config_wlan[pipe_num];
>  
> -		ret = ath10k_ce_init_pipe(ar, pipe_num, attr);
> +		ret = ath10k_ce_init_pipe(ar, pipe_num, attr,
> +					  ath10k_pci_ce_send_done,
> +					  ath10k_pci_ce_recv_data);

As we call ath10k_ce_init_pipe() only once and seem to have only one set
of functions, why even bother bother with function pointers? What if we
just call the functions directly?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
