Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAHWG-0001Zw-NH
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 17:44:06 +0000
Subject: Re: [PATCH] cfg80211: Add cumulative channel survey dump support.
References: <1526980556-26707-1-git-send-email-vnaralas@codeaurora.org>
 <1527069282.3759.16.camel@sipsolutions.net>
 <ebf1c95acb34649b3d2a5435142dc06a@codeaurora.org>
 <2083094.mFhUXK7yzB@bentobox>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <cc8bc245-034b-376d-3952-0c0ac6d51cab@candelatech.com>
Date: Tue, 17 Sep 2019 10:44:03 -0700
MIME-Version: 1.0
In-Reply-To: <2083094.mFhUXK7yzB@bentobox>
Content-Language: en-US
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
To: Sven Eckelmann <sven@narfation.org>, vnaralas@codeaurora.org, ath10k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, slakkavalli@datto.com, linux-wireless@vger.kernel.org, sw@simonwunderlich.de

On 9/17/19 10:27 AM, Sven Eckelmann wrote:
> On Thursday, 31 May 2018 11:06:59 CEST vnaralas@codeaurora.org wrote:
>> I will sent next version of patch with updated commit log.
> 
> Can you please point me to the second version?
> 
> Btw. I've just checked the minimal changes in ath10k to get this working. It
> seems we need SURVEY_INFO_NON_ACC_DATA in ath10k's ath10k_get_survey + memset
> of ar->survey[idx].
> 
> But right now the total time looks (especially) wrong to me. At least it is
> rather unlikely that I can have around 30 second active time delta in
> roughly 1 real world second.  Maybe a bug with the READ_CLEAR handling in
> firmware 10.2.4-1.0-00043 or maybe all firmware version? More logs about
> that at the end.
> 
> @Ben: Was this also what you've experience in the past with the 10.2 firmware
> bss_chan_info counter bugs or am I just misusing the functionality of the
> firmware?

Last I recall, the upstream code had several bugs.  Maybe some QCA
firmware person can let you know if they fixed the upstream firmware.

If you want to test against ath10k-ct driver/firmware, and if you still see bogus values, then
I can debug and fix it.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
