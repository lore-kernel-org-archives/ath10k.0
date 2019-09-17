Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iADfP-0005La-Cd
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 13:37:18 +0000
Message-ID: <5D80E17D.2000800@huawei.com>
Date: Tue, 17 Sep 2019 21:37:01 +0800
From: zhong jiang <zhongjiang@huawei.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Use ARRAY_SIZE instead of dividing sizeof array
 with sizeof an element
References: <1567582878-18739-1-git-send-email-zhongjiang@huawei.com>
 <20190917071632.001AC6155E@smtp.codeaurora.org>
In-Reply-To: <20190917071632.001AC6155E@smtp.codeaurora.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, davem@davemloft.net, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org

On 2019/9/17 15:16, Kalle Valo wrote:
> zhong jiang <zhongjiang@huawei.com> wrote:
>
>> With the help of Coccinelle, ARRAY_SIZE can be replaced in ath10k_snoc_wlan_enable.
>>
>> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
> I already got an identical patch so dropping this one.
>
> error: patch failed: drivers/net/wireless/ath/ath10k/snoc.c:976
> error: drivers/net/wireless/ath/ath10k/snoc.c: patch does not apply
> stg import: Diff does not apply cleanly
>
Thank for your remainder.

Sincerely,
zhong jiang


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
