Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fCDqP-0006mI-Bb
 for ath10k@lists.infradead.org; Sat, 28 Apr 2018 00:36:07 +0000
Subject: Re: [PATCH v2] ath10k: fix crash in recent 3.5.3 9984 firmware due
 wrong handling of peer_bw_rxnss_override parameter
References: <20180426092848.23069-1-s.gottschall@dd-wrt.com>
 <f288f18c-684d-2ff9-5739-648e8e716653@candelatech.com>
 <db214e94-1052-d6fa-744a-7c8ebcc84aee@dd-wrt.com>
 <96d512b3-3261-c6cf-e0eb-a9f5fe91f3b8@candelatech.com>
 <8263a720-07a2-dc5d-f8fc-2153574cbafc@dd-wrt.com>
 <96f0393e-6bab-d397-d2b6-4538da7fc275@candelatech.com>
 <f410c1d7-6b19-032d-7f03-6cb1d52f6956@dd-wrt.com>
 <ebaf2806-a63b-5611-41f4-817b1f471fd1@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <e7036e06-9f4d-05bc-ea77-e0a6876f3394@dd-wrt.com>
Date: Sat, 28 Apr 2018 02:35:51 +0200
MIME-Version: 1.0
In-Reply-To: <ebaf2806-a63b-5611-41f4-817b1f471fd1@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: kvalo@codeaurora.org


> I did some testing with the patch below.
i mean you tested your own patch here but i dont see results for mine.
i tested my patch in the same way, just not on firmware side
but i logged the values for rxnss_override and the looked correct all =

the time

>
> The CHAIMASK_ERR is a debug log from FW that I added to help make sure =

> the patch is
> acting as desired.=A0 The first hex is an identifier, second is the =

> value passed in,
> third is phymode, 4th is the tx-chain-mask for 160Mhz frames.
>
> On station side, when associating a 4x4 9984 station to 9984 =

> configured for nss4, 160Mhz, I see:
> [86376.620303] ath10k_pci 0000:04:00.0: NIC rx-max-rate: 1560 =

> calculated-max: 1560 rxnss_override: 0x80000009=A0 nss160: 2 =

> spatial-streams: 4
> =A0 ath10k-fw: ts: 15229 args: 4 RATE_CTRL(19) vid: 255 =

> CHAINMASK_ERR(03)=A0 0x000000af 0x80000009 0x0000000f 0x00000003
>
> On station side, when associating a 4x4 9984 station with chain-mask =

> of 0x3 (2x2) to 9984 configured for nss4, 160Mhz, I see:
>
> [86147.569319] ath10k_pci 0000:04:00.0: NIC rx-max-rate: 1560 =

> calculated-max: 780 rxnss_override: 0x80000000=A0 nss160: 1 =

> spatial-streams: 2
> ath10k-fw: ts: 6807 args: 4 RATE_CTRL(19) vid: 255 CHAINMASK_ERR(03)=A0 =

> 0x000000af 0x80000000 0x0000000f 0x00000001
>
>
> On AP side, when associating a 4x4 9984 station to 9984 configured for =

> 160Mhz, I see:
>
> [11167.635324] ath10k_pci 0000:04:00.0: NIC rx-max-rate: 1560 =

> calculated-max: 1560 rxnss_override: 0x80000009=A0 nss160: 2 =

> spatial-streams: 4
> =A0 ath10k-fw: ts: 72917 args: 4 RATE_CTRL(19) vid: 255 =

> CHAINMASK_ERR(03)=A0 0x000000af 0x80000009 0x0000000f 0x00000003
>
> On AP side, when associating a 4x4 9984 station with chain-mask of 0x3 =

> (2x2) to 9984 configured for nss4, 160Mhz, I see:
>
> [11422.887181] ath10k_pci 0000:04:00.0: NIC rx-max-rate: 1560 =

> calculated-max: 780 rxnss_override: 0x80000000=A0 nss160: 1 =

> spatial-streams: 2
> =A0 ath10k-fw: ts: 334266 args: 4 RATE_CTRL(19) vid: 255 =

> CHAINMASK_ERR(03)=A0 0x000000af 0x80000000 0x0000000f 0x00000001
>
> On AP side, when associating a 4x4 9984 station configured for 80Mhz =

> instead of 160,
> then logging from firmware indicates full 4x4 rates are supported for =

> 80Mhz and below,
> and the rxnss_override does not have the (1<<31) bit set:
>
> =A0 ath10k-fw: ts: 519211 args: 4 RATE_CTRL(19) vid: 255 =

> CHAINMASK_ERR(03)=A0 0x000000af 0x00000000 0x0000000a 0x00000001
>
>
> So, I think this might be a better fix for this problem (included =

> inline for discussion,
> probably white-space damaged by email client:
>
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c =

> b/drivers/net/wireless/ath/ath10k/mac.c
> index e1ad983..8bce916 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -2860,18 +2860,39 @@ static void ath10k_peer_assoc_h_vht(struct =

> ath10k *ar,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 arg->peer_vht_rates.rx_max_rate, =

> arg->peer_vht_rates.rx_mcs_set,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 arg->peer_vht_rates.tx_max_rate, =

> arg->peer_vht_rates.tx_mcs_set);
>
> -=A0=A0=A0 if (arg->peer_vht_rates.rx_max_rate &&
> -=A0=A0=A0=A0=A0=A0=A0 (sta->vht_cap.cap & IEEE80211_VHT_CAP_SUPP_CHAN_WI=
DTH_MASK)) {
> -=A0=A0=A0=A0=A0=A0=A0 switch (arg->peer_vht_rates.rx_max_rate) {
> +=A0=A0=A0 if (arg->peer_phymode =3D=3D MODE_11AC_VHT80_80 ||
> +=A0=A0=A0=A0=A0=A0=A0 arg->peer_phymode =3D=3D MODE_11AC_VHT160) {
> +=A0=A0=A0=A0=A0=A0=A0 int nss160;
> +=A0=A0=A0=A0=A0=A0=A0 int rx =3D arg->peer_vht_rates.rx_max_rate;
> +=A0=A0=A0=A0=A0=A0=A0 /* Deal with cases where chainmask has been decrea=
sed.
> +=A0=A0=A0=A0=A0=A0=A0=A0 * All known chips that support 160Mhz can do on=
ly 1/2 of
> +=A0=A0=A0=A0=A0=A0=A0=A0 * the available chains at 160Mhz.
> +=A0=A0=A0=A0=A0=A0=A0=A0 */
> +=A0=A0=A0=A0=A0=A0=A0 rx =3D min((int)(arg->peer_num_spatial_streams * 3=
90), rx);
> +
> +=A0=A0=A0=A0=A0=A0=A0 switch (rx) {
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* When a NIC shows up that can do 4x4=
 at 160Mhz, its
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * max-rate should be higher, and we=
 can set nss160
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * to 4 here.
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> =A0=A0=A0=A0=A0=A0=A0=A0 case 1560:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Must be 2x2 at 160Mhz is all it c=
an do. */
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 arg->peer_bw_rxnss_override =3D 2;
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nss160 =3D 2;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> -=A0=A0=A0=A0=A0=A0=A0 case 780:
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Can only do 1x1 at 160Mhz (Long Gua=
rd Interval) */
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 arg->peer_bw_rxnss_override =3D 1;
> +=A0=A0=A0=A0=A0=A0=A0 default:
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Assume we can only do 1x1 at 160Mhz=
 */
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nss160 =3D 1;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> =A0=A0=A0=A0=A0=A0=A0=A0 }
> +
> +=A0=A0=A0=A0=A0=A0=A0 arg->peer_bw_rxnss_override =3D ((nss160 - 1) | /*=
 160Mhz nss */
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 ((nss160 - 1) << 3) | /* 80+80 nss */
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 BIT(PEER_BW_RXNSS_OVERRIDE_OFFSET));
> +
> +=A0=A0=A0=A0=A0=A0=A0 ath10k_warn(ar, "NIC rx-max-rate: %d calculated-ma=
x: %d =

> rxnss_override: 0x%x=A0 nss160: %d=A0 spatial-streams: %d\n",
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 arg->peer_vht_rates.rx_max=
_rate, rx,
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 arg->peer_bw_rxnss_overrid=
e, nss160,
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 arg->peer_num_spatial_stre=
ams);
> =A0=A0=A0=A0 }
> =A0}
>
> @@ -3115,9 +3136,9 @@ static int ath10k_peer_assoc_prepare(struct =

> ath10k *ar,
> =A0=A0=A0=A0 ath10k_peer_assoc_h_crypto(ar, vif, sta, arg);
> =A0=A0=A0=A0 ath10k_peer_assoc_h_rates(ar, vif, sta, arg);
> =A0=A0=A0=A0 ath10k_peer_assoc_h_ht(ar, vif, sta, arg);
> +=A0=A0=A0 ath10k_peer_assoc_h_phymode(ar, vif, sta, arg);
> =A0=A0=A0=A0 ath10k_peer_assoc_h_vht(ar, vif, sta, arg);
> =A0=A0=A0=A0 ath10k_peer_assoc_h_qos(ar, vif, sta, arg);
> -=A0=A0=A0 ath10k_peer_assoc_h_phymode(ar, vif, sta, arg);
>
> =A0=A0=A0=A0 ath10k_peer_assoc_h_rate_overrides(ar, vif, sta, arg);
>
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c =

> b/drivers/net/wireless/ath/ath10k/wmi.c
> index 8eeeab0..365d509 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -7442,12 +7442,8 @@ ath10k_wmi_peer_assoc_fill_10_4(struct ath10k =

> *ar, void *buf,
> =A0=A0=A0=A0 struct wmi_10_4_peer_assoc_complete_cmd *cmd =3D buf;
>
> =A0=A0=A0=A0 ath10k_wmi_peer_assoc_fill_10_2(ar, buf, arg);
> -=A0=A0=A0 if (arg->peer_bw_rxnss_override)
> -=A0=A0=A0=A0=A0=A0=A0 cmd->peer_bw_rxnss_override =3D
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __cpu_to_le32((arg->peer_bw_rxnss_over=
ride - 1) |
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BIT(PEER=
_BW_RXNSS_OVERRIDE_OFFSET));
> -=A0=A0=A0 else
> -=A0=A0=A0=A0=A0=A0=A0 cmd->peer_bw_rxnss_override =3D 0;
> +
> +=A0=A0=A0 cmd->peer_bw_rxnss_override =3D =

> __cpu_to_le32(arg->peer_bw_rxnss_override);
> =A0}
>
> =A0static int
>
>
>
> Thanks,
> Ben
>

-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Stubenwaldallee 21a, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
