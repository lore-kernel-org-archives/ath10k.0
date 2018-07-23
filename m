Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fha5N-0000oi-Cr
 for ath10k@lists.infradead.org; Mon, 23 Jul 2018 12:37:10 +0000
MIME-Version: 1.0
Date: Mon, 23 Jul 2018 18:06:58 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v3 3/6] dt: bindings: add bindings for msa memory region
In-Reply-To: <20180711152718.GA18470@rob-hp-laptop>
References: <20180706090043.28363-1-govinds@codeaurora.org>
 <20180711152718.GA18470@rob-hp-laptop>
Message-ID: <5ba59b76dfcc8ba997ce7b0ea880329c@codeaurora.org>
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
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, niklas.cassel@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, andy.gross@linaro.org

Hi Rob,

On 2018-07-11 20:57, Rob Herring wrote:
> On Fri, Jul 06, 2018 at 02:30:43PM +0530, Govind Singh wrote:
>> Add device tree binding documentation details of msa
>> memory region for ath10k qmi client for SDM845/APQ8098
>> SoC into "qcom,ath10k.txt".
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> ---
>>  .../bindings/net/wireless/qcom,ath10k.txt           | 13 
>> +++++++++++++
>>  1 file changed, 13 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt 
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> index 7fd4e8ce4149..87489054aea5 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -57,6 +57,16 @@ Optional properties:
>>  - <supply-name>-supply: handle to the regulator device tree node
>>  			   optional "supply-name" is "vdd-0.8-cx-mx".
>> 
>> += SUBNODES:
>> +wcn3990-wifi node may contain one subnode, named "msa" representing
>> +the fixed msa memory regions used by the wifi firmware running in Q6.
>> +This sub-node must contain:
> 
> Why do you need a sub-node? Just add memory-region property.
> 
Fixed in v4 version.

Thanks,
Govind

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
