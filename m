Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve2OG-0006pm-Rt
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 12:39:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH/RFT 12/12] ath10k: add some debug prints
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
 <1383133346-8135-13-git-send-email-michal.kazior@tieto.com>
Date: Wed, 6 Nov 2013 14:38:49 +0200
In-Reply-To: <1383133346-8135-13-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 30 Oct 2013 12:42:26 +0100")
Message-ID: <87eh6tso12.fsf@kamboji.qca.qualcomm.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Some errors were handled too silently. Also add a
> print indicating BMI is booted.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

>  static int ath10k_pci_hif_power_up(struct ath10k *ar)
> @@ -1860,8 +1862,10 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
>  		ath10k_do_pci_wake(ar);
>  
>  	ret = ath10k_pci_ce_init(ar);
> -	if (ret)
> +	if (ret) {
> +		ath10k_err("could not initialize CE (%d)\n", ret);

"could not initialize CE: %d\n"

That comment applies to all the error codes printed.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
