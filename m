Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIGHu-00089E-Ra
 for ath10k@lists.infradead.org; Wed, 29 Jun 2016 14:16:25 +0000
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
Date: Wed, 29 Jun 2016 16:10:34 +0200
MIME-Version: 1.0
In-Reply-To: <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
Subject: Re: [PATCH] ath10k: fix system hang at qca99x0 probe on x86 platform
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
To: ath10k@lists.infradead.org, rmanohar@qti.qualcomm.com, Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@qca.qualcomm.com>

by the way. 512 works


Am 29.06.2016 um 16:04 schrieb Sebastian Gottschall:
> this fix will crash QCA9980 on QCA IPQ8064 cpu based systems.
> so please rework it, or leave it out.
> note:
> maybe the limit of 256kb is too low for that card
>
>
>    10.102047] ath10k_pci 0000:01:00.0: unable to read from the device
> [   10.102075] ath10k_pci 0000:01:00.0: could not execute otp for =

> board id check: -110
> [   10.107116] ath10k_pci 0000:01:00.0: failed to get board id from =

> otp: -110
> [   10.126517] ath10k_pci 0000:01:00.0: failed to fetch board data for =

> bus=3Dpci,vendor=3D168c,device=3D0040,subsystem-vendor=3D168c,subsystem-d=
evice=3D0002 =

> from ath10k/QCA99X0/hw2.0/board-2.bin
> [   10.126697] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A =

> crc32 62700264
> [   11.518268] ath10k_pci 0000:01:00.0: firmware crashed! (uuid =

> 7173fc19-f807-4345-906a-9f3d17fb751b)
> [   11.518307] ath10k_pci 0000:01:00.0: qca99x0 hw2.0 target =

> 0x01000000 chip_id 0x003b01ff sub 168c:0002
> [   11.526123] ath10k_pci 0000:01:00.0: kconfig debug 1 debugfs 1 =

> tracing 0 dfs 0 testmode 0
> [   11.536976] ath10k_pci 0000:01:00.0: firmware ver 10.4.1.00030-1 =

> api 5 features no-p2p crc32 d2901e01
> [   11.543610] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A =

> crc32 62700264
> [   11.552770] ath10k_pci 0000:01:00.0: htt-ver 0.0 wmi-op 6 htt-op 4 =

> cal file max-sta 512 raw 0 hwcrypto 1
> [   11.561910] ath10k_pci 0000:01:00.0: firmware register dump:
> [   11.569606] ath10k_pci 0000:01:00.0: [00]: 0x01000000 0x000015B3 =

> 0x000D89A5 0x00955B31
> [   11.575252] ath10k_pci 0000:01:00.0: [04]: 0x000D89A5 0x00060730 =

> 0x0000000C 0x00000000
> [   11.582978] ath10k_pci 0000:01:00.0: [08]: 0x00000010 0x0000000D =

> 0x000E8A64 0xFFFFC000
> [   11.590876] ath10k_pci 0000:01:00.0: [12]: 0x00000009 0x00000000 =

> 0x000D89BC 0x000D8A03
> [   11.598846] ath10k_pci 0000:01:00.0: [16]: 0x00953438 0x000D89BE =

> 0x00000000 0x00000000
> [   11.606676] ath10k_pci 0000:01:00.0: [20]: 0x400D89A5 0x0040655C =

> 0x00413A84 0x00000005
> [   11.614574] ath10k_pci 0000:01:00.0: [24]: 0x809CDC6E 0x004065BC =

> 0x00417450 0xC00D89A5
> [   11.622473] ath10k_pci 0000:01:00.0: [28]: 0x8098011C 0x0040660C =

> 0x004179D8 0x0000000D
> [   11.630372] ath10k_pci 0000:01:00.0: [32]: 0x809CDE70 0x0040662C =

> 0x004179D8 0x0000000D
> [   11.638272] ath10k_pci 0000:01:00.0: [36]: 0x80981786 0x0040665C =

> 0x004179D8 0x00000020
> [   11.646171] ath10k_pci 0000:01:00.0: [40]: 0x809CE0F7 0x0040667C =

> 0x00000000 0x0000A000
> [   11.654070] ath10k_pci 0000:01:00.0: [44]: 0x809B307A 0x004066AC =

> 0x00981768 0x0042028C
> [   11.661970] ath10k_pci 0000:01:00.0: [48]: 0x809AF3DA 0x004066FC =

> 0x00000002 0x0042028C
> [   11.669869] ath10k_pci 0000:01:00.0: [52]: 0x809AEB02 0x0040672C =

> 0x00406750 0x0041847C
> [   11.677768] ath10k_pci 0000:01:00.0: [56]: 0x8094EAAA 0x0040674C =

> 0x000E89AC 0x00000001
>
> Sebastian
>
>
> Am 14.06.2016 um 08:17 schrieb Rajkumar Manoharan:
>> commit b057886524be ("ath10k: do not use coherent memory for allocated
>> device memory chunks") replaced coherent memory allocation for memory
>> chunks to fix low memory platforms. Unfortunately this is causing system
>> freeze on x86 platform while bringing up qca99x0 device. The system
>> hangs while DMA mapping bigger memory chunks (689816/865444 bytes). Fix
>> this by limiting maximum memory chunk size to 256 KiB per request.
>>
>> Cc: Felix Fietkau <nbd@nbd.name>
>> Fixes: b057886524be ("ath10k: do not use coherent memory for =

>> allocated device memory chunks")
>> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/wmi.c | 6 ++++++
>>   drivers/net/wireless/ath/ath10k/wmi.h | 1 +
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c =

>> b/drivers/net/wireless/ath/ath10k/wmi.c
>> index 6279ab4a760e..7c15f65fe5ed 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>> @@ -4411,6 +4411,12 @@ static int ath10k_wmi_alloc_chunk(struct =

>> ath10k *ar, u32 req_id,
>>           if (!pool_size)
>>               return -EINVAL;
>>   +        if (pool_size > WMI_MAX_MEM_CHUNK_SIZE) {
>> +            num_units =3D WMI_MAX_MEM_CHUNK_SIZE /
>> +                    round_up(unit_len, 4);
>> +            pool_size =3D num_units * round_up(unit_len, 4);
>> +        }
>> +
>>           vaddr =3D kzalloc(pool_size, GFP_KERNEL | __GFP_NOWARN);
>>           if (!vaddr)
>>               num_units /=3D 2;
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h =

>> b/drivers/net/wireless/ath/ath10k/wmi.h
>> index 90f594e89f94..dea1f235a54d 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
>> @@ -6184,6 +6184,7 @@ struct wmi_roam_ev {
>>   #define ATH10K_DEFAULT_ATIM 0
>>     #define WMI_MAX_MEM_REQS 16
>> +#define WMI_MAX_MEM_CHUNK_SIZE (256 * 1024) /* 256 KB */
>>     struct wmi_scan_ev_arg {
>>       __le32 event_type; /* %WMI_SCAN_EVENT_ */
>
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
