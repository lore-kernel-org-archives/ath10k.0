Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPrPM-000087-Ti
 for ath10k@lists.infradead.org; Thu, 13 Aug 2015 12:14:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: initialize features string in
 ath10k_print_driver_info() to prevent garbled dmesg output when fw_features
 == 0
References: <1438750948-3842-1-git-send-email-vvanpo@gmail.com>
Date: Thu, 13 Aug 2015 15:14:26 +0300
In-Reply-To: <1438750948-3842-1-git-send-email-vvanpo@gmail.com> (Victor van
 Poppelen's message of "Wed, 5 Aug 2015 01:02:28 -0400")
Message-ID: <87k2szmllp.fsf@kamboji.qca.qualcomm.com>
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
To: Victor van Poppelen <vvanpo@gmail.com>
Cc: ath10k@lists.infradead.org

Victor van Poppelen <vvanpo@gmail.com> writes:

> ---
>  drivers/net/wireless/ath/ath10k/debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
> index 1a33bf0..5f32924 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -124,7 +124,7 @@ EXPORT_SYMBOL(ath10k_info);
>  
>  void ath10k_print_driver_info(struct ath10k *ar)
>  {
> -	char fw_features[128];
> +	char fw_features[128] = "";

Michal already sent a patch for this:

https://github.com/kvalo/ath/commit/84e3df60f0daba5b1e7874101502d0b030afb867

Also your patch was missing a Signed-off-by and commit log. Please read
Documentation/SubmittingPatches for more info.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
