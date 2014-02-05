Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAxf7-0002os-Rt
 for ath10k@lists.infradead.org; Wed, 05 Feb 2014 08:16:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/4] ath10k:  Add more debugging for receive errors.
References: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
 <1390435562-15473-3-git-send-email-greearb@candelatech.com>
 <87ppn2ognc.fsf@kamboji.qca.qualcomm.com>
 <52F140F3.3000707@candelatech.com>
Date: Wed, 5 Feb 2014 10:16:18 +0200
In-Reply-To: <52F140F3.3000707@candelatech.com> (Ben Greear's message of "Tue, 
 4 Feb 2014 11:35:15 -0800")
Message-ID: <87a9e6m0tp.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

>>> @@ -975,6 +976,13 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
>>>  			info.skb     = msdu_head;
>>>  			info.fcs_err = ath10k_htt_rx_has_fcs_err(msdu_head);
>>>  			info.mic_err = ath10k_htt_rx_has_mic_err(msdu_head);
>>> +
>>> +			if (info.fcs_err)
>>> +				ath10k_warn("htt rx has FCS err\n");
>>> +
>>> +			if (info.mic_err)
>>> +				ath10k_warn("htt rx has MIC err\n");
>>> +
>> 
>> Do we really want to print warning messages to the user when these
>> happen? I would consider these as "business as usual" in 802.11 world,
>> not a problem in driver.
>
> Maybe I should make them a debug message instead of warning message?  That
> way they are only shown if the user enables debugging?

Yeah, having them as debug messages makes sense.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
