Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY8DK-0002fP-Cm
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 06:11:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/3] ath10k: don't wait for device init if it crashed
References: <1397038028-7665-1-git-send-email-michal.kazior@tieto.com>
 <1397038028-7665-3-git-send-email-michal.kazior@tieto.com>
Date: Thu, 10 Apr 2014 09:11:04 +0300
In-Reply-To: <1397038028-7665-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 9 Apr 2014 12:07:07 +0200")
Message-ID: <87siplhfyf.fsf@kamboji.qca.qualcomm.com>
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

> When warm resetting it's possible for device to
> crash during initialization. Instead of waiting 3
> seconds just return failure as soon as
> FW_IND_EVENT_PENDING is set.
>
> This speeds up device bootup and recovery in some
> cases.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -2452,6 +2452,9 @@ static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
>  		if (val == 0xffffffff)
>  			continue;
>  
> +		if (val & FW_IND_EVENT_PENDING)
> +			break;

Can you add a small comment here explaining why we do this? "device has
most probably crashed" or something like that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
