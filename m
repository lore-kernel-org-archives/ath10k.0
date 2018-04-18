Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8oK6-0006qO-Oj
 for ath10k@lists.infradead.org; Wed, 18 Apr 2018 14:44:41 +0000
Received: by mail-wr0-x229.google.com with SMTP id v24-v6so5562306wra.8
 for <ath10k@lists.infradead.org>; Wed, 18 Apr 2018 07:44:28 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] ath10k: Enable sta idle power save
References: <1523966821-21903-1-git-send-email-pillair@codeaurora.org>
 <1523966821-21903-5-git-send-email-pillair@codeaurora.org>
 <946e582c-2438-872b-eec8-25d9dcb994d9@dd-wrt.com>
 <7a06a34a5fcb97e07a8d79b4d689e781@codeaurora.org>
 <87604oodt4.fsf@kamboji.qca.qualcomm.com>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <5AD759C7.2070104@broadcom.com>
Date: Wed, 18 Apr 2018 16:44:23 +0200
MIME-Version: 1.0
In-Reply-To: <87604oodt4.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, govinds@codeaurora.org
Cc: pillair@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>

On 4/18/2018 3:16 PM, Kalle Valo wrote:
> (fixing top posting)
>
> govinds@codeaurora.org writes:
>
>> On 2018-04-18 12:36, Sebastian Gottschall wrote:
>>> from my point of view powersave should be optional and not forced.
>>>
>>> consider :
>>> iw dev <devname> set power_save on/off
>>>
>>> so there is already a config option made for that purpose,
>>
>> Thanks Sebastian for your review. Agree this should not be forced with
>> in driver.
>>
>> I will check if i can set the idle ps at the end of
>> ath10k_mac_vif_setup_ps by checking arvif->ps.
>> I will update the patch accordingly.
>
> So what power save is this exactly? I assumed it's some bus level power
> save (turning of clocks etc) but is it actually 802.11 power save?

I also suspected bus level power save and I would say runtime-pm 
framework should be considered for that.

Regards,
Arend



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
