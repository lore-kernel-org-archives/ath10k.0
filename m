Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSQ7w-00040t-W2
 for ath10k@lists.infradead.org; Wed, 06 Nov 2019 18:33:58 +0000
Received: by mail-ot1-x343.google.com with SMTP id n23so11456353otr.13
 for <ath10k@lists.infradead.org>; Wed, 06 Nov 2019 10:33:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87y2ws3lvh.fsf@kamboji.qca.qualcomm.com>
References: <20191101054035.42101-1-ikjn@chromium.org>
 <87y2ws3lvh.fsf@kamboji.qca.qualcomm.com>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Wed, 6 Nov 2019 19:33:54 +0100
Message-ID: <CAKR_QVKqGv+hpiENHmNFE4y=FY+Mqb7cAh7_5xhTXH27HW+Taw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: disable cpuidle during downloading firmware.
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Ikjoon Jang <ikjn@chromium.org>, "David S . Miller" <davem@davemloft.net>

On 06/11/2019, Kalle Valo <kvalo@codeaurora.org> wrote:
> Ikjoon Jang <ikjn@chromium.org> writes:
>
>> Downloading ath10k firmware needs a large number of IOs and
>> cpuidle's miss predictions make it worse. In the worst case,
>> resume time can be three times longer than the average on sdio.
>>
>> This patch disables cpuidle during firmware downloading by
>> applying PM_QOS_CPU_DMA_LATENCY in ath10k_download_fw().
>>
>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>
> On what hardware and firmware versions did you test this? I'll add that
> to the commit log.
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#guidelines
>
> --
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

Hi

I've tested this on QCA9880. No issues during firmware download.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
