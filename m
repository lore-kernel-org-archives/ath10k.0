Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8rOj-0001ht-Mc
 for ath10k@lists.infradead.org; Fri, 03 Jun 2016 15:52:34 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Bug 119151 - [regression] ath10k no longer authenitcates and
 freezes system
Date: Fri, 3 Jun 2016 15:52:03 +0000
Message-ID: <871t4ew9r1.fsf@kamboji.qca.qualcomm.com>
References: <8760trzoiw.fsf@kamboji.qca.qualcomm.com>
 <871t4fzn1x.fsf@kamboji.qca.qualcomm.com>	<57504F05.3040200@candelatech.com>
 <87k2i7y5m2.fsf@kamboji.qca.qualcomm.com>	<57505179.8090509@candelatech.com>
In-Reply-To: <57505179.8090509@candelatech.com> (Ben Greear's message of "Thu, 
 2 Jun 2016 08:32:09 -0700")
Content-Language: en-US
Content-ID: <3C12A978ED31A04699F1A96B115F1728@qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: "mike@fireburn.co.uk" <mike@fireburn.co.uk>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> On 06/02/2016 08:26 AM, Valo, Kalle wrote:
>> Ben Greear <greearb@candelatech.com> writes:
>>
>>> I found a lot of problems with this code as well, and the 5 patches
>>> starting from the URL below fixed the issues for me.
>>>
>>> They are stuck as 'NA' in patchwork, but I don't know why.
>>>
>>> http://lists.infradead.org/pipermail/ath10k/2016-April/007218.html
>>
>> ath10k has a separate patchwork instance, did you look at the correct
>> one? I have quite a lot of patches from you in deferred state because of
>> the patch bomb, but I'm hoping to go through them soon.
>>
>> https://patchwork.kernel.org/project/ath10k/list/?state=10&delegate=25621&order=date
>
> Ok, they are deferred then.
>
> The series of 5 is likely quite useful and fixes some nasty bugs,
> and the first patch of the big bomb is also a trivial crash fix
> for a regression you added (as best as I can tell).
>
> The rest of the patch bomb is less critical, but making some progress on
> that would make me feel good about working on ath10k patches again.

If I get a big patchset like 25 patches it immediately goes to the
bottom of the queue. Organising them a bit better takes like 15 minutes
of your time and makes it a lot easier to review. For example, you could
have split the patches into three sets: important bug fixes, firmware
debugging and the rest. That helps everyone and saves time.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
