Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XOqZ9-0007Ya-JP
 for ath10k@lists.infradead.org; Tue, 02 Sep 2014 16:04:20 +0000
Message-ID: <5405EA6D.2040803@candelatech.com>
Date: Tue, 02 Sep 2014 09:03:57 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5] ath10k: save firmware debug log messages.
References: <1409239441-4878-1-git-send-email-greearb@candelatech.com>
 <8738cam9by.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQk2CkmaZtZQ9iQyqU_9K3E_TYwetGNbsKpxYjbUvdL43g@mail.gmail.com>
 <87y4u2ksl1.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87y4u2ksl1.fsf@kamboji.qca.qualcomm.com>
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
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/02/2014 07:25 AM, Kalle Valo wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
> 
>> On 2 September 2014 15:38, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>> (Dropping linux-wireless)
>>>
>>> greearb@candelatech.com writes:
>>>
>>>> From: Ben Greear <greearb@candelatech.com>
>>>>
>>>> They may be dumped through the firmware dump debugfs
>>>> file.
>>>>
>>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>>>
>>> Before I start looking at this in detail: this looks fragile and
>>> complicated from ath10k point of view. Why not just take a dump of the
>>> whole firmware memory and postprocess this, with whatever else we might
>>> need from the firmware? That's a lot easier to maintain.
>>
>> I like the idea although it still makes sense to keep some sort of a
>> circular buffer for the debug mesg events delivered via wmi, does it
>> not?
> 
> How would ath10k use those stored debug mesg events? Attach them to the
> firmare crash dump file? Or did you have something else in mind?

It can log them to /var/log/messages as hex for ongoing firmware logging.
It can allow dumping snapshots through debugfs for similar reasons.
Using the above, it can allow firmware devs to insert the equivalent of printf in their
firmware around crash sites and get some debug info in the logs to
aid debugging firmware crashes or other strange things w/out having
a serial console attached to the ath10k NIC.  That is how I debug and fix
crashes in firmware that are not obvious from the initial dump.
Surely your firmware guys could use similar tools.

You have no guarantee when debug log messages are delivered to the host,
so without storing them as received from the target, you may not have anything
useful to dump/decode at crash time.

> But most importantly, would that be useful? Does the firmware send debug
> events now? Or would it require the user to change the firmware log
> level through fw_dbglog debugfs file before the crash?

Standard firmware sends some info with un-modifed ath10k driver,
and modified firmware can provide much more as needed.  There is
no need to twiddle firmware debug log levels for basic use, though
that may give added benefit in some cases.

> I want to avoid a situation where we have to maintain a feature which
> nobody uses.

Anyone that cares about fixing firmware bugs and making the firmware
stable can make good use of this feature.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
