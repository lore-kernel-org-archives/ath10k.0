Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wji6I-0004Z1-RP
 for ath10k@lists.infradead.org; Mon, 12 May 2014 04:44:31 +0000
Message-ID: <53705196.8070708@candelatech.com>
Date: Sun, 11 May 2014 21:44:06 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Running throughput tests
References: <00ea01cee403$5331f1e0$f995d5a0$@sparklan.com>	<007f01cefa41$8a940de0$9fbc29a0$@sparklan.com>	<52AEE61F.5030505@intec.ugent.be>	<006b01cefacb$6c0b2d60$44218820$@sparklan.com>	<52B00B10.3050300@intec.ugent.be>	<004b01cefb9d$04a543e0$0defcba0$@sparklan.com>	<52B2AE75.9050206@intec.ugent.be>	<00df01cf0090$05944f10$10bced30$@sparklan.com>	<52B9672E.9000701@intec.ugent.be>	<008c01cf012e$e59563d0$b0c02b70$@sparklan.com>	<530A64E5.2040401@intec.ugent.be>
 <530B0670.1010009@stackframe.org>	<530E5EF2.8070800@intec.ugent.be>	<87y50weecb.fsf_-_@kamboji.qca.qualcomm.com>	<5335910B.3000702@intec.ugent.be>	<87y4zutk4i.fsf@kamboji.qca.qualcomm.com>	<53372210.7060903@intec.ugent.be>	<871tx8m1qs.fsf@kamboji.qca.qualcomm.com>	<5352D327.7060106@intec.ugent.be>	<87lhuvmdjy.fsf@kamboji.qca.qualcomm.com>	<535F22C0.9000403@candelatech.com>
 <8761lbk3yo.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <8761lbk3yo.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Bart.Jooris@intec.ugent.be, ath10k@lists.infradead.org



On 05/11/2014 09:37 PM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 04/23/2014 11:44 PM, Kalle Valo wrote:
>>> Bart Jooris <bart.jooris@gmail.com> writes:
>>>
>>>> I also have a stable 500Mbps ++ link now :-) with peaks up to 520Mbps
>>>> (measured with iperf UDP).
>>>> I've  made a second AP and STA with the WLE900VX cards I've exchanged
>>>> with Ben (Thanks again!).
>>>
>>> Good!
>>>
>>>> p.s. The configuration with the sparkLAN WPEA-351AC cards still
>>>> doesn't give the same results. Probably my bad, I will double check it
>>>> again.
>>>
>>> This is CUS223 based design, right? If you see the problem still try to
>>> get debug logs. For example, debug_mask=0x432 might give some hints.
>>>
>>
>> We tried with the Sparklan today, and it locks up the system soon after we
>> start hostapd, so we just removed it from the system.  The WLE900VX in same
>> machine and same config works fine.
>
> Odd. From the website[1] it looks like a normal CUS233 to me. Can you
> get any more info? For example, where does it exactly lock up? Enabling
> also all kernel debugging (lock debugging etc) might be also useful.

Seems like the bad old days when we saw lots of total host lockups on
cold resets, etc.  I didn't see anything useful in the logs, and I was
running lockdep enabled kernel.

Since WLE900VX works for me, I've little interest in hacking on the
Sparklan NIC.  Possibly it's just a bad beta hardware or something like that.

If you have trouble getting a hold of this NIC, I'll be happy to mail
it to you.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
