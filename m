Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9UfT-0003wm-95
 for ath10k@lists.infradead.org; Wed, 23 Nov 2016 10:20:47 +0000
MIME-Version: 1.0
Date: Wed, 23 Nov 2016 15:50:17 +0530
From: Tamizh chelvam <tamizhchelvam@codeaurora.org>
Subject: Re: [PATCHv2 3/4] dt: bindings: add new dt entry for BTCOEX feature
 in qcom,ath10k.txt
In-Reply-To: <20161118144406.3se7gnckhcmwqytp@rob-hp-laptop>
References: <1479383064-25718-1-git-send-email-c_traja@qti.qualcomm.com>
 <1479383064-25718-4-git-send-email-c_traja@qti.qualcomm.com>
 <20161118144406.3se7gnckhcmwqytp@rob-hp-laptop>
Message-ID: <df0313af8ab0ed1e7bddcfeca8429632@codeaurora.org>
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
Cc: c_traja@qti.qualcomm.com, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Thanks for the comments.

On 2016-11-18 20:14, Rob Herring wrote:
> On Thu, Nov 17, 2016 at 05:14:23PM +0530, c_traja@qti.qualcomm.com 
> wrote:
>> From: Tamizh chelvam <tamizhchelvam@codeaurora.org>
>> 
>> There two things done in this patch.
>> 
>> 1) 'btcoex_support' flag for BTCOEX feature support by the hardware.
>> 2) 'wlan_btcoex_gpio' is used to fill wlan priority pin number for
>>    BTCOEX priority feature support.
>> 
>> Signed-off-by: Tamizh chelvam <tamizhchelvam@codeaurora.org>
>> ---
>>  .../bindings/net/wireless/qcom,ath10k.txt          |    4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt 
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> index 74d7f0a..08150e2d 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -46,6 +46,10 @@ Optional properties:
>>  				 hw versions.
>>  - qcom,ath10k-pre-calibration-data : pre calibration data as an 
>> array,
>>  				     the length can vary between hw versions.
>> +- btcoex_support  : should contain eithr "0" or "1" to indicate 
>> btcoex
>> +		    support by the hardware.
> 
> This is BT coexistence? Make this boolean and n

Yes, this is BT coexistence. And I didn't get what are you trying to say 
in this "Make this boolean and n"
> 
>> +- btcoex_gpio_pin :  btcoex gpio pin number for the device which
>> +		     supports BTCOEX.
> 
> This is a pin number on the chip, not any pin number Linux GPIO subsys
> cares about, right? Is there a connection to the host too, or this is
> internal between BT and WiFi?

This is internal between BT and wifi.
> 
> Do you really need 2 properties? Does supporting this feature require
> the GPIO? If so, then the first property is redundant.
> 
Target/driver can hard copy this gpio pin for some chipsets and there we 
will need btcoex_support flag to find the btcoex support.

> Needs vendor prefix and don't use '_'. Should be something like
> 'qcom,bt-coexist-gpio-pin'.
> 
Sure I'll update this and send in v3 patch


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
