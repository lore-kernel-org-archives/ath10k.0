Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDJaj-0004YI-KN
 for ath10k@lists.infradead.org; Thu, 26 Sep 2019 02:33:15 +0000
MIME-Version: 1.0
Date: Thu, 26 Sep 2019 10:33:10 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v5 0/8] ath10k: improve throughout of tcp/udp TX/RX of sdio
In-Reply-To: <11062c4e1659ac759cb73af7d46a6db2@codeaurora.org>
References: <1567679893-14029-1-git-send-email-wgong@codeaurora.org>
 <87sgon8inp.fsf@codeaurora.org>
 <11062c4e1659ac759cb73af7d46a6db2@codeaurora.org>
Message-ID: <7f5d822f2dd1f98ba26a8fdecb5dc011@codeaurora.org>
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

On 2019-09-24 20:32, Wen Gong wrote:
> On 2019-09-23 17:29, Kalle Valo wrote:
>> Wen Gong <wgong@codeaurora.org> writes:


patch v6 ath10k: improve throughout of RX of sdio has sent
new patch v6 only have 3 patches, the left patches will also sent later

Alagu Sankar (1):
   ath10k: enable RX bundle receive for sdio

Wen Gong (2):
   ath10k: change max RX bundle size from 8 to 32 for sdio
   ath10k: add workqueue for RX path of sdio

https://patchwork.kernel.org/patch/11160247/
https://patchwork.kernel.org/patch/11160245/
https://patchwork.kernel.org/patch/11160241/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
