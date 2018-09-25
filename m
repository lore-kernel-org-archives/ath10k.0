Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4mAf-0003Ho-Pj
 for ath10k@lists.infradead.org; Tue, 25 Sep 2018 12:10:31 +0000
MIME-Version: 1.0
Date: Tue, 25 Sep 2018 17:39:59 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH 3/4] dt: bindings: add bindings for wifi iommu node
In-Reply-To: <5baa1b0b.1c69fb81.79d38.4171@mx.google.com>
References: <20180921090907.25937-1-govinds@codeaurora.org>
 <20180921090907.25937-4-govinds@codeaurora.org>
 <5baa1b0b.1c69fb81.79d38.4171@mx.google.com>
Message-ID: <74c8e0f9eb793720e3dff4e3cff382b5@codeaurora.org>
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
Cc: andy.gross@linaro.org, devicetree@vger.kernel.org, briannorris@chromium.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-09-25 04:23, Rob Herring wrote:
> On Fri, Sep 21, 2018 at 02:39:06PM +0530, Govind Singh wrote:
>> WCN3990 wifi module can optionally make use of the IOMMU.
> 
> Can the other compatibles use IOMMU too?
> 

No, only wcn3990 can optionally use IOMMU.

>> Add binding documentation for phandle to the IOMMU and
>> the stream id of wifi iommu block.
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> ---
>>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt         | 5 
>> +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt 
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> index 22dea7d83ee8..07e58008c665 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -59,6 +59,10 @@ Optional properties:
>>  - <supply-name>-supply: handle to the regulator device tree node
>>  			   optional "supply-name" are "vdd-0.8-cx-mx",
>>  			   "vdd-1.8-xo", "vdd-1.3-rfa" and "vdd-3.3-ch0".
>> +- iommus:
>> +	Usage: optional
>> +	Value type: <prop-encoded-array>
>> +	Definition: A list of phandle and IOMMU specifier pairs.
>> 
>>  Example (to supply the calibration data alone):
>> 
>> @@ -157,4 +161,5 @@ wifi@18000000 {
>>  		vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
>>  		vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
>>  		vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>> +		iommus = <&apps_smmu 0x0040 0x1>;
>>  };
>> --
>> 2.17.0
>> 

BR,
Govind

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
