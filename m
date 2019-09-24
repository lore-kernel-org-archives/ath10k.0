Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iChBK-0004kI-Pv
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 09:32:28 +0000
MIME-Version: 1.0
Date: Tue, 24 Sep 2019 17:32:25 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v5 3/8] ath10k: change max RX bundle size from 8 to 32 for
 sdio
In-Reply-To: <871rw79ycy.fsf@codeaurora.org>
References: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
 <1567679893-14029-4-git-send-email-wgong@codeaurora.org>
 <871rw79ycy.fsf@codeaurora.org>
Message-ID: <5f2387dc4c97a5edff78fa6ce7dcd401@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-09-23 17:05, Kalle Valo wrote:

>> 
>> +#define ATH10K_HTC_FLAG_BUNDLE_MASK 0xF0
>> +#define ATH10K_HTC_BUNDLE_EXTRA_MASK GENMASK(3, 2)
>> +
>> +#define ATH10K_HTC_GET_BUNDLE_COUNT(flags) \
>> +	    (FIELD_GET(ATH10K_HTC_FLAG_BUNDLE_MASK, (flags)) +  \
>> +	    (FIELD_GET(ATH10K_HTC_BUNDLE_EXTRA_MASK, (flags)) << 4))
> 
> When using FIELD_GET() there should be no need to use '<<', the main id
> of FIELD_GET() and BITMASK() is that there's no need do any manual
> shifting. So I suspect something is wrong here, but didn't have time to
> investigate.
the value is like this:
the u8 flags:
b7 b6 b5 b4 b3 b2 b1 b0
the count= 0Bb7b6b5b4 + 0Bb3b2 << 4
FIELD_GET is to >>, not <<
so it need to manual shift for the "0Bb3b2 << 4"

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
