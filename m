Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRVOQ-0008JM-Hn
 for ath10k@lists.infradead.org; Thu, 23 Apr 2020 06:31:29 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi
 chips
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1533724802-30944-3-git-send-email-wgong@codeaurora.org>
References: <1533724802-30944-3-git-send-email-wgong@codeaurora.org>
Message-Id: <20200423063121.38039C432C2@smtp.codeaurora.org>
Date: Thu, 23 Apr 2020 06:31:21 +0000 (UTC)
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
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> Upstream kernel has an interface to help adjust sk_pacing_shift to help
> improve TCP UL throughput.
> The sk_pacing_shift is 8 in mac80211, this is based on test with 11N
> WiFi chips with ath9k. For QCA6174/QCA9377 PCI 11AC chips, the 11AC
> VHT80 TCP UL throughput testing result shows 6 is the optimal.
> Overwrite the sk_pacing_shift to 6 in ath10k driver for QCA6174/9377 PCI.
> 
> Tested with QCA6174 PCI with firmware
> WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
> It's not a regression with new firmware releases.
> 
> There have 2 test result of different settings:
> 
> ARM CPU based device with QCA6174A PCI with different
> sk_pacing_shift:
> 
>  sk_pacing_shift  throughput(Mbps)             CPU utilization
>          6            500(-P5)      ~75% idle, Focus on CPU1: ~14%idle
>          7            454(-P5)      ~80% idle, Focus on CPU1: ~4%idle
>          8               288        ~90% idle, Focus on CPU1: ~35%idle
>          9              ~200        ~92% idle, Focus on CPU1: ~50%idle
> 
> 5G TCP UL VTH80 on X86 platform with QCA6174A PCI with sk_packing_shift
> set to 6:
> 
>   tcp_limit_output_bytes            throughput(Mbps)
>  default(262144)+1 Stream                 336
>  default(262144)+2 Streams                558
>  default(262144)+3 Streams                584
>  default(262144)+4 Streams                602
>  default(262144)+5 Streams                598
>  changed(2621440)+1 Stream                598
>  changed(2621440)+2 Streams               601
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

The final result of this patch is unclear so I'm dropping this. Please
resend if the issue still exists.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10559733/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
