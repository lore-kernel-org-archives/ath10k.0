Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x233.google.com ([2607:f8b0:4002:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVJCn-00021y-NO
 for ath10k@lists.infradead.org; Fri, 28 Aug 2015 12:56:30 +0000
Received: by ykft21 with SMTP id t21so13368702ykf.2
 for <ath10k@lists.infradead.org>; Fri, 28 Aug 2015 05:56:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1440679653-20289-1-git-send-email-michal.kazior@tieto.com>
References: <1440679653-20289-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 28 Aug 2015 14:56:07 +0200
Message-ID: <CACKGw+FU0tQ4HZ0O=AB8uo-HyNshr0zjd-Hb+4NytpzsOH4TdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: change beamformee VHT STS capability
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

On 27 August 2015 at 14:47, Michal Kazior <michal.kazior@tieto.com> wrote:
> From: Bartosz Markowski <bartosz.markowski@tieto.com>
>
> All beamformee supporting chips have the ability to support
> VHT NDP in up to 4 STSs. Change the published beamformee
> STS cap accordingly to 3 as it should be Nsts-1.
>
> This makes it possible to actually make full use
> of. e.g. a 4SS MU-MIMO capable AP.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---

Kalle, please drop this one for now. It looks like we need to discuss
about this a bit more still.

>  drivers/net/wireless/ath/ath10k/mac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 64674c955d44..54ced30f5364 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -4074,7 +4074,7 @@ static int ath10k_mac_set_txbf_conf(struct ath10k_vif *arvif)
>
>         if (ar->vht_cap_info & (IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
>                                 IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE))
> -               value |= SM((ar->num_rf_chains - 1), WMI_TXBF_STS_CAP_OFFSET);
> +               value |= SM(3, WMI_TXBF_STS_CAP_OFFSET);
>
>         if (ar->vht_cap_info & (IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE |
>                                 IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE))
> @@ -6804,7 +6804,7 @@ static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
>
>         if (ar->vht_cap_info & (IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
>                                 IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE)) {
> -               val = ar->num_rf_chains - 1;
> +               val = 3;
>                 val <<= IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
>                 val &= IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK;
>
> --
> 2.1.4
>



-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
