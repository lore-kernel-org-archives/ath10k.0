Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W4B8t-0003vK-LN
 for ath10k@lists.infradead.org; Fri, 17 Jan 2014 15:15:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add support for AP CSA
References: <1389345563-3445-1-git-send-email-michal.kazior@tieto.com>
 <87lhyercjd.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQktbmjYJA91mJ_EU=iTtCOFiPNPjjxRm=yxiwxposS-rA@mail.gmail.com>
Date: Fri, 17 Jan 2014 17:15:03 +0200
In-Reply-To: <CA+BoTQktbmjYJA91mJ_EU=iTtCOFiPNPjjxRm=yxiwxposS-rA@mail.gmail.com>
 (Michal Kazior's message of "Fri, 17 Jan 2014 14:46:39 +0100")
Message-ID: <878uuer66g.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 17 January 2014 13:57, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> This patch implements Channel Switch Announcement
>>> for AP mode. This allows for a smooth channel
>>> switch for connected stations that support CSA
>>> when radar is detected.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>
>> [...]
>>
>>> --- a/drivers/net/wireless/ath/ath10k/core.h
>>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>>> @@ -414,6 +414,7 @@ struct ath10k {
>>>       unsigned int filter_flags;
>>>       unsigned long dev_flags;
>>>       u32 dfs_block_radar_events;
>>> +     struct ath10k_vif *csa_arvif;
>>
>> Please document how this is serialised.
>
> [...]
>
> I have a local patch capable of multi-interface CSA which basically
> rewrites this patch entirely. Unless you want me send that as a follow
> up patch later I'd like to drop this patch and send a completely new
> one later.

Yeah, let's then just drop this patch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
