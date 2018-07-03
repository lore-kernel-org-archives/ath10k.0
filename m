Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faNRw-0002HF-7l
 for ath10k@lists.infradead.org; Tue, 03 Jul 2018 15:42:42 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 3/6] dt: bindings: add bindings for msa memory region
References: <20180605123616.528-1-govinds@codeaurora.org>
 <20180605231814.GB194157@rodete-desktop-imager.corp.google.com>
Date: Tue, 03 Jul 2018 18:42:24 +0300
In-Reply-To: <20180605231814.GB194157@rodete-desktop-imager.corp.google.com>
 (Brian Norris's message of "Tue, 5 Jun 2018 16:18:16 -0700")
Message-ID: <87o9fonx5r.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Brian Norris <briannorris@chromium.org>
Cc: devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, Rob Herring <robh+dt@kernel.org>, andy.gross@linaro.org

Brian Norris <briannorris@chromium.org> writes:

> + Rob
>
> On Tue, Jun 05, 2018 at 06:06:16PM +0530, Govind Singh wrote:
>> Add device tree binding documentation details of msa
>> memory region for ath10k qmi client for SDM845/APQ8098
>> SoC into "qcom,ath10k.txt".
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> ---
>>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> index 7fd4e8ce4149..0efc47f4ba34 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -56,6 +56,8 @@ Optional properties:
>>  				     the length can vary between hw versions.
>>  - <supply-name>-supply: handle to the regulator device tree node
>>  			   optional "supply-name" is "vdd-0.8-cx-mx".
>> +- msa-fixed-region: phandle, specifier to children of reserved MSA memory.
>
> As in reserved-memory/reserved-memory.txt? Might refer to that doc here.
> Or is this some other kind of reserved memory?
>
> If the former, it's normally called just "memory-region", although
> that does seem somewhat non-descriptive...
>
>> +- msa-size: MSA memory size for fw internal use.
>
> Do you really need both of these? It seems like your code uses one or
> the other, not both. In which case, this is not a very good description,
> because it sounds like they would go together.
>
> Also, if you're not using standard/generic properties (e.g., the
> aforementioned "memory-region" binding), you typically should use a
> vendor prefix, like "qcom,msa-size".

Devicetree folks, any comments? I would like to apply this via my
ath.git tree but need help with the review.

Full patch here:

https://patchwork.kernel.org/patch/10448169/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
