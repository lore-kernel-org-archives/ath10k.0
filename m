Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5qgW-0005NQ-KU
 for ath10k@lists.infradead.org; Thu, 05 Sep 2019 12:16:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 1/8] ath10k: adjust skb length in
 ath10k_sdio_mbox_rx_packet
References: <1567416146-14403-1-git-send-email-wgong@codeaurora.org>
 <1567416146-14403-2-git-send-email-wgong@codeaurora.org>
 <CANMq1KANHhmP+yEj7Yw3P+akT+mM=y6rjfq1sEjg0NUuWJkdCw@mail.gmail.com>
Date: Thu, 05 Sep 2019 15:16:13 +0300
In-Reply-To: <CANMq1KANHhmP+yEj7Yw3P+akT+mM=y6rjfq1sEjg0NUuWJkdCw@mail.gmail.com>
 (Nicolas Boichat's message of "Tue, 3 Sep 2019 16:02:09 +0800")
Message-ID: <87a7bjlz02.fsf@kamboji.qca.qualcomm.com>
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
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Nicolas Boichat <drinkcat@chromium.org> writes:

> Kalle: Can you please help prioritize the review and merge of this
> patch? This is quite a serious regression (the rest of the series is
> performance improvement and probably a little less urgent).

Ok, I'll prioritise this (but I have not reviewed it yet).

But in the future if there's something urgent, it's best to submit the
patch separately and label it with "[PATCH 5.3]" or something like that:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#tree_labels

This way I can find the patch faster.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
