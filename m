Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7mrk-0001ru-HM
 for ath10k@lists.infradead.org; Fri, 18 Nov 2016 17:22:21 +0000
Subject: Re: Linux freezes after a time while running
References: <1403930336.4012.1477681558487@office.mailbox.org>
 <CA+BoTQmbz1vHjn0Xbo2hKcb9v8MdN5uTEnVNOAK0Kfh_NwTp5w@mail.gmail.com>
 <ema51f2924-a0bb-4f7a-8d84-3ee6fb82e317@valkyrie>
 <CA+BoTQkyd2f78Pk=_FrYyuQXedn8t6EEYq6BWHB8zthOF_AZ6w@mail.gmail.com>
 <1233772075.6396.1478077219620@office.mailbox.org>
 <CA+BoTQnOGOAEvM=M-1TqaN3GPgSJ2CUX-6Upa38jmaRzW9JkGA@mail.gmail.com>
 <1204267275.1178.1478525905172@office.mailbox.org>
 <CA+BoTQniCnXce6-w9SPp_aiuei8bjfbVJSkvXi_p4ew_Ed4Qdg@mail.gmail.com>
 <em6522b3b0-023a-4914-bdd1-d5f8734f6c75@valkyrie>
 <CA+BoTQ=TMHfHJOAuystH_K-Uu7nP-t9BZhL6MpjHstU1QBe52g@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <e991fa3d-56dc-b290-201f-a80b61720a52@candelatech.com>
Date: Fri, 18 Nov 2016 09:21:34 -0800
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=TMHfHJOAuystH_K-Uu7nP-t9BZhL6MpjHstU1QBe52g@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>, Conrad Kostecki <ck+ath10k@bl4ckb0x.de>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 11/18/2016 06:47 AM, Michal Kazior wrote:
> On 16 November 2016 at 23:21, Conrad Kostecki <ck+ath10k@bl4ckb0x.de> wrote:
>> Hello Michal,
>>
>> Am 07.11.2016 17:43:02, "Michal Kazior" <michal.kazior@tieto.com> schrieb:
>>
>>>
>>> I assume you used a different kernel in the past compared to the
>>> recent test you did. You could try re-testing the older kernel
>>> (assuming you remember which one it was) and if it works you could
>>> bisect your way to find the commit that breaks it for you.
>>>
>>>
>> I don't have the older kernel config anymore, but it was pretty the same, as
>> my current one.
>> I've now done some tests and it's quite interesseting. Kernelversion did not
>> matter for me.
>>
>> Running with current firmware-5.bin, it's always crashing. I tried different
>> BIOS options, nothing helped.
>>
>> BUT: Downgrade to firmware-2.bin helps.
>> ath10k_pci 0000:03:00.0: firmware ver 10.1.467.3-1 api 2 features wmi-10.x,
>> has-wmi-mgmt-tx,no-p2p crc32 2c3ffc2f
>>
>> Running such old firmware, the Wifi just runs stable. NO firmware crash
>> happens. When I just change firmware back to firmware-5.bin, it crashes
>> again.
>> So there seems to changed something. Can be this debugged somehow?
>>
>> With firmware-2.bin, I am also getting such errors, but WiFi works fine:
>> [   82.504901] ath10k_pci 0000:03:00.0: SWBA overrun on vdev 0, skipped old
>> beacon
>> [   82.556103] ath10k_pci 0000:03:00.0: SWBA overrun on vdev 1, skipped old
>> beacon
>> [   87.113085] ath10k_warn: 89 callbacks suppressed
>>
>> Currently, the workaround is for me firmware-2.bin, but IMHO it's not a
>> solution..
>> Any Ideas?
>
> Hmm.. looks like there's a stall in target-host communication for ~5
> seconds (89 suppressed warnings match 2 vifs beaconing at ~100ms
> interval).
>
> Did you try running without multi-BSS, i.e. just one AP vif? That's
> probably not going to help but it's worth ruling that out.

While backporting some 10.2 code into my 10.1 tree, I found a change to
the CE logic in the firmware that appeared to cause hangs in our longer
duration runs.

I'll trade a hint of how to possibly fix this for a hint of how to fix
the warm-start/cold-start bug that is evidently fixed in 10.2 upstream firmware :)

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
