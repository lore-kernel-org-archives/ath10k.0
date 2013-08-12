Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8t5R-00032T-2E
 for ath10k@lists.infradead.org; Mon, 12 Aug 2013 14:27:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/4] ath10k: use sizeof(*var) in kmalloc
References: <1375949650-9699-1-git-send-email-michal.kazior@tieto.com>
 <1375949650-9699-3-git-send-email-michal.kazior@tieto.com>
Date: Mon, 12 Aug 2013 17:26:37 +0300
In-Reply-To: <1375949650-9699-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 8 Aug 2013 10:14:08 +0200")
Message-ID: <87li47t276.fsf@kamboji.qca.qualcomm.com>
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

> This fixes checkpatch warning from the latest
> 3.11-rc kernel tree.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/pci.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index d95439b..1814af1 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -803,8 +803,7 @@ static int ath10k_pci_start_ce(struct ath10k *ar)
>  			continue;
>  
>  		for (i = 0; i < completions; i++) {
> -			compl = kmalloc(sizeof(struct ath10k_pci_compl),
> -					GFP_KERNEL);
> +			compl = kmalloc(sizeof(*compl), GFP_KERNEL);
>  			if (!compl) {
>  				ath10k_warn("No memory for completion state\n");
>  				ath10k_pci_stop_ce(ar);

Just out of curiosity, what's the warning? kmalloc() should be called
with sizeof(*foo) style?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
