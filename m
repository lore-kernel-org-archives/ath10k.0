Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bQsz7-0007sE-7d
 for ath10k@lists.infradead.org; Sat, 23 Jul 2016 09:12:38 +0000
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <5792A189.5050807@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <6495e664-5da8-a11b-0bd5-15dc24c51edf@dd-wrt.com>
Date: Sat, 23 Jul 2016 11:11:59 +0200
MIME-Version: 1.0
In-Reply-To: <5792A189.5050807@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, rmanohar@codeaurora.org, Felix Fietkau <nbd@nbd.name>

from my point of view this patch is just shit. it trunkates the maximum =

allocated memory to a certain value.
so firmware requests 800 kb memory but just gets 256kb. so out of bound =

memory access is guaranteed at all.


Am 23.07.2016 um 00:43 schrieb Ben Greear:
> On 06/13/2016 11:17 PM, Rajkumar Manoharan wrote:
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
>>
>> +        if (pool_size > WMI_MAX_MEM_CHUNK_SIZE) {
>> +            num_units =3D WMI_MAX_MEM_CHUNK_SIZE /
>> +                    round_up(unit_len, 4);
>> +            pool_size =3D num_units * round_up(unit_len, 4);
>> +        }
>
> I started testing my 9980 x86-64 system with VT/d enabled today.
> With this patch in my tree, it crashes on bootup (with my firmware).
> Works fine without this patch.
>
> I don't see the exact place it is crashing in the firmware, though I =

> could
> probably narrow it down with some effort.  It is in the early startup =

> code,
> at least, which makes debugging more difficult.
>
> This patch works fine with a slightly newer firmware compiled for =

> 9984.  That
> same firmware compiled for 9980 crashes, but I am not certain it is =

> the same issue
> as the older 9980.  It appears similar, at least.
>
> Looks to me like there are lots of variances in how firmware and chip =

> revisions
> deal with this particular code, so we are going to have to test on =

> lots of chips
> and platforms to know if a 'fix' is really a fix or not.
>
> Thanks,
> Ben
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
