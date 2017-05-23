Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDBhK-0005Mo-6U
 for ath10k@lists.infradead.org; Tue, 23 May 2017 15:26:17 +0000
MIME-Version: 1.0
Subject: Re: [v2] ath10k: remove unnecessary code
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20170509125129.GA21962@embeddedgus>
References: <20170509125129.GA21962@embeddedgus>
Message-ID: <b5d346a9f0fd483f96b7f0fff6174750@euamsexm01a.eu.qualcomm.com>
Date: Tue, 23 May 2017 17:25:41 +0200
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
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

"Gustavo A. R. Silva" <garsilva@embeddedor.com> wrote:
> The array fields in struct wmi_start_scan_arg that are checked here are
> fixed size arrays so they can never be NULL.
> 
> Addresses-Coverity-ID: 1260031
> Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>
> Cc: Kalle Valo <kvalo@qca.qualcomm.com>
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>

Patch applied to ath-next branch of ath.git, thanks.

8c1f20815231 ath10k: remove unnecessary code

-- 
https://patchwork.kernel.org/patch/9717869/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
