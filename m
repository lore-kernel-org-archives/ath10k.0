Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMXwT-0001rn-HQ
 for ath10k@lists.infradead.org; Thu, 09 Apr 2020 14:14:07 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 2/2] ath10k: correct legacy rate in tx stats
References: <1574147982-3956-1-git-send-email-yyuwang@codeaurora.org>
 <0101016e82882548-361b3da4-fd9b-4ba9-95b6-a5d782d4a1c8-000000@us-west-2.amazonses.com>
 <87h7yd4y0a.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 09 Apr 2020 17:13:39 +0300
In-Reply-To: <87h7yd4y0a.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Tue, 24 Mar 2020 16:40:21 +0200")
Message-ID: <87y2r4u4q4.fsf@kamboji.qca.qualcomm.com>
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
To: Yu Wang <yyuwang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

For some reason these comments didn't go to patchwork so resending them
again:

Kalle Valo <kvalo@codeaurora.org> writes:

> Yu Wang <yyuwang@codeaurora.org> writes:
>
>> +	for (i = 0; i < sband->n_bitrates; i++) {
>> +		bitrates = &sband->bitrates[i];
>> +		if (ath10k_mac_bitrate_is_cck(bitrates->bitrate) != cck)
>> +			continue;
>> +
>> +		if (bitrates->hw_value == hw_rate ||
>> +		    (bitrates->flags & IEEE80211_RATE_SHORT_PREAMBLE &&
>> +		     bitrates->hw_value_short == hw_rate)) {
>> +			bitrate = bitrates->bitrate;
>> +
>> +			/* The bitrate will be recovered in
>> +			 * ath10k_update_per_peer_tx_stats().
>> +			 */
>> +			if (bitrate == 55)
>> +				bitrate = 60;
>> +
>> +			bitrate = bitrate / 10;
>
> Here you use magic value 60 but in ath10k_update_per_peer_tx_stats() you
> use magic value 50:
>
>> +		/* from 1Mbps to 100Kbps */
>> +		rate = rate * 10;
>> +		if (rate == 50)
>> +			rate = 55;
>
> Am I missing something or how is this supposed to work?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
