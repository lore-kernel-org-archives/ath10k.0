Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFiOF-00017z-5E
 for ath10k@lists.infradead.org; Sun, 14 Apr 2019 16:54:00 +0000
Received: by mail-lf1-x141.google.com with SMTP id t11so6698307lfl.12
 for <ath10k@lists.infradead.org>; Sun, 14 Apr 2019 09:53:56 -0700 (PDT)
Subject: Re: [PATCH 0/6] ath10k: SDIO and high latency patches from Silex
References: <20190409190851.4557-1-erik.stromdahl@gmail.com>
 <87pnprflj4.fsf@kamboji.qca.qualcomm.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <7b74fac8-2f9e-12c8-bf83-8403aca55d06@gmail.com>
Date: Sun, 14 Apr 2019 18:53:53 +0200
MIME-Version: 1.0
In-Reply-To: <87pnprflj4.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 4/12/19 2:36 PM, Kalle Valo wrote:
> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
> 
>> This series adds a few more fixes for SDIO and high latency devices.
>>
>> I have had these on my private tree for quite some time now so they
>> should be considered fairly well tested.
>>
>> 4 out of 6 patches are from Alagu Sankar at Silex.
>> I have made some adjustments to some of them in order to make them
>> smaller and easier to review.
>>
>> Alagu Sankar (4):
>>    ath10k: use clean packet headers
>>    ath10k: high latency fixes for beacon buffer
>>    ath10k: sdio: read RX packets in bundles
>>    ath10k: sdio: add MSDU ID allocation in HTT TX path
>>
>> Erik Stromdahl (2):
>>    ath10k: sdio: add missing error check
>>    ath10k: sdio: replace skb_trim with explicit set of skb->len
> 
> Bad timing as also me and Wen have been cleaning up these patches and
> finalising the SDIO support so our work overlapped. I'll send our
> version of patches soon and we can then compare.
> 
Ok, I will rework these patches and apply them on top of yours and Wen's.
I'll send a v2 set later.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
