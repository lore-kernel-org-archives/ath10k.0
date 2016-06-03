Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b8rok-0007nS-AP
 for ath10k@lists.infradead.org; Fri, 03 Jun 2016 16:19:27 +0000
Subject: Re: Bug 119151 - [regression] ath10k no longer authenitcates and
 freezes system
References: <8760trzoiw.fsf@kamboji.qca.qualcomm.com>
 <871t4fzn1x.fsf@kamboji.qca.qualcomm.com> <57504F05.3040200@candelatech.com>
 <87k2i7y5m2.fsf@kamboji.qca.qualcomm.com> <57505179.8090509@candelatech.com>
 <871t4ew9r1.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5751AC89.6050607@candelatech.com>
Date: Fri, 3 Jun 2016 09:12:57 -0700
MIME-Version: 1.0
In-Reply-To: <871t4ew9r1.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "mike@fireburn.co.uk" <mike@fireburn.co.uk>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 06/03/2016 08:52 AM, Valo, Kalle wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 06/02/2016 08:26 AM, Valo, Kalle wrote:
>>> Ben Greear <greearb@candelatech.com> writes:
>>>
>>>> I found a lot of problems with this code as well, and the 5 patches
>>>> starting from the URL below fixed the issues for me.
>>>>
>>>> They are stuck as 'NA' in patchwork, but I don't know why.
>>>>
>>>> http://lists.infradead.org/pipermail/ath10k/2016-April/007218.html
>>>
>>> ath10k has a separate patchwork instance, did you look at the correct
>>> one? I have quite a lot of patches from you in deferred state because of
>>> the patch bomb, but I'm hoping to go through them soon.
>>>
>>> https://patchwork.kernel.org/project/ath10k/list/?state=10&delegate=25621&order=date
>>
>> Ok, they are deferred then.
>>
>> The series of 5 is likely quite useful and fixes some nasty bugs,
>> and the first patch of the big bomb is also a trivial crash fix
>> for a regression you added (as best as I can tell).
>>
>> The rest of the patch bomb is less critical, but making some progress on
>> that would make me feel good about working on ath10k patches again.
>
> If I get a big patchset like 25 patches it immediately goes to the
> bottom of the queue. Organising them a bit better takes like 15 minutes
> of your time and makes it a lot easier to review. For example, you could
> have split the patches into three sets: important bug fixes, firmware
> debugging and the rest. That helps everyone and saves time.

The first 5 were posted a month earlier than the 25 patchset, and are
bug fixes.  Whatever reason you ignored them, it wasn't because
there were 25 patches from me on the list at the time.

The second big series has the first patch as bug-fix, and clearly noted
in the 0000 description.  Grab it, and save the rest for later.

I'll be happy to re-work the big patch-set, but there is a lot of churn in
ath10k, and waiting months before applying patches means they rot and makes
more work for everyone.  Let's get these 6 bug-fixes in, and then I'll rebase,
test, and post a smaller patch-set for consideration.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
