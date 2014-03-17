Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPa3R-0007Y8-Q9
 for ath10k@lists.infradead.org; Mon, 17 Mar 2014 16:06:22 +0000
Message-ID: <53271D65.4020603@candelatech.com>
Date: Mon, 17 Mar 2014 09:05:57 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Proper way to do warm-reset from the driver?
References: <53237D0A.1030008@candelatech.com>
 <87r461l0wh.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87r461l0wh.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 03/17/2014 12:50 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> On my firmware, I am often seeing 'tx not flushed' errors after bouncing
>> 32 stations a few times.
>>
>> It does not seem this error can ever be recovered because the
>> reference counting is messed up.
>>
>> I am planning to attempt a warm reset in this case, in hopes it
>> will clear things up.
>>
>> Is the preferred way to restart the nic just:
>>
>> queue_work(ar->workqueue, &ar->restart_work);
> 
> BTW, that call really should not be in ath10k_pci_hif_dump_area(). It's
> very misleading to have a function name which implies just printing
> stuff but actually also restarts firmware.

Yes, and it is not always called from that method anyway...bails
out before resetting in some error cases.

My own tree has lots of patches to that method to dump more
firmware memory areas and such, so it will not be so easy
for me to produce a clean patch to fix this...

Thanks,
Ben
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
