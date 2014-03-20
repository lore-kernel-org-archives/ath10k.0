Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-x236.google.com ([2607:f8b0:400d:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQiTo-0004iq-98
 for ath10k@lists.infradead.org; Thu, 20 Mar 2014 19:18:17 +0000
Received: by mail-qc0-f182.google.com with SMTP id e16so1607475qcx.13
 for <ath10k@lists.infradead.org>; Thu, 20 Mar 2014 12:17:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <532B104A.7060302@candelatech.com>
References: <5329CD60.6080609@candelatech.com>
 <87txatfkad.fsf@kamboji.qca.qualcomm.com>
 <532B104A.7060302@candelatech.com>
Date: Thu, 20 Mar 2014 12:17:54 -0700
Message-ID: <CAJ-VmokQXgWa1Pi-YBXM1NPfZDF8F=yvWh1w4DTgpJcEq_JfxQ@mail.gmail.com>
Subject: Re: Trouble connecting to broadcom AC APs?
From: Adrian Chadd <adrian@freebsd.org>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k <ath10k@lists.infradead.org>

Did the per-rate transmit statistics ever make it into the firmware / driver?

I'd start by looking at what rate(s) it's trying and what the transmit
completion statistics say. It could be doing something exceedingly
dumb like transmitting on an invalid rate or stream setup.

Same deal with STBC/LDPC. Try disabling those; see what happens.



-a


On 20 March 2014 08:59, Ben Greear <greearb@candelatech.com> wrote:
> On 03/19/2014 11:36 PM, Kalle Valo wrote:
>> Ben Greear <greearb@candelatech.com> writes:
>>
>>> We are seeing various funny things when trying to connect
>>> ath10k stations to commercial APs with broadcom AC NICs.
>>>
>>> It sort of works sometimes, but we often see failure to
>>> acquire DHCP lease in a timely manner, etc.
>>
>> So it's a problem with broadcast frames? With or without encryption? Did
>> you try disabling power save?
>
> With and without encryption we see issues.  I am disabling power-save,
> but from poking around in firmware, I'm not sure how much affect that
> has.
>
> I'm using commands like this to disable it:
> ./local/sbin/iw dev sta219 set power_save off
>
>>> Similar testing on APs using QCA AC NICs appears to work
>>> much better.
>>>
>>> Our problems could be most anything, including the fact that this
>>> testing is done on our modified firmware, but I am curious if anyone
>>> else seems any similar issues?
>>
>> Occasionally I test connecting to D-Link DIR-865L in STA mode. But I
>> just do just simple ping tests and with manual IPs.
>
> We'll keep poking at things and see if we can find any
> pattern or work around.
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
