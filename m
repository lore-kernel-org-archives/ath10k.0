Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8mwh-0006Cr-0O
 for ath10k@lists.infradead.org; Wed, 18 Apr 2018 13:16:30 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 4/4] ath10k: Enable sta idle power save
References: <1523966821-21903-1-git-send-email-pillair@codeaurora.org>
 <1523966821-21903-5-git-send-email-pillair@codeaurora.org>
 <946e582c-2438-872b-eec8-25d9dcb994d9@dd-wrt.com>
 <7a06a34a5fcb97e07a8d79b4d689e781@codeaurora.org>
Date: Wed, 18 Apr 2018 16:16:07 +0300
In-Reply-To: <7a06a34a5fcb97e07a8d79b4d689e781@codeaurora.org>
 (govinds@codeaurora.org's message of "Wed, 18 Apr 2018 18:37:26
 +0530")
Message-ID: <87604oodt4.fsf@kamboji.qca.qualcomm.com>
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
To: govinds@codeaurora.org
Cc: pillair@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>

(fixing top posting)

govinds@codeaurora.org writes:

> On 2018-04-18 12:36, Sebastian Gottschall wrote:
>> from my point of view powersave should be optional and not forced.
>>
>> consider :
>> iw dev <devname> set power_save on/off
>>
>> so there is already a config option made for that purpose,
>
> Thanks Sebastian for your review. Agree this should not be forced with
> in driver.
>
> I will check if i can set the idle ps at the end of
> ath10k_mac_vif_setup_ps by checking arvif->ps.
> I will update the patch accordingly.

So what power save is this exactly? I assumed it's some bus level power
save (turning of clocks etc) but is it actually 802.11 power save?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
