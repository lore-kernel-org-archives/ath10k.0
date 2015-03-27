Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbPxV-0002Ak-L7
 for ath10k@lists.infradead.org; Fri, 27 Mar 2015 08:49:42 +0000
Received: by igcau2 with SMTP id au2so28099047igc.1
 for <ath10k@lists.infradead.org>; Fri, 27 Mar 2015 01:49:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1427444516-974-1-git-send-email-michal.kazior@tieto.com>
References: <1427444516-974-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 27 Mar 2015 09:49:18 +0100
Message-ID: <CACKGw+GcZWbXZhcE-1z0Tmaoh5uNyxVRrnK2U7fT00qgff2yWQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: fix arvif->wep_keys clearing
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 27 March 2015 at 09:21, Michal Kazior <michal.kazior@tieto.com> wrote:
> The variable should be cleared regardless of
> whether there's a peer associated with the key or
> not.
>
> This fixes case when user first associates with 2
> WEP keys and then disconnects and connects with 1
> WEP key. This resulted in WEP key count being 2 in
> the driver leading to default keyidx fixup
> failure.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Tested-by: Bartosz Markowski <bartosz.markowski@tieto.com>

> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 9b8313dcb888..9d873900257d 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -4101,6 +4101,13 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>
>         key->hw_key_idx = key->keyidx;
>
> +       if (is_wep) {
> +               if (cmd == SET_KEY)
> +                       arvif->wep_keys[key->keyidx] = key;
> +               else
> +                       arvif->wep_keys[key->keyidx] = NULL;
> +       }
> +
>         /* the peer should not disappear in mid-way (unless FW goes awry) since
>          * we already hold conf_mutex. we just make sure its there now. */
>         spin_lock_bh(&ar->data_lock);
> @@ -4126,11 +4133,6 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>                 flags |= WMI_KEY_GROUP;
>
>         if (is_wep) {
> -               if (cmd == SET_KEY)
> -                       arvif->wep_keys[key->keyidx] = key;
> -               else
> -                       arvif->wep_keys[key->keyidx] = NULL;
> -
>                 if (cmd == DISABLE_KEY)
>                         ath10k_clear_vdev_key(arvif, key);
>
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
