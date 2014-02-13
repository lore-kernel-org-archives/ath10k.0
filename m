Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDyOi-0002td-Jk
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 15:40:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k crash on startup, related to ath10k_ce_completed_recv_next?
References: <52FC2ABF.5010300@candelatech.com>
 <87r4779vd9.fsf@kamboji.qca.qualcomm.com>
 <52FCE5AD.3080606@candelatech.com>
Date: Thu, 13 Feb 2014 17:39:53 +0200
In-Reply-To: <52FCE5AD.3080606@candelatech.com> (Ben Greear's message of "Thu, 
 13 Feb 2014 07:33:01 -0800")
Message-ID: <878utf81iu.fsf@kamboji.qca.qualcomm.com>
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

> On 02/13/2014 02:09 AM, Kalle Valo wrote:
>> Ben Greear <greearb@candelatech.com> writes:
>>
>>> I saw the crash below on startup.  My firmware is put back together
>>> again and mostly working, so not sure it is related to overly
>>> broken firmware.
>>>
>>> I have a few patches to ath10k, but mostly debugging code
>>> that should not affect the logic below.
>>
>> When you have your own changes it pretty difficult to start debugging
>> crashes like this, as your private changes can break something. Can you
>> see these crashes with the upstream version?
>
> I am unlikely to test with pure upstream code anytime soon..I need the
> features I added to take advantage of my customized CT firmware, and I need my
> firmware in order to run any of my more interesting test cases.
>
> If the problem is not obvious, then please just consider my crash reports
> as FYI and I'll work on them when I have time.

Ok, I'll do that. Please do keep sending these reports, they are
useful even if I can't analyse them right away.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
