Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by casper.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ekoSv-0001cD-C1
 for ath10k@lists.infradead.org; Sun, 11 Feb 2018 10:02:34 +0000
Subject: Re: [PATCH] ath10k: fix use-after-free in ath10k_wmi_cmd_send_nowait
References: <1518317805-5796-1-git-send-email-cjhuang@codeaurora.org>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <3995aa0a-00f0-5ca1-fc49-1fad141fb2ae@nbd.name>
Date: Sun, 11 Feb 2018 10:59:02 +0100
MIME-Version: 1.0
In-Reply-To: <1518317805-5796-1-git-send-email-cjhuang@codeaurora.org>
Content-Language: en-US
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
To: Carl Huang <cjhuang@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 2018-02-11 03:56, Carl Huang wrote:
> The skb may be freed in tx completion context before
> trace_ath10k_wmi_cmd is called. This can be easily captured
> when KASAN(Kernel Address Sanitizer) is enabled. The fix is
> to add a reference count to the skb and release it after
> trace_ath10k_wmi_cmd is called.
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
I think it makes more sense to simply call the trace function before
ath10k_htc_send. Also, for a trivial change like this it probably does
not make sense to add a Copyright line either.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
