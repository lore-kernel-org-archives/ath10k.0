Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYCwe-00058T-Kw
 for ath10k@lists.infradead.org; Tue, 23 Feb 2016 13:24:05 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH 1/4] ath10k: remove supported chain mask
Date: Tue, 23 Feb 2016 13:23:33 +0000
Message-ID: <1456233812853.59898@qti.qualcomm.com>
References: <1445948474-16738-1-git-send-email-rmanohar@qti.qualcomm.com>
 <87fv0uq6p7.fsf@kamboji.qca.qualcomm.com>,
 <CALhHN=orRg2mkjcJ1TGssjEocNrRWEhhDV=SKGYANQ-c+YEyzA@mail.gmail.com>
In-Reply-To: <CALhHN=orRg2mkjcJ1TGssjEocNrRWEhhDV=SKGYANQ-c+YEyzA@mail.gmail.com>
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
To: "janusz.dziedzic@tieto.com" <janusz.dziedzic@tieto.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>>> Removing supported chainmask fields as it can be always derived
>>> from num_rf_chains.
>>>
>>> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
>>
> Hello,
>
> This one break monitor mode for qca988x and 10.x firmware:
> After Revert "ath10k: remove supported chain mask" - works correctly.
> 
Janusz,

Thanks for reporting. Will send out patch asap.

-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
