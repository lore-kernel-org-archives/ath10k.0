Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW0VS-0003nG-DQ
 for ath10k@lists.infradead.org; Mon, 22 Sep 2014 10:06:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: print wmi version info
References: <1411046721-20510-1-git-send-email-michal.kazior@tieto.com>
 <1411046721-20510-2-git-send-email-michal.kazior@tieto.com>
Date: Mon, 22 Sep 2014 13:05:35 +0300
In-Reply-To: <1411046721-20510-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 18 Sep 2014 15:25:19 +0200")
Message-ID: <87fvfkm0ls.fsf@kamboji.qca.qualcomm.com>
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

> HTT version is already printed so print WMI
> version as well for consistency.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/debug.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
> index 3756feb..f1e5916 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -126,14 +126,18 @@ EXPORT_SYMBOL(ath10k_info);
>  
>  void ath10k_print_driver_info(struct ath10k *ar)
>  {
> -	ath10k_info(ar, "%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d\n",
> +	ath10k_info(ar, "%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d wmi %d.%d.%d.%d\n",

Heh, I have been thinking about to add something similar.

But if in the future we add the u32 FW IE for WMI version I would like
to print that as well. I guess we could do that with "%d/%d.%d.%d.%d",
the %d being the u32. The idea here being that both version numbers are
good to know.

But of course for now the above is good, just thinking aloud here.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
