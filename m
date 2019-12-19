Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihwgk-0007dj-IF
 for ath10k@lists.infradead.org; Thu, 19 Dec 2019 14:22:05 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] ath10k: pci: Only dump ATH10K_MEM_REGION_TYPE_IOREG
 when safe
References: <20191219131539.1003793-1-bryan.odonoghue@linaro.org>
 <20191219131539.1003793-2-bryan.odonoghue@linaro.org>
 <87woas5slt.fsf@kamboji.qca.qualcomm.com>
 <38bf1f75-0554-920a-0f29-354e70cfc077@linaro.org>
Date: Thu, 19 Dec 2019 16:21:55 +0200
In-Reply-To: <38bf1f75-0554-920a-0f29-354e70cfc077@linaro.org> (Bryan
 O'Donoghue's message of "Thu, 19 Dec 2019 14:15:37 +0000")
Message-ID: <87sglg5rb0.fsf@kamboji.qca.qualcomm.com>
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: akolli@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bryan O'Donoghue <bryan.odonoghue@linaro.org> writes:

> On 19/12/2019 13:53, Kalle Valo wrote:
>> Bryan O'Donoghue <bryan.odonoghue@linaro.org> writes:
>>
>>> ath10k_pci_dump_memory_reg() will try to access memory of type
>>> ATH10K_MEM_REGION_TYPE_IOREG however, if a hardware restart is in progress
>>> this can crash a system.
>>>
>>> Individual ioread32() time has been observed to jump from 15-20 ticks to >
>>> 80k ticks followed by a secure-watchdog bite and a system reset.
>>>
>>> Work around this corner case by only issuing the read transaction when the
>>> driver state is ATH10K_STATE_ON.
>>>
>>> Fixes: 219cc084c6706 ("ath10k: add memory dump support QCA9984")
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> What ath10k hardware and firmware did you test this on? I can add that
>> to the commit log.
>>
>
> HW = QCA9988
> FW = ??
>
> Not quite sure how to find the firmware version TBH

'dmesg | grep ath10k' should show it.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
