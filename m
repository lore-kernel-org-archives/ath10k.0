Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBnOP-0008Pj-KW
 for ath10k@lists.infradead.org; Thu, 26 Apr 2018 20:21:28 +0000
Subject: Re: [PATCH v2] ath10k: fix crash in recent 3.5.3 9984 firmware due
 wrong handling of peer_bw_rxnss_override parameter
References: <20180426092848.23069-1-s.gottschall@dd-wrt.com>
 <f288f18c-684d-2ff9-5739-648e8e716653@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <db214e94-1052-d6fa-744a-7c8ebcc84aee@dd-wrt.com>
Date: Thu, 26 Apr 2018 22:21:12 +0200
MIME-Version: 1.0
In-Reply-To: <f288f18c-684d-2ff9-5739-648e8e716653@candelatech.com>
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

Am 26.04.2018 um 17:30 schrieb Ben Greear:
> On 04/26/2018 02:28 AM, s.gottschall@dd-wrt.com wrote:
>> From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>>
>> current handling of peer_bw_rxnss_override parameter is based on =

>> guessing the VHT160/8080 capability by rx rate. this is wrong and may =

>> lead
>> to a non initialized peer_bw_rxnss_override parameter which is =

>> required since VHT160 operation mode only supports 2x2 chainmasks in =

>> addition the original code
>> initialized the parameter with wrong masked values.
>> This patch uses the peer phymode and peer nss information for correct =

>> initialisation of the peer_bw_rxnss_override parameter.
>> if this peer information is not available, we initialize the =

>> parameter by minimum nss which is suggested by QCA as temporary =

>> workaround according
>> to the QCA sourcecodes.
>>
>> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>>
>> v2: remove debug messages
>> ---
>> =A0drivers/net/wireless/ath/ath10k/mac.c | 36 =

>> +++++++++++++++++++----------------
>> =A0drivers/net/wireless/ath/ath10k/wmi.c |=A0 4 +---
>> =A0drivers/net/wireless/ath/ath10k/wmi.h | 14 +++++++++++++-
>> =A03 files changed, 34 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c =

>> b/drivers/net/wireless/ath/ath10k/mac.c
>> index 5be6386ede8f..df79af89ee71 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -2505,8 +2505,9 @@ static void ath10k_peer_assoc_h_vht(struct =

>> ath10k *ar,
>> =A0=A0=A0=A0 if (sta->bandwidth =3D=3D IEEE80211_STA_RX_BW_80)
>> =A0=A0=A0=A0=A0=A0=A0=A0 arg->peer_flags |=3D ar->wmi.peer_flags->bw80;
>>
>> -=A0=A0=A0 if (sta->bandwidth =3D=3D IEEE80211_STA_RX_BW_160)
>> +=A0=A0=A0 if (sta->bandwidth =3D=3D IEEE80211_STA_RX_BW_160) {
>> =A0=A0=A0=A0=A0=A0=A0=A0 arg->peer_flags |=3D ar->wmi.peer_flags->bw160;
>> +=A0=A0=A0 }
>>
>> =A0=A0=A0=A0 /* Calculate peer NSS capability from VHT capabilities if S=
TA
>> =A0=A0=A0=A0=A0 * supports VHT.
>> @@ -2529,22 +2530,25 @@ static void ath10k_peer_assoc_h_vht(struct =

>> ath10k *ar,
>> =A0=A0=A0=A0 arg->peer_vht_rates.tx_mcs_set =3D ath10k_peer_assoc_h_vht_=
limit(
>> =A0=A0=A0=A0=A0=A0=A0=A0 __le16_to_cpu(vht_cap->vht_mcs.tx_mcs_map), vht=
_mcs_mask);
>>
>> -=A0=A0=A0 ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vht peer %pM max_mpdu %d =

>> flags 0x%x\n",
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sta->addr, arg->peer_max_mpdu, arg->peer=
_flags);
>> +=A0=A0=A0 if (arg->peer_num_spatial_streams && (arg->peer_phymode =3D=
=3D =

>> MODE_11AC_VHT160 || arg->peer_phymode =3D=3D MODE_11AC_VHT80_80)) {
>> +=A0=A0=A0=A0=A0=A0=A0 arg->peer_bw_rxnss_override =3D =

>> BW_NSS_FWCONF_160(arg->peer_num_spatial_streams);
>> +=A0=A0=A0 }
>
> So, an 80Mhz peer could be 4x4 and could connect to a VHT-160 AP. From =

> what I can tell,
> the VHT-160 AP can talk 4x4 @ 80Mhz to the peer in this case, but if =

> peer is VHT-160,
> then of course it can only talk at 2x2.
>
> So, I don't think you can just look at the peer_num_spatial_streams here.
no? rxnss_override is only taked if peer phymode is vht160 or vht80_80. =

vht80 is not considered in that code PEER phy_mode, not HOST phy_mode
this parameter is a assoc per peer parameter as far as i can say here.
consider that the firmware will accept anything except 0 for =

peer_bw_rxnss_override in vht160 operation mode
if a peer is 80 mhz, the code will be skipped here.

>
>
>> -=A0=A0=A0 if (arg->peer_vht_rates.rx_max_rate &&
>> -=A0=A0=A0=A0=A0=A0=A0 (sta->vht_cap.cap & IEEE80211_VHT_CAP_SUPP_CHAN_W=
IDTH_MASK)) {
>> -=A0=A0=A0=A0=A0=A0=A0 switch (arg->peer_vht_rates.rx_max_rate) {
>> -=A0=A0=A0=A0=A0=A0=A0 case 1560:
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Must be 2x2 at 160Mhz is all it ca=
n do. */
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 arg->peer_bw_rxnss_override =3D 2;
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
>> -=A0=A0=A0=A0=A0=A0=A0 case 780:
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Can only do 1x1 at 160Mhz (Long Gu=
ard Interval) */
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 arg->peer_bw_rxnss_override =3D 1;
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
>> -=A0=A0=A0=A0=A0=A0=A0 }
>
> This old code does look wrong, the firmware is using zero-based, so =

> override-0 =3D=3D nss-1, override-1 =3D=3D nss-2.
0 =3D crash

and 1 and 2 is wrong.

+#define BW_NSS_FWCONF_MAP_ENABLE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (1 <<=
 31)
+#define BW_NSS_FWCONF_MAP_160MHZ_S=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (0)
+#define BW_NSS_FWCONF_MAP_160MHZ_M=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (0x000000=
07)
+#define BW_NSS_FWCONF_MAP_80_80MHZ_S=A0=A0=A0=A0=A0=A0=A0=A0 (3)
+#define BW_NSS_FWCONF_MAP_80_80MHZ_M=A0=A0=A0=A0=A0=A0=A0=A0 (0x00000038)
>
> This is confusing enough that it deserves a comment in the code I =

> think....
the removal doesnt deserve a comment. i dont know how to explain that =

its simply wrong. it uses the wrong
bit masks and this has been written in the initial patch description
>
>> +=A0=A0=A0 if (arg->peer_num_spatial_streams && arg->peer_phymode =3D=3D =

>> MODE_11AC_VHT80_80) {
>> +=A0=A0=A0=A0=A0=A0=A0 arg->peer_bw_rxnss_override |=3D =

>> BW_NSS_FWCONF_80_80(arg->peer_num_spatial_streams);
>> =A0=A0=A0=A0 }
>> +
>> +=A0=A0=A0 /* In very exceptional=A0 conditions it is observed=A0 that
>> +=A0=A0=A0=A0 * firmware was receiving bw_rxnss_override as 0 for peer f=
rom =

>> host, and resulting in Target Assert.
>> +=A0=A0=A0=A0 * Changing the rxnss_override to minimum nss. This is a =

>> temporary WAR. Needs to be fixed
>> +=A0=A0=A0=A0 * properly.
>> +=A0=A0=A0=A0 */
>> +=A0=A0=A0 if (!arg->peer_num_spatial_streams && (arg->peer_phymode =3D=
=3D =

>> MODE_11AC_VHT80_80 || arg->peer_phymode =3D=3D MODE_11AC_VHT160)) {
>> +=A0=A0=A0=A0=A0=A0=A0 arg->peer_bw_rxnss_override =3D BW_NSS_FWCONF_MAP=
_ENABLE;
>> +=A0=A0=A0 }
>> +
>> +=A0=A0=A0 ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vht peer %pM max_mpdu %d =

>> flags 0x%x\n",
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sta->addr, arg->peer_max_mpdu, arg->peer=
_flags);
>> =A0}
>>
>> =A0static void ath10k_peer_assoc_h_qos(struct ath10k *ar,
>> @@ -2696,9 +2700,9 @@ static int ath10k_peer_assoc_prepare(struct =

>> ath10k *ar,
>> =A0=A0=A0=A0 ath10k_peer_assoc_h_crypto(ar, vif, sta, arg);
>> =A0=A0=A0=A0 ath10k_peer_assoc_h_rates(ar, vif, sta, arg);
>> =A0=A0=A0=A0 ath10k_peer_assoc_h_ht(ar, vif, sta, arg);
>> +=A0=A0=A0 ath10k_peer_assoc_h_phymode(ar, vif, sta, arg);
>> =A0=A0=A0=A0 ath10k_peer_assoc_h_vht(ar, vif, sta, arg);
>> =A0=A0=A0=A0 ath10k_peer_assoc_h_qos(ar, vif, sta, arg);
>> -=A0=A0=A0 ath10k_peer_assoc_h_phymode(ar, vif, sta, arg);
>>
>> =A0=A0=A0=A0 return 0;
>> =A0}
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c =

>> b/drivers/net/wireless/ath/ath10k/wmi.c
>> index 2c36256a441d..7d72fdc703c8 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>> @@ -7212,9 +7212,7 @@ ath10k_wmi_peer_assoc_fill_10_4(struct ath10k =

>> *ar, void *buf,
>>
>> =A0=A0=A0=A0 ath10k_wmi_peer_assoc_fill_10_2(ar, buf, arg);
>> =A0=A0=A0=A0 if (arg->peer_bw_rxnss_override)
>> -=A0=A0=A0=A0=A0=A0=A0 cmd->peer_bw_rxnss_override =3D
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __cpu_to_le32((arg->peer_bw_rxnss_ove=
rride - 1) |
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BIT(PEE=
R_BW_RXNSS_OVERRIDE_OFFSET));
>> +=A0=A0=A0=A0=A0=A0=A0 cmd->peer_bw_rxnss_override =3D =

>> __cpu_to_le32(arg->peer_bw_rxnss_override);
>> =A0=A0=A0=A0 else
>> =A0=A0=A0=A0=A0=A0=A0=A0 cmd->peer_bw_rxnss_override =3D 0;
>> =A0}
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h =

>> b/drivers/net/wireless/ath/ath10k/wmi.h
>> index 46ae19bb2c92..1fe0aa5523a6 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
>> @@ -6380,7 +6380,19 @@ struct wmi_10_2_peer_assoc_complete_cmd {
>> =A0=A0=A0=A0 __le32 info0; /* WMI_PEER_ASSOC_INFO0_ */
>> =A0} __packed;
>>
>> -#define PEER_BW_RXNSS_OVERRIDE_OFFSET=A0 31
>> +#define BW_NSS_FWCONF_MAP_ENABLE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (1=
 << 31)
>> +#define BW_NSS_FWCONF_MAP_160MHZ_S=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (0)
>> +#define BW_NSS_FWCONF_MAP_160MHZ_M=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (0x000=
00007)
>> +#define BW_NSS_FWCONF_MAP_80_80MHZ_S=A0=A0=A0=A0=A0=A0=A0=A0 (3)
>> +#define BW_NSS_FWCONF_MAP_80_80MHZ_M=A0=A0=A0=A0=A0=A0=A0=A0 (0x0000003=
8)
>
> Older FW does not pay attention to the 80_80 bits.=A0 It uses masks so =

> it is
> backwards-compat, but maybe worth a comment.
i took that masks from recent 3.5.3 based qca code. its correct and if =

its backward compatible, it's still correct
i mean the old code did not coment anything. so dont know how to write =

anything more about it now. see patch description

>
>> +#define BW_NSS_FWCONF_MAP_M=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 (0x0000003F)
>> +
>> +#define GET_BW_NSS_FWCONF_160(x)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((=
((x) & =

>> BW_NSS_FWCONF_MAP_160MHZ_M) >> BW_NSS_FWCONF_MAP_160MHZ_S) + 1)
>> +#define GET_BW_NSS_FWCONF_80_80(x)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((((x)=
 & =

>> BW_NSS_FWCONF_MAP_80_80MHZ_M) >> BW_NSS_FWCONF_MAP_80_80MHZ_S) + 1)
>> +
>> +/* Values defined to set 160 MHz Bandwidth NSS Mapping into FW*/
>> +#define BW_NSS_FWCONF_160(x)=A0=A0=A0=A0=A0=A0=A0=A0=A0 (BW_NSS_FWCONF_=
MAP_ENABLE | =

>> (((x - 1) << BW_NSS_FWCONF_MAP_160MHZ_S) & BW_NSS_FWCONF_MAP_160MHZ_M))
>> +#define BW_NSS_FWCONF_80_80(x)=A0=A0=A0=A0=A0=A0=A0 (BW_NSS_FWCONF_MAP_=
ENABLE | =

>> (((x - 1) << BW_NSS_FWCONF_MAP_80_80MHZ_S) & =

>> BW_NSS_FWCONF_MAP_80_80MHZ_M))
>>
>> =A0struct wmi_10_4_peer_assoc_complete_cmd {
>> =A0=A0=A0=A0 struct wmi_10_2_peer_assoc_complete_cmd cmd;
>>
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
