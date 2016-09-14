Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkAwG-0000sj-2w
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 14:13:28 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 08/21] ath10k: make firmware text debug messages more
 verbose.
Date: Wed, 14 Sep 2016 14:12:58 +0000
Message-ID: <87sht2efiu.fsf@kamboji.qca.qualcomm.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-9-git-send-email-greearb@candelatech.com>
In-Reply-To: <1462986153-16318-9-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 11 May 2016 10:02:20	-0700")
Content-Language: en-US
Content-ID: <80F46E17B4191C41AB7796238DC9E430@qualcomm.com>
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
To: "greearb@candelatech.com" <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> There are not many of these messages producted by the
> firmware, but they are generally fairly useful, so print
> them at info level.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 1758b4a..d9e4b77 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -4050,7 +4050,7 @@ void ath10k_wmi_event_debug_print(struct ath10k *ar, struct sk_buff *skb)
>  	/* the last byte is always reserved for the null character */
>  	buf[i] = '\0';
>  
> -	ath10k_dbg(ar, ATH10K_DBG_WMI_PRINT, "wmi print '%s'\n", buf);
> +	ath10k_info(ar, "wmi print '%s'\n", buf);

Useful to whom and how? I understand that for firmware developers this
is very valuable information and that's why we have a special debug
level for it. But I suspect that for normal users these are just
confusing and unnecessarily spam the log.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
