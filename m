Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqu5b-000660-0R
 for ath10k@lists.infradead.org; Fri, 26 Jul 2019 06:52:28 +0000
MIME-Version: 1.0
Date: Fri, 26 Jul 2019 12:22:24 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH 0/3] ath10k: Clean up regulator and clock handling
In-Reply-To: <20190725174755.23432-1-bjorn.andersson@linaro.org>
References: <20190725174755.23432-1-bjorn.andersson@linaro.org>
Message-ID: <196fa4aa63fd5135aead736396fe3f8c@codeaurora.org>
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On 2019-07-25 23:17, Bjorn Andersson wrote:
> The first patch in this series removes the regulator_set_voltage() of a 
> fixed
> voltate, as fixed regulator constraints should be specified on a board 
> level
> and on certain boards - such as the Lenovo Yoga C630 - the voltage 
> specified
> for the 3.3V regulator is outside the given range.
> 
> The following two patches cleans up regulator and clock usage by using 
> the bulk
> API provided by the two frameworks.
> 
> Bjorn Andersson (3):
>   ath10k: snoc: skip regulator operations
>   ath10k: Use standard regulator bulk API in snoc
>   ath10k: Use standard bulk clock API in snoc
> 
>  drivers/net/wireless/ath/ath10k/snoc.c | 324 ++++---------------------
>  drivers/net/wireless/ath/ath10k/snoc.h |  26 +-
>  2 files changed, 48 insertions(+), 302 deletions(-)

Tested on 845 MTP and QCS404 platform with normal sanity and driver 
recover cases for proxy votes.

Tested-by: Govind Singh <govinds@codeaurora.org>
Reviewed-by: Govind Singh <govinds@codeaurora.org>

BR,
Govind

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
