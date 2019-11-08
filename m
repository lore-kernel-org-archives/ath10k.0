Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSzhV-0007RP-15
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 08:33:02 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: disable cpuidle during downloading firmware.
References: <20191101054035.42101-1-ikjn@chromium.org>
 <87y2ws3lvh.fsf@kamboji.qca.qualcomm.com>
 <CAATdQgDhYWgHkujo9m1iUrhSu1Bt9A4C8eS82TD=W22_eaF80g@mail.gmail.com>
Date: Fri, 08 Nov 2019 10:32:56 +0200
In-Reply-To: <CAATdQgDhYWgHkujo9m1iUrhSu1Bt9A4C8eS82TD=W22_eaF80g@mail.gmail.com>
 (Ikjoon Jang's message of "Thu, 7 Nov 2019 12:16:45 +0800")
Message-ID: <877e4aydhj.fsf@kamboji.qca.qualcomm.com>
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
To: Ikjoon Jang <ikjn@chromium.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S . Miller" <davem@davemloft.net>

Ikjoon Jang <ikjn@chromium.org> writes:

> On Thu, Nov 7, 2019 at 2:23 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> Ikjoon Jang <ikjn@chromium.org> writes:
>>
>> > Downloading ath10k firmware needs a large number of IOs and
>> > cpuidle's miss predictions make it worse. In the worst case,
>> > resume time can be three times longer than the average on sdio.
>> >
>> > This patch disables cpuidle during firmware downloading by
>> > applying PM_QOS_CPU_DMA_LATENCY in ath10k_download_fw().
>> >
>> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>>
>> On what hardware and firmware versions did you test this? I'll add that
>> to the commit log.
>>
>> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#guidelines
>
> Thank you for sharing it.
> It's QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00029
> on ARMv8 multi cluster platform.

Thanks, I added that to the commit log.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
