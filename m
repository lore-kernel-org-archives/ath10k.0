Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihwaF-0005Xm-3w
 for ath10k@lists.infradead.org; Thu, 19 Dec 2019 14:15:20 +0000
Received: by mail-ed1-x541.google.com with SMTP id dc19so4996329edb.10
 for <ath10k@lists.infradead.org>; Thu, 19 Dec 2019 06:15:18 -0800 (PST)
Subject: Re: [PATCH 1/2] ath10k: pci: Only dump ATH10K_MEM_REGION_TYPE_IOREG
 when safe
References: <20191219131539.1003793-1-bryan.odonoghue@linaro.org>
 <20191219131539.1003793-2-bryan.odonoghue@linaro.org>
 <87woas5slt.fsf@kamboji.qca.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <38bf1f75-0554-920a-0f29-354e70cfc077@linaro.org>
Date: Thu, 19 Dec 2019 14:15:37 +0000
MIME-Version: 1.0
In-Reply-To: <87woas5slt.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
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
Cc: akolli@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 19/12/2019 13:53, Kalle Valo wrote:
> Bryan O'Donoghue <bryan.odonoghue@linaro.org> writes:
> 
>> ath10k_pci_dump_memory_reg() will try to access memory of type
>> ATH10K_MEM_REGION_TYPE_IOREG however, if a hardware restart is in progress
>> this can crash a system.
>>
>> Individual ioread32() time has been observed to jump from 15-20 ticks to >
>> 80k ticks followed by a secure-watchdog bite and a system reset.
>>
>> Work around this corner case by only issuing the read transaction when the
>> driver state is ATH10K_STATE_ON.
>>
>> Fixes: 219cc084c6706 ("ath10k: add memory dump support QCA9984")
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> What ath10k hardware and firmware did you test this on? I can add that
> to the commit log.
> 

HW = QCA9988
FW = ??

Not quite sure how to find the firmware version TBH

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
