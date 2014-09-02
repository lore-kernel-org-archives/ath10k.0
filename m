Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XOp1g-0006x7-4B
 for ath10k@lists.infradead.org; Tue, 02 Sep 2014 14:25:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v5] ath10k: save firmware debug log messages.
References: <1409239441-4878-1-git-send-email-greearb@candelatech.com>
 <8738cam9by.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQk2CkmaZtZQ9iQyqU_9K3E_TYwetGNbsKpxYjbUvdL43g@mail.gmail.com>
Date: Tue, 2 Sep 2014 17:25:14 +0300
In-Reply-To: <CA+BoTQk2CkmaZtZQ9iQyqU_9K3E_TYwetGNbsKpxYjbUvdL43g@mail.gmail.com>
 (Michal Kazior's message of "Tue, 2 Sep 2014 15:51:58 +0200")
Message-ID: <87y4u2ksl1.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 2 September 2014 15:38, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> (Dropping linux-wireless)
>>
>> greearb@candelatech.com writes:
>>
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>>> They may be dumped through the firmware dump debugfs
>>> file.
>>>
>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>>
>> Before I start looking at this in detail: this looks fragile and
>> complicated from ath10k point of view. Why not just take a dump of the
>> whole firmware memory and postprocess this, with whatever else we might
>> need from the firmware? That's a lot easier to maintain.
>
> I like the idea although it still makes sense to keep some sort of a
> circular buffer for the debug mesg events delivered via wmi, does it
> not?

How would ath10k use those stored debug mesg events? Attach them to the
firmare crash dump file? Or did you have something else in mind?

But most importantly, would that be useful? Does the firmware send debug
events now? Or would it require the user to change the firmware log
level through fw_dbglog debugfs file before the crash?

I want to avoid a situation where we have to maintain a feature which
nobody uses.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
