Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f70gb-0003Lw-EF
 for ath10k@lists.infradead.org; Fri, 13 Apr 2018 15:32:27 +0000
Subject: Re: Interest in getting ath10k-ct firmware support upstream?
References: <dda6f5f1-9e40-d7f4-07de-92633a4fdfbe@candelatech.com>
 <87po33qlgh.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <f902dc36-4014-4996-1522-0f1333a2473f@candelatech.com>
Date: Fri, 13 Apr 2018 08:32:05 -0700
MIME-Version: 1.0
In-Reply-To: <87po33qlgh.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k <ath10k@lists.infradead.org>



On 04/13/2018 06:34 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> I'm in the midst of porting my out-of-tree ath10k patches forward to
>> the 4.16 kernel.
>>
>> In case you are interested in allowing support for ath10k-ct firmware
>> in the upstream kernel, now would be a good time for me to work on
>> this.
>>
>> Please let me know if you are interested.
>
> I don't really know what is needed for your firmware so difficult to
> really comment. And ath10k really does not support any specific firmware
> branch per se, it uses more finegrained feature based detection anyway.
>
> But as we are adding SDIO, USB and SNOC busses to ath10k, which is quite
> a enourmous task itself, and trying to support even a different firmware
> sounds really difficult.

I have lots of mostly small tweaks, enabled by feature flags specific to my
firmware.  Adding my changes will increase the code size a bit, but I don't think
it will add much fundamental complexity.

If you will accept feature flags upstream for my firmware and will make an
effort to review patches in a timely manner, I will work on a patch series
and send it for review.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
