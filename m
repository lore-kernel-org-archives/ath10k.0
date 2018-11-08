Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKYIu-00016H-NU
 for ath10k@lists.infradead.org; Thu, 08 Nov 2018 00:36:14 +0000
Received: by mail-io1-xd42.google.com with SMTP id d80-v6so13393838iof.1
 for <ath10k@lists.infradead.org>; Wed, 07 Nov 2018 16:36:01 -0800 (PST)
Received: from mail-it1-f180.google.com (mail-it1-f180.google.com.
 [209.85.166.180])
 by smtp.gmail.com with ESMTPSA id m9-v6sm735203ioc.29.2018.11.07.16.35.58
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Nov 2018 16:35:58 -0800 (PST)
Received: by mail-it1-f180.google.com with SMTP id m15so25648845itl.4
 for <ath10k@lists.infradead.org>; Wed, 07 Nov 2018 16:35:58 -0800 (PST)
MIME-Version: 1.0
References: <1538989363-12386-1-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1538989363-12386-1-git-send-email-wgong@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 7 Nov 2018 16:35:46 -0800
Message-ID: <CA+ASDXNxA2jrn2M=MjcnVV72UCfcFUvSvdcvBCd2kY+d12=wKg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Add peer flush in ath10k_flush for STATION
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
To: wgong@codeaurora.org, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Mon, Oct 8, 2018 at 2:03 AM Wen Gong <wgong@codeaurora.org> wrote:
>
> In the noisy environment, if there are packets in the queue and can't
> send out, the suspend timing will be more than 5 seconds due to the wait,
> flush the queue to optimize the suspend timing, and let the upper layer to
> retry the packets after resume.
>
> Tested with QCA6174 PCI with firmware
> WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
> It's not a regression with new firmware releases.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
>  drivers/net/wireless/ath/ath10k/mac.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 97548f9..8df3cec 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -6814,9 +6814,20 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
>                          u32 queues, bool drop)
>  {
>         struct ath10k *ar = hw->priv;
> -
> -       if (drop)
> +       struct ath10k_vif *arvif;
> +       u32 bitmap;
> +
> +       if (drop) {
> +               if (vif->type == NL80211_IFTYPE_STATION) {

'vif' may be NULL. It is trivially easy for me to crash a system on
v4.20-rc1 by suspending the system while not connected.

I'll send a patch to fix this.

Brian

> +                       bitmap = ~(1 << WMI_MGMT_TID);
> +                       list_for_each_entry(arvif, &ar->arvifs, list) {
> +                               if (arvif->vdev_type == WMI_VDEV_TYPE_STA)
> +                                       ath10k_wmi_peer_flush(ar, arvif->vdev_id,
> +                                                             arvif->bssid, bitmap);
> +                       }
> +               }
>                 return;
> +       }
>
>         mutex_lock(&ar->conf_mutex);
>         ath10k_mac_wait_tx_complete(ar);
> --
> 1.9.1
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
