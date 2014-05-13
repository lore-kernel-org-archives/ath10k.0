Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkLWv-00060q-0q
 for ath10k@lists.infradead.org; Tue, 13 May 2014 22:50:37 +0000
Message-ID: <5372A1A7.2080602@candelatech.com>
Date: Tue, 13 May 2014 15:50:15 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: FYI: msdu-desc must be multiple of 8.
References: <53729DED.6000104@candelatech.com>
 <CAHqTa-2OCz30cetjY3pALup-e0WL=YRLOkrB3Q6QmSyQBxdvhQ@mail.gmail.com>
In-Reply-To: <CAHqTa-2OCz30cetjY3pALup-e0WL=YRLOkrB3Q6QmSyQBxdvhQ@mail.gmail.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 05/13/2014 03:42 PM, Avery Pennarun wrote:
> On Tue, May 13, 2014 at 6:34 PM, Ben Greear <greearb@candelatech.com> wrote:
>> I just hit strange and wonderful crashes because I managed to use
>> an msdu-desc length that was not an even multiple of 8.  Firmware
>> has assumption (bug, really) about this.
>>
>> Bug is only triggerable if you fill up tx-descs, so have to flood UDP
>> to hit easily.  I was trying 812 buffers, but 808 works just fine.
>> (non CT firmware will not let you do less that 1024, no matter what you
>> request, btw).
> 
> What chooses the msdu-desc length?  Is there a chance that this would
> happen on an unmodified driver?

It would take someone mucking around in the driver like I was.

Mucking with the vow_config would likely have similar constraints,
but nothing is using that, and I'm not sure firmware even supports it.

See TARGET_10X_NUM_MSDU_DESC

As an aside, if you do manage to crash firmware in this manner, it also
takes down the host when it tries to clean up the stale tx buffers.  Possibly
that bug is just due to some of my own patches, but might be worth investigating
some day when I have more time and a cleaner tree...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
