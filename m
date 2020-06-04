Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgof6-0005QV-7O
 for ath10k@lists.infradead.org; Thu, 04 Jun 2020 12:07:57 +0000
Received: by mail-ot1-x341.google.com with SMTP id o7so4536162oti.9
 for <ath10k@lists.infradead.org>; Thu, 04 Jun 2020 05:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200327093147.189390-1-robert.marko@sartura.hr>
In-Reply-To: <20200327093147.189390-1-robert.marko@sartura.hr>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 4 Jun 2020 14:07:43 +0200
Message-ID: <CA+HBbNE81PhyJ4xZiBXPnbocdC-7A=KgY=tcjLwJS-p=u66Ghw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: enable advertising support for channels 32, 68
 and 98
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
To: ath10k@lists.infradead.org
Cc: Luka Perkov <luka.perkov@sartura.hr>

On Fri, Mar 27, 2020 at 10:31 AM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Enable advertising support for 5G channels: 32, 68 and 96.
> These channels are legal and available for use in ETSI countries.
> So lets advertise these and they will be available in accordance with the regulatory domain used.
Hi, are there are remarks on this patch?

Regards
Robert
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
>  drivers/net/wireless/ath/ath10k/core.h | 2 +-
>  drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index 5101bf2b5b15..480efaa1278c 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -37,7 +37,7 @@
>  #define WMI_READY_TIMEOUT (5 * HZ)
>  #define ATH10K_FLUSH_TIMEOUT_HZ (5 * HZ)
>  #define ATH10K_CONNECTION_LOSS_HZ (3 * HZ)
> -#define ATH10K_NUM_CHANS 41
> +#define ATH10K_NUM_CHANS 44
>  #define ATH10K_MAX_5G_CHAN 173
>
>  /* Antenna noise floor */
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 7fee35ff966b..f98422427b27 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -8363,6 +8363,7 @@ static const struct ieee80211_channel ath10k_2ghz_channels[] = {
>  };
>
>  static const struct ieee80211_channel ath10k_5ghz_channels[] = {
> +       CHAN5G(32, 5160, 0),
>         CHAN5G(36, 5180, 0),
>         CHAN5G(40, 5200, 0),
>         CHAN5G(44, 5220, 0),
> @@ -8371,6 +8372,8 @@ static const struct ieee80211_channel ath10k_5ghz_channels[] = {
>         CHAN5G(56, 5280, 0),
>         CHAN5G(60, 5300, 0),
>         CHAN5G(64, 5320, 0),
> +       CHAN5G(68, 5340, 0),
> +       CHAN5G(96, 5480, 0),
>         CHAN5G(100, 5500, 0),
>         CHAN5G(104, 5520, 0),
>         CHAN5G(108, 5540, 0),
> --
> 2.26.0
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
