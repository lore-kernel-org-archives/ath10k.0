Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAZXp-0004bw-D8
 for ath10k@lists.infradead.org; Wed, 18 Sep 2019 12:58:55 +0000
Subject: Re: [PATCH] cfg80211: Add cumulative channel survey dump support.
References: <1526980556-26707-1-git-send-email-vnaralas@codeaurora.org>
 <ebf1c95acb34649b3d2a5435142dc06a@codeaurora.org>
 <2083094.mFhUXK7yzB@bentobox> <18458963.ukFM9YuvQx@bentobox>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <b24ec622-8510-d8e4-bbc4-86a34c1dd32b@candelatech.com>
Date: Wed, 18 Sep 2019 05:58:46 -0700
MIME-Version: 1.0
In-Reply-To: <18458963.ukFM9YuvQx@bentobox>
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
To: Sven Eckelmann <sven@narfation.org>, ath10k@lists.infradead.org, sw@simonwunderlich.de
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, slakkavalli@datto.com



On 09/18/2019 01:46 AM, Sven Eckelmann wrote:
> On Tuesday, 17 September 2019 19:27:50 CEST Sven Eckelmann wrote:
> [...]
>> So whatever the firmware does when it gets a
>> WMI_BSS_SURVEY_REQ_TYPE_READ_CLEAR -  it is not a CLEAR after read. And they
>> also don't simply wrap around but there all values have to get some kind of
>> "fix" like the active time one shown in ath10k_hw_fill_survey_time.
>> Just that the actual "fixes" for them are unknown. To me it looks like
>> firmware ATH10K_HW_CC_WRAP_SHIFTED_ALL have busy and rx interlinked with
>> the overflow of total. But the tx and rx_bss are actually cleared.
>>
>> Other than that, the counters are wrapping every ~14-30 seconds. So we
>> also need also some worker for ath10k which every couple of seconds
>> requests new values for all the channel from the firmware. Which already
>> sounds problematic because I get
>> "ath10k_pci 0000:00:00.0: bss channelsurvey timed out" all the time
>> when requesting surveys manually.
>
> I've just tested it on 10.4 (wave-2) cards and it seems like it is cleared as
> expected on them. So the change I posted earlier (with a minor fix for
> ath10k_hw_fill_survey_time) returns now useful (accumulated) values. This can
> be seen in
> https://stats.freifunk-vogtland.net/d/ffv_node/nodeinfo?orgId=1&var-node=ac86749f4d60&fullscreen&panelId=5&from=1568782046974&to=1568807068706
> (after the reboot at 10:15 UTC+2)
>
> So as Ben Greear said, the 10.4 firmware version is fixed and 10.2.* (for
> the wave-1 cards) is still broken and we need a QCA firmware engineer to
> fix it. Or to work around it by polling every couple of seconds and
> manually do the cleanup of the values from the firmware.

Have you tried probing very fast, like every 100ms, to see if returned values
look sane?  I seem to recall that there was some firmware issue with this, like
it only updates internal counters every second or so.

Polling slow would have the same off-by-a-second's-worth-of-data, but you would not
easily notice it at slower polling intervals.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
