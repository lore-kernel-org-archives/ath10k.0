Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5GWw-0004gF-7W
 for ath10k@lists.infradead.org; Tue, 24 May 2016 17:54:10 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Reduce warning messages during rx without proper channel
 context
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1462893136-16051-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <2a006d27321a4a0390253ca9e1c47348@euamsexm01a.eu.qualcomm.com>
Date: Tue, 24 May 2016 19:53:43 +0200
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> WARN_ON_ONCE when we receive packets for self peer when mac80211
> had not assigned a proper channel context. This scenario happens
> in QCA4019 when we start the AP via hostapd in background and start
> it once again in the background without killing the previous instance!
> This happens intermittently when we start / stop hostapd in a while loop
> (incase the hostapd is not properly killed).  This results in mac80211
> chancontext to be unassigned, while the self peer continuous receive
> packets in target operating channel. This results in lot of call traces
> in the rx path. Make this as a WARN_ON_ONCE to avoid flooding the console
> which result in rebooting low memory systems, while still reporting the
> warning once that we are receiving packets in target operating channel and
> to indicate that something is happening which is not the expected result.
> 
> WARNING: CPU: 0 PID: 0 at ath/ath10k/htt_rx.c:803
> [<c0318838>] (warn_slowpath_null) from [<bf4a0104>]
> (ath10k_htt_rx_h_channel+0xe0/0x1b8 [ath10k_core])
> [<bf4a0104>] (ath10k_htt_rx_h_channel [ath10k_core]) from
> [<bf4a025c>] (ath10k_htt_rx_h_ppdu+0x80/0x288 [ath10k_core])
> [<bf4a025c>] (ath10k_htt_rx_h_ppdu [ath10k_core]) from
> [<bf4a1a9c>] (ath10k_htt_txrx_compl_task+0x724/0x9d4 [ath10k_core])
> [<bf4a1a9c>] (ath10k_htt_txrx_compl_task [ath10k_core])
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Thanks, 1 patch applied to ath.git:

3b0499e9ce42 ath10k: reduce warning messages during rx without proper channel context

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9058791/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
