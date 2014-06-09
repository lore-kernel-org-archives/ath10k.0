Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wu1nk-0003pn-Je
 for ath10k@lists.infradead.org; Mon, 09 Jun 2014 15:48:01 +0000
Message-ID: <5395D718.4090704@candelatech.com>
Date: Mon, 09 Jun 2014 08:47:36 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>	<87wqczz3h9.fsf@kamboji.qca.qualcomm.com>	<538CA904.4000508@candelatech.com>	<87ioojz1b1.fsf@kamboji.qca.qualcomm.com>	<538CB782.1000509@candelatech.com>
 <538CC68C.10808@gmail.com>	<538CC949.5020901@candelatech.com>	<CANUX_P2vbKD3zkwE=DvJJWpo=gEMORCBy=XFoC2YSFpmg9sr_A@mail.gmail.com>	<538CD507.1050803@candelatech.com>	<87bnu7pqe2.fsf@kamboji.qca.qualcomm.com>	<53909372.1040707@candelatech.com>	<87fvjimsxj.fsf@kamboji.qca.qualcomm.com>	<5391E620.4090706@candelatech.com>	<87vbscj2ho.fsf@kamboji.qca.qualcomm.com>	<53932F52.2030203@candelatech.com>	<8738ffiysv.fsf@kamboji.qca.qualcomm.com>	<539483B1.5020401@candelatech.com>
 <87ppiih4zk.fsf@kamboji.qca.qualcomm.com> <5395CE36.30407@candelatech.com>
In-Reply-To: <5395CE36.30407@candelatech.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Emmanuel Grumbach <egrumbach@gmail.com>

On 06/09/2014 08:09 AM, Ben Greear wrote:
> 
> 
> On 06/09/2014 01:17 AM, Kalle Valo wrote:
>> Ben Greear <greearb@candelatech.com> writes:
>>
>>>>> With time-of-day, time-since-boot, and MAC, each dump should be unique.
>>>>
>>>> But I would like to easily match from kernel log that the crash dump
>>>> matches with log. uuid would provide that in a simple way (check that
>>>> the uuid in the log matches with the uuid in the dump). What's so bad
>>>> from using uuid?
>>>
>>> Just tell me how you want me to create the uuid and I'll do so.
>>
>> As kbuild found some compilation problems, I think it would be easier if
>> I make the final changes to your patches and send that for review. Would
>> that be ok for you?
> 
> Yes, that would be great.

In case it helps, let me post my latest patches...will get those up
in an hour or two.

Thanks,
Ben

> 
> I think we can continue to tweak the header format for a bit,
> as I haven't updated the decode tool to deal with the new binary blob
> anyway, and the version field gives us an out if we need to make
> more serious changes.
> 
> Thanks,
> Ben
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
