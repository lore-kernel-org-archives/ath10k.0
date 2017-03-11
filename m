Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmmPQ-0004XI-5y
 for ath10k@lists.infradead.org; Sat, 11 Mar 2017 19:10:34 +0000
Received: by mail-lf0-x243.google.com with SMTP id g70so9071582lfh.3
 for <ath10k@lists.infradead.org>; Sat, 11 Mar 2017 11:10:11 -0800 (PST)
Subject: Re: [RFC v4 06/21] ath10k: sdio support
References: <1487693741-10042-1-git-send-email-erik.stromdahl@gmail.com>
 <1487693741-10042-7-git-send-email-erik.stromdahl@gmail.com>
 <8760jh2uy8.fsf@kamboji.qca.qualcomm.com>
 <871su52th2.fsf@kamboji.qca.qualcomm.com>
 <2528f323-6ec7-915c-d98b-615db04510e9@gmail.com>
 <0d331e5f-7868-ed9a-7506-eecd1e8b9df6@gmail.com>
 <87innfq2gp.fsf@qca.qualcomm.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <fb87d7e4-77f3-4b35-8a19-5c6d34015a1c@gmail.com>
Date: Sat, 11 Mar 2017 20:10:08 +0100
MIME-Version: 1.0
In-Reply-To: <87innfq2gp.fsf@qca.qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 2017-03-11 16:04, Kalle Valo wrote:
> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
>
>>> You are right, there is definitely a memory leak (and there are similar problems
>>> in a couple of other functions as well as you have pointed out).
>>>
>>> This was introduced in version 3 of the
>>> RFC when I removed the bounce buffer from ath6kl. Instead I introduced a bunch of
>>> local "bounce" buffers in order to make sure that the buffers passed to the sdio
>>> subsystem is dma-able (malloc'ed buffer instead of stack allocated).
>>>
>>> Regarding endianess: That particular code construct is an artifact from ath6kl.
>>> I am not sure it makes any sense to use a u32 in that particular case.
>>> A u8 array is most likely more convenient.
>>>
>>> It is really nice you have found some time to review the patches!
>>
>> After doing some reviewing myself I have found some more endianess related issues.
>> I will fix those (and the memory leaks) and submit v5 some time next week.
>
> Actually let me send v5 (for the sdio part, I'm ignoring usb for now). I
> have made some small changes while looking at the patches.
>
Ok, I have made some fixes in the branch:

ath-201703090806-ath10k-sdio-usb

in my ath tree:
https://github.com/erstrom/linux-ath.git

Perhaps you can have a look at the updated sdio.c

--
Erik

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
