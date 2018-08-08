Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr50057.outbound.protection.outlook.com ([40.107.5.57]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fnThs-0000xj-PW
 for ath10k@lists.infradead.org; Wed, 08 Aug 2018 19:01:18 +0000
Subject: Re: [PATCH v2 0/2] Change sk_pacing_shift in ieee80211_hw for best tx
 throughput
References: <1533724802-30944-1-git-send-email-wgong@codeaurora.org>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <4dbcc269-1f2b-b165-fe9e-8704fd77d1c5@bowerswilkins.com>
Date: Wed, 8 Aug 2018 12:00:46 -0700
MIME-Version: 1.0
In-Reply-To: <1533724802-30944-1-git-send-email-wgong@codeaurora.org>
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
To: Wen Gong <wgong@codeaurora.org>, ath10k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org



On 08/08/2018 03:40 AM, Wen Gong wrote:
> Add a field for ath10k to adjust the sk_pacing_shift, mac80211 set
> the default value to 8, and ath10k will change it to 6. Then mac80211
> will use the changed value 6 as sk_pacing_shift since 6 is the best
> value for tx throughput by test result.
I don't think you can convince people with the numbers unless you 
provide latency along with the numbers and also measurement result on 
different chipsets as Michal addressed (QCA4019, QCA9984, etc.) From 
users view point, I also agree on Toke that we cannot scarify latency 
for the small throughput improvement.

Thanks,
Peter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
