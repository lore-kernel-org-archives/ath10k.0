Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDyI1-0002eg-3s
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 15:33:25 +0000
Message-ID: <52FCE5AD.3080606@candelatech.com>
Date: Thu, 13 Feb 2014 07:33:01 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k crash on startup, related to ath10k_ce_completed_recv_next?
References: <52FC2ABF.5010300@candelatech.com>
 <87r4779vd9.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87r4779vd9.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 02/13/2014 02:09 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> I saw the crash below on startup.  My firmware is put back together
>> again and mostly working, so not sure it is related to overly
>> broken firmware.
>>
>> I have a few patches to ath10k, but mostly debugging code
>> that should not affect the logic below.
>
> When you have your own changes it pretty difficult to start debugging
> crashes like this, as your private changes can break something. Can you
> see these crashes with the upstream version?

I am unlikely to test with pure upstream code anytime soon..I need the
features I added to take advantage of my customized CT firmware, and I need my
firmware in order to run any of my more interesting test cases.

If the problem is not obvious, then please just consider my crash reports
as FYI and I'll work on them when I have time.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
