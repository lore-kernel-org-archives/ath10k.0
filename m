Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihfiO-0001RV-24
 for ath10k@lists.infradead.org; Wed, 18 Dec 2019 20:14:37 +0000
Received: by mail-oi1-x244.google.com with SMTP id b8so1822597oiy.5
 for <ath10k@lists.infradead.org>; Wed, 18 Dec 2019 12:14:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20191217153000.76AB1C4479C@smtp.codeaurora.org>
References: <20191216092207.31032-1-john@phrozen.org>
 <20191217153000.76AB1C4479C@smtp.codeaurora.org>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Wed, 18 Dec 2019 21:14:34 +0100
Message-ID: <CAKR_QVJVfqid8i5PXj3Yg8VJjht=MF2fZg+twkLgEkKuMB2bbQ@mail.gmail.com>
Subject: Re: [RESEND] ath10k: add tx hw 802.11 encapusaltion offloading support
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>

On 17/12/2019, Kalle Valo <kvalo@codeaurora.org> wrote:
> John Crispin <john@phrozen.org> wrote:
>
>> This patch adds support for ethernet rxtx mode to the driver. The feature
>> is enabled via a new module parameter. If enabled to driver will enable
>> the feature on a per vif basis if all other requirements were met.
>>
>> Testing on a IPQ4019 based hardware shows a increase in TCP throughput
>> of ~20% when the feature is enabled.
>>
>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
>> Signed-off-by: John Crispin <john@phrozen.org>
>
> Depends on:
>
> 50ff477a8639 mac80211: add 802.11 encapsulation offloading support
>
> Currently in mac80211-next.
>
> Patch set to Awaiting Upstream.
>
> --
> https://patchwork.kernel.org/patch/11293627/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>

the changeset is missing support for 64bit targets in htt_tx.c

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
