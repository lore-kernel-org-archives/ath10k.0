Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMZ7e-0006u8-2i
 for ath10k@lists.infradead.org; Thu, 09 Apr 2020 15:29:47 +0000
MIME-Version: 1.0
Date: Thu, 09 Apr 2020 23:29:20 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v9 3/4] ath10k: add htt TX bundle for sdio
In-Reply-To: <87pncgu2ba.fsf@kamboji.qca.qualcomm.com>
References: <20200212080415.31265-1-wgong@codeaurora.org>
 <20200212080415.31265-4-wgong@codeaurora.org>
 <87pncgu2ba.fsf@kamboji.qca.qualcomm.com>
Message-ID: <36ee3bed6f7cd200df0755209ec6bbc2@codeaurora.org>
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

On 2020-04-09 23:05, Kalle Valo wrote:

>> +		ep->tx_credits -= credits;
>> +		ath10k_dbg(ar, ATH10K_DBG_HTC,
>> +			   "htc ep %d consumed %d credits (total %d)\n",
> 
> "htc ep %d consumed %d credits total %d\n"
> 
> [...]
> 
>> +	ath10k_dbg(ar, ATH10K_DBG_HTC, "bundle skb: len:%d\n", 
>> bundle_skb->len);
> 
> "htc bundle skb len %d\n"
> 
> In other words, start with "htc" and don't use colons or parenthesis.
> This applies to most of debug messages in this patch.
I will change the log and other log and sent v10.
but "ath10k: disable TX complete indication of htt for sdio" and
"ath10k: change ATH10K_SDIO_BUS_REQUEST_MAX_NUM from 64 to 1024" has 
appied to ath-next,
so I only need to send the left 2 patches:
"ath10k: add htt TX bundle for sdio" and "ath10k: enable alt data of TX 
path for sdio", right?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
