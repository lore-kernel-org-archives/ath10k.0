Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBiZP-0007fC-T4
 for ath10k@lists.infradead.org; Thu, 26 Apr 2018 15:12:30 +0000
Subject: Re: [PATCH v1] ath10k: fix band_center_freq handling for VHT160 in
 recent firmwares
References: <20180426094357.24358-1-s.gottschall@dd-wrt.com>
 <19b8766e-d474-31d3-ff38-993498ee670d@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <da5c7c56-9a41-99f0-28be-3a2c8e9fabbf@dd-wrt.com>
Date: Thu, 26 Apr 2018 17:12:11 +0200
MIME-Version: 1.0
In-Reply-To: <19b8766e-d474-31d3-ff38-993498ee670d@candelatech.com>
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

Am 26.04.2018 um 15:44 schrieb Ben Greear:
>
>
> On 04/26/2018 02:43 AM, s.gottschall@dd-wrt.com wrote:
>> From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
>>
>> starting with firmware 10.4.3.4.x series QCA changed the handling of =

>> the channel property band_center_freq1 and band_center_freq2 in =

>> vht160 operation mode
>> likelly for backward compatiblity with vht80 only capable clients.
>> this patch adjusts the handling to get vht160 to work again with =

>> official qca firmwares newer than 3.3
>> consider that this patch will not work with older firmwares anymore. =

>> to avoid undefined behaviour this we disable vht160 capability for =

>> outdated firmwares
>
> We should be able to use a feature-flag or otherwise determine if the =

> firmware needs the old or new
> API and make the driver able to handle both.
the new firmware must be used as is and it works. the old firmware can =

be detected on the missing vht cap flag.
but thats not my task. i can only use feature flags if they are included =

within the qca firmwares. but they arent
the old pre 3.3 firmwares should be treated as obsolete. they are more =

than 2 years old and do not announce vht160 capability
even if it works with some ignorance, but on the other side the it has =

backward incompatiblies with older vht80 only clients.
this is why the new way was introduced
>
> Thanks,
> Ben
>
>> ---
>> =A0drivers/net/wireless/ath/ath10k/mac.c |=A0 7 -------
>> =A0drivers/net/wireless/ath/ath10k/wmi.c | 11 ++++++++---
>> =A02 files changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c =

>> b/drivers/net/wireless/ath/ath10k/mac.c
>> index 5be6386ede8f..d1239d40ac19 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -4449,13 +4449,6 @@ static struct ieee80211_sta_vht_cap =

>> ath10k_create_vht_cap(struct ath10k *ar)
>> =A0=A0=A0=A0=A0=A0=A0=A0 vht_cap.cap |=3D val;
>> =A0=A0=A0=A0 }
>>
>> -=A0=A0=A0 /* Currently the firmware seems to be buggy, don't enable 80+=
80
>> -=A0=A0=A0=A0 * mode until that's resolved.
>> -=A0=A0=A0=A0 */
>> -=A0=A0=A0 if ((ar->vht_cap_info & IEEE80211_VHT_CAP_SHORT_GI_160) &&
>> -=A0=A0=A0=A0=A0=A0=A0 (ar->vht_cap_info & IEEE80211_VHT_CAP_SUPP_CHAN_W=
IDTH_MASK) =

>> =3D=3D 0)
>> -=A0=A0=A0=A0=A0=A0=A0 vht_cap.cap |=3D IEEE80211_VHT_CAP_SUPP_CHAN_WIDT=
H_160MHZ;
>> -
>> =A0=A0=A0=A0 mcs_map =3D 0;
>> =A0=A0=A0=A0 for (i =3D 0; i < 8; i++) {
>> =A0=A0=A0=A0=A0=A0=A0=A0 if ((i < ar->num_rf_chains) && (ar->cfg_tx_chai=
nmask & BIT(i)))
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c =

>> b/drivers/net/wireless/ath/ath10k/wmi.c
>> index 2c36256a441d..d78b8857a513 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>> @@ -1671,13 +1671,18 @@ void ath10k_wmi_put_wmi_channel(struct =

>> wmi_channel *ch,
>> =A0=A0=A0=A0=A0=A0=A0=A0 flags |=3D WMI_CHAN_FLAG_HT40_PLUS;
>> =A0=A0=A0=A0 if (arg->chan_radar)
>> =A0=A0=A0=A0=A0=A0=A0=A0 flags |=3D WMI_CHAN_FLAG_DFS;
>> -
>> +=A0=A0=A0 ch->band_center_freq2 =3D 0;
>> =A0=A0=A0=A0 ch->mhz =3D __cpu_to_le32(arg->freq);
>> =A0=A0=A0=A0 ch->band_center_freq1 =3D __cpu_to_le32(arg->band_center_fr=
eq1);
>> =A0=A0=A0=A0 if (arg->mode =3D=3D MODE_11AC_VHT80_80)
>> =A0=A0=A0=A0=A0=A0=A0=A0 ch->band_center_freq2 =3D __cpu_to_le32(arg->ba=
nd_center_freq2);
>> -=A0=A0=A0 else
>> -=A0=A0=A0=A0=A0=A0=A0 ch->band_center_freq2 =3D 0;
>> +=A0=A0=A0 if (arg->mode =3D=3D MODE_11AC_VHT160)=A0 {
>> +=A0=A0=A0=A0=A0=A0=A0 if (arg->freq < arg->band_center_freq1)
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ch->band_center_freq1 =3D =

>> __cpu_to_le32(arg->band_center_freq1 - 40);
>> +=A0=A0=A0=A0=A0=A0=A0 else
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ch->band_center_freq1 =3D =

>> __cpu_to_le32(arg->band_center_freq1 + 40);
>> +=A0=A0=A0=A0=A0=A0=A0 ch->band_center_freq2 =3D __cpu_to_le32(arg->band=
_center_freq1);
>> +=A0=A0=A0 }
>> =A0=A0=A0=A0 ch->min_power =3D arg->min_power;
>> =A0=A0=A0=A0 ch->max_power =3D arg->max_power;
>> =A0=A0=A0=A0 ch->reg_power =3D arg->max_reg_power;
>>
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
