Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4e6g-00050F-CX
 for ath10k@lists.infradead.org; Thu, 20 Feb 2020 05:10:40 +0000
Received: by mail-vk1-xa43.google.com with SMTP id u6so824650vkn.13
 for <ath10k@lists.infradead.org>; Wed, 19 Feb 2020 21:10:37 -0800 (PST)
MIME-Version: 1.0
References: <1582171405-27236-1-git-send-email-yiboz@codeaurora.org>
In-Reply-To: <1582171405-27236-1-git-send-email-yiboz@codeaurora.org>
From: Justin Capella <justincapella@gmail.com>
Date: Wed, 19 Feb 2020 21:10:26 -0800
Message-ID: <CAMrEMU9FvFm5eFP3YfAap238s+x0hz9kKUO6cEizeR_5KY4F2A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix not registering airtime of 11a station with
 WMM disable
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
To: Yibo Zhao <yiboz@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

ieee80211_sta_register_airtime uses ieee80211_ac_from_tid(tid) which
already applies a mask, so should be returning IEEE80211_AC_BE = 2
already, there has been recent changes to some of this so maybe I'm
looking at the wrong decision but I don't think this change makes a
difference

On Wed, Feb 19, 2020 at 8:02 PM Yibo Zhao <yiboz@codeaurora.org> wrote:
>
> The tid of 11a station with WMM disable reported by FW is 0x10 in
> tx completion. The tid 16 is mapped to a NULL txq since buffer
> MMPDU capbility is not supported. Then 11a station's airtime will
> not be registered due to NULL txq check. As a results, airtime of
> 11a station keeps unchanged in debugfs system.
>
> Mask the tid along with IEEE80211_QOS_CTL_TID_MASK to make it in
> the valid range.
>
> Hardwares tested : QCA9984
> Firmwares tested : 10.4-3.10-00047
>
> Signed-off-by: Yibo Zhao <yiboz@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/htt_rx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index 38a5814..f883f2a 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -2744,7 +2744,8 @@ static void ath10k_htt_rx_tx_compl_ind(struct ath10k *ar,
>                         continue;
>                 }
>
> -               tid = FIELD_GET(HTT_TX_PPDU_DUR_INFO0_TID_MASK, info0);
> +               tid = FIELD_GET(HTT_TX_PPDU_DUR_INFO0_TID_MASK, info0) &
> +                                               IEEE80211_QOS_CTL_TID_MASK;
>                 tx_duration = __le32_to_cpu(ppdu_dur->tx_duration);
>
>                 ieee80211_sta_register_airtime(peer->sta, tid, tx_duration, 0);
> --
> 1.9.1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
