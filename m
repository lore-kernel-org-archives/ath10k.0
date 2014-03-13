Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-x230.google.com ([2607:f8b0:400d:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WO9Ww-00006k-KC
 for ath10k@lists.infradead.org; Thu, 13 Mar 2014 17:34:55 +0000
Received: by mail-qc0-f176.google.com with SMTP id m20so1529520qcx.21
 for <ath10k@lists.infradead.org>; Thu, 13 Mar 2014 10:34:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87y50ed6rl.fsf@kamboji.qca.qualcomm.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 <871ty9jijp.fsf@kamboji.qca.qualcomm.com>
 <531F5D6F.6060801@candelatech.com>
 <87pplrg71t.fsf@kamboji.qca.qualcomm.com>
 <532084C3.8060904@candelatech.com>
 <CAHqTa-01MAbTh4ekq8+u-uG_cH=o9SCkpC-fWuMfsPDmfAMCow@mail.gmail.com>
 <87y50ed6rl.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 13 Mar 2014 10:34:26 -0700
Message-ID: <CAJ-VmonGzsdw7WT79jYNU-CtUodza3xpQXsiheC9WyTTRxfsFg@mail.gmail.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

I think the CUS223 has higher transmit power, right?


-a


On 12 March 2014 22:09, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Avery Pennarun <apenwarr@gmail.com> writes:
>
>> On Wed, Mar 12, 2014 at 11:01 AM, Ben Greear <greearb@candelatech.com> wrote:
>>> Come to think of it, I'm not sure I've seen a hard lockup of the machine
>>> on non CUS223 machines, but I have seen cases where non CUS223 NIC wedges
>>> and the existing restart does not recover it.
>>>
>>> This requires a reboot to recover from.
>>
>> That's not so surprising; the current driver doesn't do the cold reset
>> that is the only thing you can recover from a wedge, I guess because
>> of the CUS223 bug.
>>
>> Stupid question: can I honestly just buy a different module and make
>> my PCIe crashiness problems go away?
>
> That's my theory, but I would like to confirm that somehow.
>
>> Is there a reason do prefer the CUS223?
>
> Good question, I haven't figured out that. CUS223 board is physically
> larger than XB140, for example, and I would assume there's a reason for
> that.
>
>> Another question: is there perhaps anything the firmware can do to eg.
>> set a watchdog timer, so that the internal CPU will restart (go back
>> to "waiting for firmware" mode) if it doesn't answer for a while?  The
>> idea would be for the device to un-wedge itself even if there's
>> nothing we can do to fix it from outside.
>
> That's something a firmware engineer should comment on, which I'm not.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
