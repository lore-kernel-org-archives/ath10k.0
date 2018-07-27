Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiz4x-00031W-KE
 for ath10k@lists.infradead.org; Fri, 27 Jul 2018 09:30:33 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] mac80211: Save sk_pacing_shift to ieee80211_hw
References: <1532589677-16428-2-git-send-email-wgong@codeaurora.org>
 <201807262252.r7bjxM51%fengguang.wu@intel.com>
 <c687d997be0c8e85a5e1e6f09a969dba@codeaurora.org>
Date: Fri, 27 Jul 2018 12:30:17 +0300
In-Reply-To: <c687d997be0c8e85a5e1e6f09a969dba@codeaurora.org> (Wen Gong's
 message of "Fri, 27 Jul 2018 16:35:42 +0800")
Message-ID: <87k1phf2l2.fsf@purkki.adurom.net>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, kbuild test robot <lkp@intel.com>, ath10k@lists.infradead.org, kbuild-all@01.org

Wen Gong <wgong@codeaurora.org> writes:

> Thanks,
> I will add description of tx_sk_pacing_shift as below and sent next
> patch.
> *
> * @tx_sk_pacing_shift: The TCP stack allow more than a single ms of data
> *     to be queued in the stack. The value is a bit-shift of 1 second,
> e.g. 8
> *     is ~4ms of queued data. It only affects local TCP sockets.
> */

Please don't top post:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#do_not_top_post_and_edit_your_quotes

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
