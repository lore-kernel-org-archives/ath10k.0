Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfrMk-00009n-9X
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 16:30:55 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: ath10k: fix throughput regression in multi client mode
Date: Fri, 2 Sep 2016 16:30:26 +0000
Message-ID: <87inuez2lb.fsf@kamboji.qca.qualcomm.com>
References: <425ad8d804bf46feada839a8e0d0c77e@euamsexm01a.eu.qualcomm.com>
In-Reply-To: <425ad8d804bf46feada839a8e0d0c77e@euamsexm01a.eu.qualcomm.com>
 (Kalle Valo's message of "Wed, 31 Aug 2016 10:24:15 +0200")
Content-Language: en-US
Content-ID: <5674ED6CB30D664CB1B9E025CC842A0A@qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "rmanohar@codeaurora.org" <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:
>> commit 7a0adc83f34d ("ath10k: improve tx scheduling") is causing
>> severe throughput drop in multi client mode. This issue is originally
>> reported in veriwave setup with 50 clients with TCP downlink traffic.
>> While increasing number of clients, the average throughput drops
>> gradually. With 50 clients, the combined peak throughput is decreased
>> to 98 Mbps whereas reverting given commit restored it to 550 Mbps.
>> 
>> Processing txqs for every tx completion is causing overhead. Ideally for
>> management frame tx completion, pending txqs processing can be avoided.
>> The change partly reverts the commit "ath10k: improve tx scheduling".
>> Processing pending txqs after all skbs tx completion will yeild enough
>> room to burst tx frames.
>> 
>> Fixes: 7a0adc83f34d ("ath10k: improve tx scheduling")
>> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
>
> I'm planning to queue this to 4.8 if no objections.

Actually the patch doesn't apply to ath-current branch so I'll apply to
ath-next instead.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
