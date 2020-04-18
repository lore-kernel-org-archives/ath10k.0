Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPo3C-00063p-BD
 for ath10k@lists.infradead.org; Sat, 18 Apr 2020 14:02:33 +0000
MIME-Version: 1.0
Date: Sat, 18 Apr 2020 22:02:24 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v9 3/4] ath10k: add htt TX bundle for sdio
In-Reply-To: <87o8rrr4y5.fsf@kamboji.qca.qualcomm.com>
References: <20200212080415.31265-1-wgong@codeaurora.org>
 <20200212080415.31265-4-wgong@codeaurora.org>
 <87tv1su2vq.fsf@kamboji.qca.qualcomm.com>
 <185d31c2e6f8792beb240f2c74d26463@codeaurora.org>
 <87h7xmtrmv.fsf@kamboji.qca.qualcomm.com>
 <87o8rrr4y5.fsf@kamboji.qca.qualcomm.com>
Message-ID: <27ca9f2bf63807d501cfb29d8f55f904@codeaurora.org>
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

On 2020-04-16 20:27, Kalle Valo wrote:
> Kalle Valo <kvalo@codeaurora.org> writes:
> 

>> How much does it drop? Please add the justification (with numbers) for
>> the new thread to the commit log, so that the reason is properly
>> documented.
> 
> I see that you already submitted v10. If you can give the numbers I can
> add them to the commit log.

I tested for VHT80 mode for 3 thread config:
result:
                                      TCP-RX    TCP-TX    UDP-RX    
UDP-TX
use workqueue_tx_complete(Mbps)        423       357       448       412
change it to ar->workqueue(Mbps)       410       360       449       414
change it to ar->workqueue_aux(Mbps)   405       339       446       401

each thread role:
tx_bundle_skbs(ar->workqueue),
rx_indication(ar->workqueue_aux),
sdio_async_tx_request(ar_sdio->workqueue),
tx_bundle_complete(ar->workqueue_tx_complete)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
