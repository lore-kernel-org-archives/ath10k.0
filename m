Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5y6V-0005HW-LF
 for ath10k@lists.infradead.org; Thu, 05 Sep 2019 20:11:40 +0000
MIME-Version: 1.0
Date: Thu, 05 Sep 2019 13:11:38 -0700
From: Jeff Johnson <jjohnson@codeaurora.org>
Subject: Re: [PATCH v2] mac80211: Store max_mtu in ieee80211_hw
In-Reply-To: <1567587484-31930-1-git-send-email-wgong@codeaurora.org>
References: <1567587484-31930-1-git-send-email-wgong@codeaurora.org>
Message-ID: <8d156cf1983fb973c9ff5d9d15fb070d@codeaurora.org>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, johannes@sipsolutions.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-09-04 01:58, Wen Gong wrote:
> Make it possibly for drivers to adjust the default mat_mtu

nit: mat_mtu => max_mtu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
