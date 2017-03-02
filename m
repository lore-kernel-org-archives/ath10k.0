Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjFmQ-0008NH-E1
 for ath10k@lists.infradead.org; Thu, 02 Mar 2017 01:43:45 +0000
References: <8f2382ad-4778-f32d-762c-09c543e93afd@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <5753f0bb-be72-c64c-2eb4-7a4ac27894b9@dd-wrt.com>
Date: Thu, 2 Mar 2017 02:43:13 +0100
MIME-Version: 1.0
In-Reply-To: <8f2382ad-4778-f32d-762c-09c543e93afd@candelatech.com>
Subject: Re: ath10k bug in station mode with regard to TX-BEAMFORMER?
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org, greearb@candelatech.com

Am 02.03.2017 um 01:56 schrieb Ben Greear:
> I have a user with an AP that advertises itself as a MU-BEAMFORMEE =

> (and not MU-BEAMFORMER).
> My station firmware on 9984 is crashing because it tries to set up =

> MU-MIMO tx logic as
> best as I can figure.
>
> Does the patch below look like a good idea?
>
> If so, I'll do it up official.  Unfortunately, I don't have a good way to
> test this locally, so this is just based on my vague understanding of =

> this
> feature...
i dont know if your patch makes sense, its just looking logic (i handle =

this with vht_capa in wpa supplicant right now)
i also know the crash from older firmwares. with more recent official =

firmwares it does not occur anymore. or lets i havent seen
this issue for a while
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c =

> b/drivers/net/wireless/ath/ath10k/mac.c
> index 219daaee..5aefc8a 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5372,6 +5372,7 @@ static int ath10k_mac_set_txbf_conf(struct =

> ath10k_vif *arvif)
>  {
>         u32 value =3D 0;
>         struct ath10k *ar =3D arvif->ar;
> +       struct ieee80211_vif *vif =3D arvif->vif;
>         int nsts;
>         int sound_dim;
>
> @@ -5391,17 +5392,21 @@ static int ath10k_mac_set_txbf_conf(struct =

> ath10k_vif *arvif)
>         if (!value)
>                 return 0;
>
> -       if (ar->vht_cap_info & IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE)
> +       if ((ar->vht_cap_info & =

> IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE) &&
> +           (vif->type !=3D NL80211_IFTYPE_STATION))
>                 value |=3D WMI_VDEV_PARAM_TXBF_SU_TX_BFER;
>
> -       if (ar->vht_cap_info & IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE)
> +       if ((ar->vht_cap_info & =

> IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE) &&
> +           (vif->type !=3D NL80211_IFTYPE_STATION))
>                 value |=3D (WMI_VDEV_PARAM_TXBF_MU_TX_BFER |
>                           WMI_VDEV_PARAM_TXBF_SU_TX_BFER);
>
> -       if (ar->vht_cap_info & IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE)
> +       if ((ar->vht_cap_info & =

> IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE) &&
> +           (vif->type =3D=3D NL80211_IFTYPE_STATION))
>                 value |=3D WMI_VDEV_PARAM_TXBF_SU_TX_BFEE;
>
> -       if (ar->vht_cap_info & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE)
> +       if ((ar->vht_cap_info & =

> IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE) &&
> +               (vif->type =3D=3D NL80211_IFTYPE_STATION))
>                 value |=3D (WMI_VDEV_PARAM_TXBF_MU_TX_BFEE |
>                           WMI_VDEV_PARAM_TXBF_SU_TX_BFEE);
>
>
> Thanks,
> Ben
>


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Berliner Ring 101, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
