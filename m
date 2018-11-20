Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOvxW-0002BK-D3
 for ath10k@lists.infradead.org; Tue, 20 Nov 2018 02:40:16 +0000
MIME-Version: 1.0
Date: Tue, 20 Nov 2018 08:10:00 +0530
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: Re: [RFC 2/2] ath10k: Add QCA vendor command/attr support to
 filterneighbor BSS frames
In-Reply-To: <a28348956ba3fbfded80bc78ba1c0335df7edb75.camel@sipsolutions.net>
References: <1530791512-6915-3-git-send-email-periyasa@codeaurora.org>
 <20181005060031.BA1EB60BF4@smtp.codeaurora.org>
 <a28348956ba3fbfded80bc78ba1c0335df7edb75.camel@sipsolutions.net>
Message-ID: <c9b16303e344b2dcd4d52cf9c0830846@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2018-10-18 13:59, Johannes Berg wrote:

>> So I'm not sure what to do with this. A bpf type of filtering system 
>> in
>> mac80211 would be nice
> 
> Yes, I think we really need to start implementing that sooner rather
> than later. I had something, must see if I can find time for it.
> 
>> but then again we cannot benefit from HW offloading.
> 
> Yes, that's a concern. But how big of a concern is it really?
> 
> This patch only talks about "allow an AP" etc. and so while important,
> power isn't the _utmost_ concern like on mobile. Given an efficient
> filtering solution in software, would that be sufficient?

Assume in a scenario where there are multiple APs (One Center AP and 
Multiple repeater AP) in same operating channel.
Clients present in Neighbor APs causing higher traffic.

when we try to filter desire client packets,
In HW offload case, all Neighbor BSS packets are filtered by HW. so 
there is no impact in CPU load. AP performance not get impacted.
In bpf (enabling monitor mode) case, all Neighbor BSS packets get 
filtered by software. It will consume CPU load which will impact AP 
performance.

Irrespective of how many neighbor APs present in the topology, HW 
offload take care of neighbor BSS filtering. Hence no impact in CPU 
load.
so we decided to use HW offload. To use our HW offload feature, we ended 
up in vendor command approach.

Karthikeyan

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
