Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5O3N-0000Fy-1q
 for ath10k@lists.infradead.org; Thu, 27 Sep 2018 04:37:30 +0000
MIME-Version: 1.0
Date: Thu, 27 Sep 2018 10:06:55 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH] ath10k: Add debugfs support to get power save state
 change of STA
In-Reply-To: <20180926141208.0A87160C86@smtp.codeaurora.org>
References: <1537252467-17353-1-git-send-email-mkenna@codeaurora.org>
 <20180926141208.0A87160C86@smtp.codeaurora.org>
Message-ID: <7a0f6d9724f75bda6d0554810b4efcb7@codeaurora.org>
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

On 2018-09-26 7:42 pm, Kalle Valo wrote:
> Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:
> 
>> This patch helps to get the power save state change of each peer
>> connected to the AP. With WMI_10_4_PEER_STA_PS_STATECHG_EVENTID
>> event, ps state of each peer is reported to user space via
>> debugfs.
>> 
>> Use the below command to get the ps state of each sta:
>> cat /sys/kernel/debug/ieee80211/phyX/netdev::wlanX/stations/
>> XX:XX:XX:XX:XX:XX/peer_ps_state
>> 
>> If STA is in power save state, we get the peer_ps_state value as 1.
>> if STA is not in power save state, we get the peer_ps_state value as 
>> 0.
>> If ps_state event is disabled, we get the peer_ps_state value as 2.
>> 
>> We can enable/disable the ps_state events using the debugfs flag
>> "ps_state_enable"
>> 
>> echo Y > /sys/kernel/debug/ieee80211/phyX/ath10k/ps_state_enable
>> 
>> Y = 1 to enable and Y = 0 to disable
>> 
>> Tested in QCA4019 with firmware ver 10.4-3.2.1.1-00011
>> 
>> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 
> This introduced a new warning:
> 
> drivers/net/wireless/ath/ath10k/wmi.c:5061:1: warning: symbol
> 'ath10k_wmi_event_peer_sta_ps_state_chg' was not declared. Should it
> be static?

[Maha]: Yes, it should be static.

> I fixed this in the pending branch.
[Maha]: Thanks Kalle.

-- 
Regards,
Maha

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
