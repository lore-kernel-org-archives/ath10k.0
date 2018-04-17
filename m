Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8L3O-00044u-Ca
 for ath10k@lists.infradead.org; Tue, 17 Apr 2018 07:29:27 +0000
MIME-Version: 1.0
Date: Tue, 17 Apr 2018 15:29:13 +0800
From: cjhuang@codeaurora.org
Subject: Re: [2/2] ath10k: support MAC address randomization in scan
In-Reply-To: <20180416134238.B16596076A@smtp.codeaurora.org>
References: <1522379640-6442-3-git-send-email-cjhuang@codeaurora.org>
 <20180416134238.B16596076A@smtp.codeaurora.org>
Message-ID: <607d875c3a6fc806781e7ee5dc73c7e9@codeaurora.org>
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

On 2018-04-16 21:42, Kalle Valo wrote:
> Carl Huang <cjhuang@codeaurora.org> wrote:
> 
>> The ath10k reports the random_mac_addr capability to upper layer
>> based on the service bit firmware reported. Driver sets the
>> spoofed flag in scan_ctrl_flag to firmware if upper layer has
>> enabled this feature in scan request.
>> 
>> Test with QCA6174 hw3.0 and 
>> firmware-6.bin_WLAN.RM.4.4.1-00102-QCARMSWP-1,
>> but QCA9377 is also affected.
>> 
>> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 
> This added a new checkpatch warning:
> 
> drivers/net/wireless/ath/ath10k/wmi-ops.h:123: Alignment should match
> open parenthesis
> 
> I fixed it in the pending branch.

Kvalo, as the flag issue NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR will 
be fixed from
Brian side, I don't need to submit V2 for it.

For this alignment warning and sparse warnings in [1/2], as you fixed 
them in the pending
branch, so I needn't do anything, right?


Thanks,
Carl



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
