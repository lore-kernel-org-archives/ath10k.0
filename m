Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gU8nd-0002yC-U3
 for ath10k@lists.infradead.org; Tue, 04 Dec 2018 11:23:35 +0000
Received: by mail-ot1-x341.google.com with SMTP id e12so14824204otl.5
 for <ath10k@lists.infradead.org>; Tue, 04 Dec 2018 03:23:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <d7d53ffb-9778-927c-5030-243c2ae57fcc@newmedia-net.de>
References: <1543858415-23953-1-git-send-email-bperumal@codeaurora.org>
 <1543858415-23953-3-git-send-email-bperumal@codeaurora.org>
 <d7d53ffb-9778-927c-5030-243c2ae57fcc@newmedia-net.de>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Tue, 4 Dec 2018 12:23:22 +0100
Message-ID: <CAKR_QVKFx3oqb7cvyeY_+fKMxKA9PQkSDex-tvxrQcdc7hJ-CQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: net: ath10k: add new dt entry to
 identify external FEM
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
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Bhagavathi Perumal S <bperumal@codeaurora.org>

On 04/12/2018, Sebastian Gottschall <s.gottschall@newmedia-net.de> wrote:
> Hi
>
> you write that
>
> "microsemi-lx5586", "sky85703-11" and "sky85803" is supported, but you just
> check for microsemi-lx5586
>   in part 3
>
> Am 03.12.2018 um 18:33 schrieb Bhagavathi Perumal S:
>> This adds new dt entry ext-fem-name, it is used by ath10k driver
>> to select correct timing parameters and configure it in target wifi
>> hardware.
>> The Front End Module(FEM) normally includes tx power amplifier(PA) and
>> rx low noise amplifier(LNA). The default timing parameters like tx end to
>> PA off timing values were fine tuned for internal FEM used in reference
>> design. And these timing values can not be same if ODM modifies hardware
>> design with different external FEM. This DT entry helps to choose correct
>> timing values in driver if different external FEM hardware used.
>>
>> Signed-off-by: Bhagavathi Perumal S<bperumal@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 8
>> +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> index ef60f25..2dd0c52 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -61,8 +61,13 @@ Optional properties:
>>   	Value type: <phandle>
>>   	Definition: reference to the reserved-memory for the msa region
>>   		    used by the wifi firmware running in Q6.
>> +- ext-fem-name:
>> +	Usage: Optional
>> +	Value type: string
>> +	Definition: Name of external front end module used. Valid FEM names are
>> +		    "microsemi-lx5586", "sky85703-11" and "sky85803" etc.
>>
>> -Example (to supply the calibration data alone):
>> +Example (to supply PCI based wifi block details):
>>
>>   In this example, the node is defined as child node of the PCI
>> controller.
>>
>> @@ -77,6 +82,7 @@ pci {
>>   		wifi@0,0 {
>>   			reg = <0 0 0 0 0>;
>>   			qcom,ath10k-calibration-data = [ 01 02 03 ... ];
>> +			ext-fem-name = "microsemi-lx5586";
>>   		};
>>   	};
>>   };
>> -- 1.9.1
>

Sebastian might be right.

"Valid FEM names are
>> +		    "microsemi-lx5586", "sky85703-11" and "sky85803" etc."

etc. inidicate you could put whatever here. where does the actual code
resides that manages different FEM ?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
