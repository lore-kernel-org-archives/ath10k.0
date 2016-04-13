Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqP26-0001pY-FX
 for ath10k@lists.infradead.org; Wed, 13 Apr 2016 17:56:55 +0000
Subject: Re: [PATCH v2] qcom: ipq4019: add wifi nodes to ipq4019 SoC device
 tree
References: <1460434686-23010-1-git-send-email-tamizhchelvam@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <570E8850.9030506@codeaurora.org>
Date: Wed, 13 Apr 2016 10:56:32 -0700
MIME-Version: 1.0
In-Reply-To: <1460434686-23010-1-git-send-email-tamizhchelvam@codeaurora.org>
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
To: tamizhchelvam@codeaurora.org, agross@codeaurora.org, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, c_traja@qti.qualcomm.com, Raja Mani <rmani@codeaurora.org>

On 04/11/2016 09:18 PM, tamizhchelvam@codeaurora.org wrote:
> +			qcom,msi_addr = <0x0b006040>;
> +			qcom,msi_base = <0x50>;

Are these properties used? I couldn't find any usage in the driver but I
may have missed it.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
