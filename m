Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abXEB-0006ye-De
 for ath10k@lists.infradead.org; Thu, 03 Mar 2016 17:39:56 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Per radio configuration
Date: Thu, 3 Mar 2016 17:39:29 +0000
Message-ID: <87y49z1mwj.fsf@kamboji.qca.qualcomm.com>
References: <56B3BCF0.7070408@candelatech.com>
 <877fhj3774.fsf@kamboji.qca.qualcomm.com>	<56D8694D.9040502@candelatech.com>
In-Reply-To: <56D8694D.9040502@candelatech.com> (Ben Greear's message of "Thu, 
 3 Mar 2016 08:41:49 -0800")
Content-Language: en-US
Content-ID: <D823EA38EFFEF047ACDF36739CF231DF@qualcomm.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

>> Ok, so basically an .ini file for the driver.
>>
>>> When parsing, Lines starting with # would be ignored.
>>> Any un-known tokens would be ignored, for backwards/forwards compatibility.
>>>
>>> This file would be loaded and parsed before loading other firmware
>>> images so that we can use particular firmware images per radio. This
>>> further lets one optimize one radio for one thing, one for another.
>>> For instance, if someone requires IBSS and wants to use stock QCA
>>> firmware, they can use the 'main' firmware for that radio, and the
>>> most recent one for another radio that needs to be a stable AP.
>>>
>>> In addition to this, we would need to store the vdev combinations
>>> in RAM in the 'ar' struct, so we could get rid of all of the static,
>>> hard-coded members and set the capabilities to match the requested
>>> values.
>>>
>>> Any opinions on this?  Something that might be worthwhile for upstream?
>>
>> I have seen lots of out-of-tree drivers having something like this but I
>> doubt that something like this would be acceptable in upstream. Anyway
>> this is something which should be discussed in linux-wireless with a
>> wider audience, maybe even in lkml.
>
> You are the maintainer, so, do *you* like the idea?  

I'm _one_ of the maintainers, a big difference :) This is not just about
ath10k but all wireless drivers (or maybe even about all network
drivers).

I think that there's more and more need for something like this[1] in
wireless drivers. I read your mail about this only today (yeah, I'm
backlogged quite a lot) but I actually talked about this very problem at
the Wireless Summit in Sevilla. It didn't get very far and no real
solution was found except doing the configuration via debugfs and
restarting the firmware. Not really an ideal solution.

But I don't think the .ini approach is really doable either, having an
ini parser in kernel sounds scary. Hopefully there is a better way to do
it.

> If you don't, then there is no use in me putting more effort into it
> for upstream use.
>
> If you do, then I will work on cleaning up a patch for upstream and post
> it to a wider audience.

I think this needs a lot more discussion before using time for the
actual implementation.

[1] I mean something like device specific module parameters (instead of
    driver global parameters we have now) where you can set parameters
    per PCI/USB/SDIO device.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
