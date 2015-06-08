Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z24Ra-0001un-G3
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 21:18:54 +0000
Message-ID: <557606A8.4010106@candelatech.com>
Date: Mon, 08 Jun 2015 14:18:32 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: new debugfs interface to enable adaptive CCA
References: <1431093663-15206-1-git-send-email-c_mpubbi@qti.qualcomm.com>
 <CA+BoTQ=480Wg4WmL0eBZ7CS9aVHjH8Lt-2x-FzAuGwsAuNA8-w@mail.gmail.com>
 <5570CD2F.4040604@candelatech.com>
In-Reply-To: <5570CD2F.4040604@candelatech.com>
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
To: c_mpubbi@qti.qualcomm.com
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Is there any publicly available firmware binary that supports this feature,
even if one has to force the feature flag?

Thanks,
Ben

On 06/04/2015 03:11 PM, Ben Greear wrote:
> Is there any way to make this work on a 10.1 firmware, even if that means
> manually poking registers through debugfs?
> 
> I have a user of CT firmware that would really like Adaptive CCA to
> work, so if I can just get some clues as to what needs setting,
> I can write up an API that works with my 10.1 firmware...
> 
> Thanks,
> Ben
> 
> 
> On 05/10/2015 11:05 PM, Michal Kazior wrote:
>> On 8 May 2015 at 16:01,  <c_mpubbi@qti.qualcomm.com> wrote:
>>> From: Manikanta Pubbisetty <c_mpubbi@qti.qualcomm.com>
>>>
>>> For devices working in 2.4 GHz to be ETSI compliant,
>>> it is required to support adaptive CCA. Some firmwares
>>> support adaptive CCA and is disabled by default.
>>>
>>> The patch is an attempt to add a new debugfs interface to enable
>>> adaptive cca on supported firmwares. Support for this feature is
>>> advertised with a new firmware feature flag.
>>
>> I guess this should be configured automatically depending on DFS
>> domain. You can't expect users to configure their devices via debugfs,
>> can you? This should just work.
> 
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
