Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fDH4M-0004yu-6B
 for ath10k@lists.infradead.org; Mon, 30 Apr 2018 22:14:52 +0000
Subject: Re: [PATCH v7] ath10k: fix crash in recent 3.5.3 9984 firmware due
 wrong handling of peer_bw_rxnss_override parameter
References: <20180430213046.8393-1-s.gottschall@dd-wrt.com>
 <5AE78F7D.7090909@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <caeeaac0-dd71-89f3-8690-88d4a58ec5a0@dd-wrt.com>
Date: Tue, 1 May 2018 00:14:33 +0200
MIME-Version: 1.0
In-Reply-To: <5AE78F7D.7090909@candelatech.com>
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


>> +=A0=A0=A0 /* only 4x4 configuration do support 2x2 for VHT160, everythi=
ng =

>> else must use 1x1 */
>> +=A0=A0=A0 if (ar->cfg_rx_chainmask =3D=3D 15)
>> +=A0=A0=A0=A0=A0=A0=A0 nss160 =3D arg->peer_num_spatial_streams <=3D 2 ? =

>> arg->peer_num_spatial_streams : 2;
>
> If peer nss =3D=3D 3, then nss160 must be 1x1.=A0 That is why I previousl=
y =

> suggested the code that set nss160 to equal nss / 2
> (with special case to bump nss160 to 1x1 if nss =3D=3D 1.
btw. it doesnt matter if the peer sends with 3x3 or even 4x4, i still =

can receive with 2x2. thats no conflict. switching back to 1x1 of the =

peer sends vht160 with 3x3 makes no real sense
i dont have to turn off a chain, if i'm able todo 2x2, no matter what =

the peer does. i just have to limit the maximum

>
> A 9984 peer with chainmask configured to 0x7 would hit this case I think.
>
> Overall this looks better than previous patches though.
>
> Thanks,
> Ben
>
>> +
>> +=A0=A0=A0 /* in case if peer is connected with vht160 or vht80+80, we n=
eed =

>> to properly adjust rxnss parameters otherwise firmware will raise a =

>> assert */
>> +=A0=A0=A0 switch(arg->peer_phymode) {
>> +=A0=A0=A0 case MODE_11AC_VHT80_80:
>> +=A0=A0=A0=A0=A0=A0=A0 arg->peer_bw_rxnss_override =3D BW_NSS_FWCONF_80_=
80(nss160);
>> +=A0=A0=A0 /* fall through */
>> +=A0=A0=A0 case MODE_11AC_VHT160:
>> +=A0=A0=A0=A0=A0=A0=A0 arg->peer_bw_rxnss_override |=3D BW_NSS_FWCONF_16=
0(nss160);
>> +=A0=A0=A0 break;
>> +=A0=A0=A0 default:
>> +=A0=A0=A0 break;
>> =A0=A0=A0=A0=A0 }
>> +
>> +=A0=A0=A0 ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vht peer %pM max_mpdu %d =

>> flags 0x%x peer_bw_rxnss_override 0x%x\n",
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sta->addr, arg->peer_max_mpdu, arg->peer=
_flags, =

>> arg->peer_bw_rxnss_override);
>> =A0 }
>>
>> =A0 static void ath10k_peer_assoc_h_qos(struct ath10k *ar,
>> @@ -2696,9 +2700,9 @@ static int ath10k_peer_assoc_prepare(struct =

>> ath10k *ar,
>> =A0=A0=A0=A0=A0 ath10k_peer_assoc_h_crypto(ar, vif, sta, arg);
>> =A0=A0=A0=A0=A0 ath10k_peer_assoc_h_rates(ar, vif, sta, arg);
>> =A0=A0=A0=A0=A0 ath10k_peer_assoc_h_ht(ar, vif, sta, arg);
>> +=A0=A0=A0 ath10k_peer_assoc_h_phymode(ar, vif, sta, arg);
>> =A0=A0=A0=A0=A0 ath10k_peer_assoc_h_vht(ar, vif, sta, arg);
>> =A0=A0=A0=A0=A0 ath10k_peer_assoc_h_qos(ar, vif, sta, arg);
>> -=A0=A0=A0 ath10k_peer_assoc_h_phymode(ar, vif, sta, arg);
>>
>> =A0=A0=A0=A0=A0 return 0;
>> =A0 }
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c =

>> b/drivers/net/wireless/ath/ath10k/wmi.c
>> index 2c36256a441d..3797dca317ff 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>> @@ -7211,12 +7211,7 @@ ath10k_wmi_peer_assoc_fill_10_4(struct ath10k =

>> *ar, void *buf,
>> =A0=A0=A0=A0=A0 struct wmi_10_4_peer_assoc_complete_cmd *cmd =3D buf;
>>
>> =A0=A0=A0=A0=A0 ath10k_wmi_peer_assoc_fill_10_2(ar, buf, arg);
>> -=A0=A0=A0 if (arg->peer_bw_rxnss_override)
>> -=A0=A0=A0=A0=A0=A0=A0 cmd->peer_bw_rxnss_override =3D
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __cpu_to_le32((arg->peer_bw_rxnss_ove=
rride - 1) |
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BIT(PEE=
R_BW_RXNSS_OVERRIDE_OFFSET));
>> -=A0=A0=A0 else
>> -=A0=A0=A0=A0=A0=A0=A0 cmd->peer_bw_rxnss_override =3D 0;
>> +=A0=A0=A0 cmd->peer_bw_rxnss_override =3D =

>> __cpu_to_le32(arg->peer_bw_rxnss_override);
>> =A0 }
>>
>> =A0 static int
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h =

>> b/drivers/net/wireless/ath/ath10k/wmi.h
>> index 46ae19bb2c92..1fe0aa5523a6 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
>> @@ -6380,7 +6380,19 @@ struct wmi_10_2_peer_assoc_complete_cmd {
>> =A0=A0=A0=A0=A0 __le32 info0; /* WMI_PEER_ASSOC_INFO0_ */
>> =A0 } __packed;
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
>> =A0 struct wmi_10_4_peer_assoc_complete_cmd {
>> =A0=A0=A0=A0=A0 struct wmi_10_2_peer_assoc_complete_cmd cmd;
>>
>
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
