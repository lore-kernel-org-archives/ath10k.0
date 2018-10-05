Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8JAI-0001Li-MD
 for ath10k@lists.infradead.org; Fri, 05 Oct 2018 06:00:44 +0000
MIME-Version: 1.0
Subject: Re: [RFC 2/2] ath10k: Add QCA vendor command/attr support to
 filterneighbor BSS frames
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1530791512-6915-3-git-send-email-periyasa@codeaurora.org>
References: <1530791512-6915-3-git-send-email-periyasa@codeaurora.org>
Message-Id: <20181005060031.930CC6060A@smtp.codeaurora.org>
Date: Fri,  5 Oct 2018 06:00:31 +0000 (UTC)
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> Add operations to allow an AP to capture frames from stations that
> are active on the operating channel, but not associated to the current AP.
> Operations include add/delete the filter and get the statistics
> information of the unassociated stations.
> 
> User can able to add/delete two type of filters,
> 	1. BSSID
> 	2. STA MAC address
> 
> BSSID filter achieved by HW through vdev_set_neighbor_rx_param WMI command.
> Local device able to capture all frames of the specified BSS using the above
> WMI command. STA filter achieved by SW through RX addr2 matching with
> unassociated station rhash table list keyed by MAC address. rhash table used
> for efficient search. rhash table can grow/shrink by the add/delete STA
> filter request.
> 
> Hardware tested: QCA9984, QCA4019 and QCA9888
> Firmware tested: 10.4-3.6-xxxxx
> 
> NOTE: Tested with debug firmware
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

So I'm not sure what to do with this. A bpf type of filtering system in
mac80211 would be nice but then again we cannot benefit from HW offloading.
Johannes, what do you think?

Here are the full patches:

https://patchwork.kernel.org/patch/10508821/

https://patchwork.kernel.org/patch/10508823/

-- 
https://patchwork.kernel.org/patch/10508823/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
