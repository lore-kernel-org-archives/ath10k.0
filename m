Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWb2b-0006Vb-0P
 for ath10k@lists.infradead.org; Tue, 11 Dec 2018 05:57:10 +0000
MIME-Version: 1.0
Date: Tue, 11 Dec 2018 11:26:57 +0530
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: ath10k: fix node name and device
 type in qcom ath10k example
In-Reply-To: <20181210232523.GA14192@bogus>
References: <1544466691-11821-1-git-send-email-bperumal@codeaurora.org>
 <1544466691-11821-2-git-send-email-bperumal@codeaurora.org>
 <20181210232523.GA14192@bogus>
Message-ID: <266a1bec89b88abe4637c33b080d85bb@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-12-11 04:55, Rob Herring wrote:
> On Tue, Dec 11, 2018 at 12:01:29AM +0530, Bhagavathi Perumal S wrote:
>> In qcom,ath10k documentation, ath10k is used as node name in the 
>> example of
>> pci based device. Normally, node name shoud be class of device and not 
>> the model
> 
> s/shoud/should/
Thanks, Will correct typo error and send v4 patch.
> 
>> name, so fix it to node name "wifi". And remove the property 
>> device_type pci
>> since only pci bridges should have this property.
>> 
>> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 3 
>> +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt 
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> index 2196d1a..ef60f25 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -74,9 +74,8 @@ pci {
>>  		#address-cells = <3>;
>>  		device_type = "pci";
>> 
>> -		ath10k@0,0 {
>> +		wifi@0,0 {
>>  			reg = <0 0 0 0 0>;
>> -			device_type = "pci";
>>  			qcom,ath10k-calibration-data = [ 01 02 03 ... ];
>>  		};
>>  	};
>> --
>> 1.9.1
>> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
