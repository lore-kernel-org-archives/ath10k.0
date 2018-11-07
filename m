Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKVPI-00048g-UC
 for ath10k@lists.infradead.org; Wed, 07 Nov 2018 21:30:38 +0000
MIME-Version: 1.0
Date: Wed, 07 Nov 2018 13:30:23 -0800
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH REGRESSION] Revert "ath10k: add quiet mode support for
 QCA6174/QCA9377"
In-Reply-To: <20181107185643.240346-1-briannorris@chromium.org>
References: <20181107185643.240346-1-briannorris@chromium.org>
Message-ID: <7f2ef494f4a2aba1845a157da8fec449@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Yu Wang <yyuwang@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>, stable@vger.kernel.org

On 2018-11-07 10:56, Brian Norris wrote:
> This reverts commit cfb353c0dc058bc1619cc226d3cbbda1f360bdd3.
> 
> WCN3990 firmware does not yet implement this feature, and so it crashes
> like this:
> 
>   fatal error received: err_qdi.c:456:EX:wlan_process:1:WLAN 
> RT:207a:PC=b001b4f0
> 
> This feature can be re-implemented with a proper service bitmap or 
> other
> feature-discovery mechanism in the future. But it should not break
> working boards.
> 
Brian,

The change "ath10k: add quiet mode support for QCA6174/QCA9377" was 
merged even
before full WCN3990 device support was added in ath10k. How come it 
could be regression
for WCN3990. I know both are sharing same WMI-TLV interface but 
reverting this
will break QCA6174/QCA9377. no?

I would prefer to handle this within WMI callback or upper layer.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
