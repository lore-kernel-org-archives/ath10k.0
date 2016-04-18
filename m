Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1as7mJ-0006hK-Qp
 for ath10k@lists.infradead.org; Mon, 18 Apr 2016 11:55:44 +0000
MIME-Version: 1.0
Date: Mon, 18 Apr 2016 17:25:22 +0530
From: Tamizh chelvam <tamizhchelvam@codeaurora.org>
Subject: Re: [PATCH v2] qcom: ipq4019: add wifi nodes to ipq4019 SoC device
 tree
In-Reply-To: <570E8850.9030506@codeaurora.org>
References: <1460434686-23010-1-git-send-email-tamizhchelvam@codeaurora.org>
 <570E8850.9030506@codeaurora.org>
Message-ID: <f6a444f96a6f602c170b8886f2f9fe9d@codeaurora.org>
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
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, c_traja@qti.qualcomm.com, Raja Mani <rmani@codeaurora.org>, agross@codeaurora.org

On 2016-04-13 23:26, Stephen Boyd wrote:
> On 04/11/2016 09:18 PM, tamizhchelvam@codeaurora.org wrote:
>> +			qcom,msi_addr = <0x0b006040>;
>> +			qcom,msi_base = <0x50>;
> 
> Are these properties used? I couldn't find any usage in the driver but 
> I
> may have missed it.

As of now it is not used in the driver. But it will be needed in the 
future to enable msi in ipq4019 platform.

Thanks,
Tamizh.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
