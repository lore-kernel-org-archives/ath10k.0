Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhK1Y-0004WI-Ea
 for ath10k@lists.infradead.org; Thu, 23 Oct 2014 15:10:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 7/9] ath10k: add extra sanity check when popping amsdu
References: <1413812438-14640-1-git-send-email-michal.kazior@tieto.com>
 <1413812438-14640-8-git-send-email-michal.kazior@tieto.com>
Date: Thu, 23 Oct 2014 18:09:31 +0300
Message-ID: <87wq7qomac.fsf@kamboji.qca.qualcomm.com>
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

> The netbuf pop can return NULL. Make sure to check
> for that. It shouldn't happen but better safe than
> sorry.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/htt_rx.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index 7fa4d87..ddb9fe9 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -428,6 +428,15 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
>  		while (msdu_chained--) {
>  			struct sk_buff *next = ath10k_htt_rx_netbuf_pop(htt);
>  
> +			if (!next) {
> +				ath10k_err(ar, "failed to pop chained msdu\n");

ath10k_warn() is better here, right? I have folded this diff to the patch:

--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -429,7 +429,7 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
                        struct sk_buff *next = ath10k_htt_rx_netbuf_pop(htt);
 
                        if (!next) {
-                               ath10k_err(ar, "failed to pop chained msdu\n");
+                               ath10k_warn(ar, "failed to pop chained msdu\n");
                                ath10k_htt_rx_free_msdu_chain(*head_msdu);
                                *head_msdu = NULL;
                                msdu = NULL;

Full commit:

https://github.com/kvalo/ath/commit/03f316720d664a79e874c13df1e86a64c5f2bf5f

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
