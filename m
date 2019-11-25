Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZD4w-0000Cn-V8
 for ath10k@lists.infradead.org; Mon, 25 Nov 2019 12:02:56 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Fix qmi init error handling
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191113154016.42836-1-jeffrey.l.hugo@gmail.com>
References: <20191113154016.42836-1-jeffrey.l.hugo@gmail.com>
Message-ID: <0101016ea2716693-2c1d0904-0688-4154-be0b-505808ecbe9c-000000@us-west-2.amazonses.com>
Date: Mon, 25 Nov 2019 12:02:51 +0000
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
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org, davem@davemloft.net

Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:

> When ath10k_qmi_init() fails, the error handling does not free the irq
> resources, which causes an issue if we EPROBE_DEFER as we'll attempt to
> (re-)register irqs which are already registered.
> 
> Fix this by doing a power off since we just powered on the hardware, and
> freeing the irqs as error handling.
> 
> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

f8a595a87e93 ath10k: Fix qmi init error handling

-- 
https://patchwork.kernel.org/patch/11242133/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
