Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLwoH-0004aO-QL
 for ath10k@lists.infradead.org; Fri, 07 Mar 2014 15:35:42 +0000
Message-ID: <5319E736.3080104@candelatech.com>
Date: Fri, 07 Mar 2014 07:35:18 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Let ath10k_err take 'ar' argument?
References: <5318AA27.4090609@candelatech.com>
 <871tyeqwi1.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <871tyeqwi1.fsf@kamboji.qca.qualcomm.com>
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

On 03/06/2014 11:49 PM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> I have two NICs in a system, and it died overnight (full host lockup).
>> Console shows this:
>>
>> [root@ct523-9292 ~]# ath10k: target stalled
>> ath10k: failed to wait for target to init: -5
>> ath10k: target stalled
>
> Damn. Do you have anything before the target stalled message?

No, nothing useful.

I reproduced this on WLE900VX as well (and posted a week or so about it).

Well, the one above is from system with two different NICs (CUS223, WLE900VX)
so not sure exactly which one had the issue...

>> I was thinking of changing ath10k_err to take
>> 'ar' as argument and then print out pci-id or some
>> other identifier so that we can tell which
>> NIC is having issues on systems with multiple NICs?
>>
>> Any opinions on this before I get started?
>
> I have been thinking exactly the same. I think we should add struct
> ath10k to all of our logging and debugging macros. IIRC iwlwifi does
> this already, you might want to check that first.

I'll take a stab at it today if I can find time.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
