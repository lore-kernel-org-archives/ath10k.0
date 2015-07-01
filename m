Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAF55-0003YV-D3
 for ath10k@lists.infradead.org; Wed, 01 Jul 2015 10:17:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/8] ath10k: enhance swba event handler to adapt
 different size tim bitmap
References: <1434984747-24294-1-git-send-email-rmani@qti.qualcomm.com>
 <1434984747-24294-2-git-send-email-rmani@qti.qualcomm.com>
Date: Wed, 1 Jul 2015 13:16:55 +0300
In-Reply-To: <1434984747-24294-2-git-send-email-rmani@qti.qualcomm.com> (Raja
 Mani's message of "Mon, 22 Jun 2015 20:22:20 +0530")
Message-ID: <87h9poxjvs.fsf@kamboji.qca.qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Raja Mani <rmani@qti.qualcomm.com> writes:

> Due to 512 client support in 10.4 firmware, size of tim ie is going
> to be slightly higher than non 10.4 firmware. So, size of tim_bitmap
> what is carried in swba event from 10.4 firmware is bit higher.
>
> The only bottle neck to reuse existing swba handler
> ath10k_wmi_event_host_swba() for 10.4 is that code designed to deal
> with fixed size tim bitmap(ie, tim_info[].tim_bitmap in wmi_swba_ev_arg).
> This patch removes such size limitation and makes it more suitable
> to handle swba event which has different size tim bitmap.
>
> All existing swba event parsing functions are changed to adapt this
> change. Actual support to handle 10.4 swba event is added in next patch.
> Only preparation is made in this patch.
>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -2874,33 +2874,38 @@ exit:
>  static void ath10k_wmi_update_tim(struct ath10k *ar,
>  				  struct ath10k_vif *arvif,
>  				  struct sk_buff *bcn,
> -				  const struct wmi_tim_info *tim_info)
> +				  const struct wmi_tim_info_arg *tim_info)
>  {
>  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)bcn->data;
>  	struct ieee80211_tim_ie *tim;
>  	u8 *ies, *ie;
>  	u8 ie_len, pvm_len;
>  	__le32 t;
> -	u32 v;
> +	u32 v, tim_len;
> +
> +	/* When FW reports 0 in tim_len, ensure atleast first byte
> +	 * in tim_bitmap is considered for pvm calculation.
> +	 */
> +	tim_len = tim_info->tim_len ? __le32_to_cpu(tim_info->tim_len) : 1;
>  
>  	/* if next SWBA has no tim_changed the tim_bitmap is garbage.
>  	 * we must copy the bitmap upon change and reuse it later */
>  	if (__le32_to_cpu(tim_info->tim_changed)) {
>  		int i;
>  
> -		BUILD_BUG_ON(sizeof(arvif->u.ap.tim_bitmap) !=
> -			     sizeof(tim_info->tim_bitmap));
> +		WARN_ON(sizeof(arvif->u.ap.tim_bitmap) < tim_len);

I'm worried that this WARN_ON() spams too much so I changed it to:

--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2893,7 +2893,7 @@ static void ath10k_wmi_update_tim(struct ath10k *ar,
        if (__le32_to_cpu(tim_info->tim_changed)) {
                int i;
 
-               WARN_ON(sizeof(arvif->u.ap.tim_bitmap) < tim_len);
+               WARN_ON_ONCE(sizeof(arvif->u.ap.tim_bitmap) < tim_len);
 
                for (i = 0; i < tim_len; i++) {
                        t = tim_info->tim_bitmap[i / 4];


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
