Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aj7tR-0006k3-5H
 for ath10k@lists.infradead.org; Thu, 24 Mar 2016 16:13:53 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH 1/9] ath10k: speedup htt rx descriptor processing for tx
 completion
Date: Thu, 24 Mar 2016 16:13:25 +0000
Message-ID: <1458836004642.18784@qti.qualcomm.com>
References: <1458647539-17213-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1458647539-17213-2-git-send-email-rmanohar@qti.qualcomm.com>,
 <8760wcdnws.fsf@kamboji.qca.qualcomm.com>,
 <1458834773112.89396@qti.qualcomm.com>
In-Reply-To: <1458834773112.89396@qti.qualcomm.com>
Content-Language: en-US
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "rmanohar@codeaurora.org" <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

[...]
>>
>> I see two new warnings on the kfifo_put() call:
>>
>> drivers/net/wireless/ath/ath10k/htt_rx.c:1722:22: warning: cast to non-scalar
>> drivers/net/wireless/ath/ath10k/htt_rx.c:1722:22: warning: cast from non-scalar
>>
>> But I suspect they are false warnings due to my old compiler:
>>
>> gcc (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3
>>
>> Opinions?
>>
> Hmm... I am not sure why older compiler is not complaining this. Unfortunately
> both x86 and cross compiler are not throwing any warnings though :(
>

older/latest/g
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
