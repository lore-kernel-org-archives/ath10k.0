Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fafbH-0007Fr-DZ
 for ath10k@lists.infradead.org; Wed, 04 Jul 2018 11:05:33 +0000
Subject: Re: [PATCH v8] ath10k: fix crash in recent 3.5.3 9984 firmware due
 wrong handling of peer_bw_rxnss_override parameter
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
References: <20180704092953.32572-1-s.gottschall@dd-wrt.com>
 <5630152.jDWN9V3RzB@bentobox>
 <0cff058a-3c4b-6617-a034-3df706ba3a32@dd-wrt.com>
Message-ID: <72adf98f-94bc-27c7-4156-84072ba6aa28@dd-wrt.com>
Date: Wed, 4 Jul 2018 13:05:20 +0200
MIME-Version: 1.0
In-Reply-To: <0cff058a-3c4b-6617-a034-3df706ba3a32@dd-wrt.com>
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: linux-wireless@vger.kernel.org, kvalo@codeaurora.org, ath10k@lists.infradead.org

the values within the patch are named

#define BW_NSS_FWCONF_MAP_ENABLE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BIT(31)
#define BW_NSS_FWCONF_MAP_160MHZ_S=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (0)
#define BW_NSS_FWCONF_MAP_160MHZ_M=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (0x0000000=
7)
#define BW_NSS_FWCONF_MAP_80_80MHZ_S=A0=A0=A0=A0=A0=A0=A0=A0 (3)
#define BW_NSS_FWCONF_MAP_80_80MHZ_M=A0=A0=A0=A0=A0=A0=A0=A0 (0x00000038)
#define BW_NSS_FWCONF_MAP_M=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 (0x0000003F)


so your comment doesnt seem to belong to the patch. maybe the openwrt =

guys renamed some values in the patch. my one is based on my original =

sources


Am 04.07.2018 um 12:48 schrieb Sebastian Gottschall:
>
>
> Am 04.07.2018 um 12:40 schrieb Sven Eckelmann:
>> On Mittwoch, 4. Juli 2018 11:29:53 CEST s.gottschall@dd-wrt.com wrote:
>>> +/* Values defined to set 160 MHz Bandwidth NSS Mapping into FW*/
>>> +#define BW_NSS_FWCONF_160(x) (BW_NSS_FWCONF_MAP_ENABLE | \
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (((x - 1) << =

>>> BW_NSS_FWCONF_MAP_160MHZ_S) \
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 & BW_NSS_FWCONF_MAP_160MHZ_M))
>>> +#define BW_NSS_FWCONF_80_80(x) (BW_NSS_FWCONF_MAP_ENABLE | \
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (((x - 1) << =

>>> BW_NSS_FWCONF_MAP_80_80MHZ_S) \
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 & =

>>> BW_NSS_FWCONF_MAP_80_80MHZ_M))
>> Please check the shift and mask macros in core.h
>>
>>
>> #define BW_NSS_FWCONF_MAP_160MHZ_LSB=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0
>> #define BW_NSS_FWCONF_MAP_160MHZ_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x00000=
007
>> #define BW_NSS_FWCONF_MAP_80_80MHZ_LSB=A0=A0=A0=A0=A0=A0=A0=A0 3
>> #define BW_NSS_FWCONF_MAP_80_80MHZ_MASK=A0=A0=A0=A0=A0=A0=A0 0x00000038
>> #define BW_NSS_FWCONF_MAP_MASK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x0000003F
>>
>> #define GET_BW_NSS_FWCONF_160(x)=A0=A0=A0=A0 (MS((x), =

>> BW_NSS_FWCONF_MAP_160MHZ) + 1)
>> #define GET_BW_NSS_FWCONF_80_80(x)=A0=A0 (MS((x), =

>> BW_NSS_FWCONF_MAP_80_80MHZ_M) + 1)
>>
>> /* Values defined to set 160 MHz Bandwidth NSS Mapping into FW*/
>> #define BW_NSS_FWCONF_160(x)=A0=A0=A0=A0=A0=A0=A0=A0 (BW_NSS_FWCONF_MAP_=
ENABLE | \
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (SM((x) - 1, =

>> BW_NSS_FWCONF_MAP_160MHZ))
>> #define BW_NSS_FWCONF_80_80(x)=A0=A0=A0=A0=A0=A0 (BW_NSS_FWCONF_MAP_ENAB=
LE | \
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (SM((x) - 1, =

>> BW_NSS_FWCONF_MAP_80_80MHZ))
>>
>> (these snippets were not yet tested and most likely need further =

>> adjustments)
>>
>>
>> Kind regards,
>> =A0=A0=A0=A0Sven
> can you explain your request? the macros are unchanged and just =

> reformated for maximum line length restriction. the values have been =

> taken from QCA's wmi header
>
> Sebastian
>
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
