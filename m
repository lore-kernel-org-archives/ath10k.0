Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vn0-x22b.google.com ([2607:f8b0:400c:c0f::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yi9ai-00043v-QC
 for ath10k@lists.infradead.org; Tue, 14 Apr 2015 22:46:02 +0000
Received: by vnbg7 with SMTP id g7so9212816vnb.10
 for <ath10k@lists.infradead.org>; Tue, 14 Apr 2015 15:45:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1428911141-6534-2-git-send-email-janusz.dziedzic@tieto.com>
References: <1428911141-6534-1-git-send-email-janusz.dziedzic@tieto.com>
 <1428911141-6534-2-git-send-email-janusz.dziedzic@tieto.com>
Date: Tue, 14 Apr 2015 15:45:38 -0700
Message-ID: <CAFuUQkhQeCwP098DH7_R4mNCvrJ7WxdT7wnHi52DSOKm8c0k1Q@mail.gmail.com>
Subject: Re: [RFC 2/2] ath10k: don't disable PS when not connected
From: YanBo <dreamfly281@gmail.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Mon, Apr 13, 2015 at 12:45 AM, Janusz Dziedzic
<janusz.dziedzic@tieto.com> wrote:
> Don't disable PS while we are not connected.
> In other case we will get higher power consumption.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 52c5b1f..b896dd4 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -1730,7 +1730,13 @@ static int ath10k_mac_vif_setup_ps(struct ath10k_vif *arvif)
>                 enable_ps = false;
>         }
>
> -       if (enable_ps) {
> +       if (!arvif->is_started) {
> +               /* enable power save mode while not connected,
> +                * in other case after iface up we will get
> +                * higher power consumption - firmware design
> +                */
> +               psmode = WMI_STA_PS_MODE_ENABLED;
> +       } else if (enable_ps) {
>                 psmode = WMI_STA_PS_MODE_ENABLED;
>                 param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
>
> --

What the expectation behavior after we enable the
WMI_STA_PS_MODE_ENABLED at Idle status?
Is there any effect for TX or RX chain after set it?

BR /Yanbo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
