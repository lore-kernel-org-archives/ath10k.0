Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJwAp-0007sW-Tm
 for ath10k@lists.infradead.org; Mon, 14 Oct 2019 08:57:53 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RFC PATCH 0/2] ath10k: provide survey info as accumulated data
References: <20190918124259.17804-1-sven@narfation.org>
 <9a9ec99b-9643-7288-eed5-b549a9fe1487@newmedia-net.de>
 <1614044.H5m0Cyd3Ly@bentobox>
Date: Mon, 14 Oct 2019 11:57:47 +0300
In-Reply-To: <1614044.H5m0Cyd3Ly@bentobox> (Sven Eckelmann's message of "Mon, 
 14 Oct 2019 09:07:42 +0200")
Message-ID: <871rvfzotw.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sven Eckelmann <sven@narfation.org> writes:

> On Monday, 14 October 2019 00:15:20 CEST Sebastian Gottschall wrote:
>> i checked your patch on 10.4 based chipsets with 9984. the values are 
>> now looking bogus and wrong at all. busy and active time time in ms does 
>> increase in hours each second
>> the problem seem to be that your patch is 10.2.4 only related. 
>> ath_clean_survey does not trigger on 10.4 so the values double itself 
>> each time the event raises since you add the full values and not just a 
>> delta on top
>
> Thanks for the feedback. So we have now a firmware 10.2.4 which is counting 
> busy + active up and has wraparound problems. And then we have a 10.4 firmware 
> (on QCA9888 and QCA4019) which is clearing everything as expected with 
> WMI_BSS_SURVEY_REQ_TYPE_READ_CLEAR  and then we have some 10.4 firmware (one 
> QCA9984) which behaves more like ath 10.2.4 firmware but is marked as 
> ATH10K_HW_CC_WRAP_SHIFTED_EACH like the QCA4019.
>
> So I have no idea how to fix this when QCA4019 and QCA9984 are currently 
> marked the same but behave differently. Does somebody have a overview how the 
> different HW versions should behave or is there some special bit in the data 
> reported by the firmware which can be used to evaluate the expected behavior?

I hope there's an easy way to detect this behaviour change, but if
nothing else we could add a new bit to enum ath10k_fw_features. But of
course that's the last resort, maintaining the firmware features
bitfield accross different firmware branches is quite cumbersome.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
