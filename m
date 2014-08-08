Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFmJI-0007hQ-Hk
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 15:42:28 +0000
Message-ID: <53E4EFCB.5090501@candelatech.com>
Date: Fri, 08 Aug 2014 08:42:03 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Reporting firmware stats to ethtool
References: <53E3F65D.8080102@candelatech.com>
 <87wqajz6yg.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wqajz6yg.fsf@kamboji.qca.qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 08/08/2014 02:06 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> I'm working on a patch to report the stats seen in debugfs/...ath10k/fw_stats
>> as ethtool stats, somewhat similar to how ath9k does it.
>>
>> I notice that my user-space tool is reporting huge numbers because
>> the stats are reset to zero when firmware restarts, and so my tool
>> thinks the stats wrapped.
>>
>> I can fix my tool easily enough, but I first wanted to see if
>> anyone had strong feelings about keeping the stats from resetting
>> to zero by storing history and calculating diffs in the driver.
>>
>> I think my preference is to punt this to user-space, but if
>> someone feels otherwise, please let me know sooner than later.
> 
> I also prefer to have this in user space, but how does user space know
> when the stats have been zeroed?

Poll often enough that it cannot increment more than 2 billion (or other large number)
between polls, and then if polled value is less than previous (and difference is > 2 billion),
we know we had a reset and not a wrap.

User-space stats will not be perfect in the case of firmware resets, or resets
after the 'large number', but nothing is going to make it perfect, and in
practice, this seems good enough.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
