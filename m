Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY5VJ-0000mn-Rk
 for ath10k@lists.infradead.org; Fri, 22 Nov 2019 09:45:32 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH RFC,
 v2] Revert "ath10k: fix DMA related firmware crashes on multiple
 devices"
References: <1573808573-12159-1-git-send-email-zhichen@codeaurora.org>
Date: Fri, 22 Nov 2019 09:45:27 +0000
In-Reply-To: <1573808573-12159-1-git-send-email-zhichen@codeaurora.org> (Zhi
 Chen's message of "Fri, 15 Nov 2019 17:02:53 +0800")
Message-ID: <0101016e9280880c-721d1923-ec22-463b-8945-d219f88c915b-000000@us-west-2.amazonses.com>
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
To: Zhi Chen <zhichen@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Zhi Chen <zhichen@codeaurora.org> writes:

> This reverts commit 76d164f582150fd0259ec0fcbc485470bcd8033e.
> PCIe hung issue was observed on multiple platforms. The issue was reproduced
> when DUT was configured as AP and associated with 50+ STAs.
>
> With PCIe protocol analyzer, we can see DMA Read crossing 4KB boundary when
> issue happened. It broke PCIe spec and caused PCIe stuck.
>
> Tested:  IPQ8064 + QCA9984 with firmware 10.4-3.10-00047
>          QCS404 + QCA9984 with firmware 10.4-3.9.0.2--00044
>          Synaptics AS370 + QCA9888  with firmware 10.4-3.9.0.2--00040
>
> Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
> ---

All comments under --- line is not added to the git repository.

> v2: revert 10.4 only because old chips have different AXI RD/WR CFG

So you should also mention this in the commit log so it gets properly
archived.

And in the next version please remove RFC, as it seems we are reaching a
consensus that is the right approach. Or are there any comments?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
