Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f85cj-0002y2-0T
 for ath10k@lists.infradead.org; Mon, 16 Apr 2018 15:00:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 13/13] dt: bindings: add bindings for wcn3990 wifi block
References: <1523378986-11551-1-git-send-email-govinds@codeaurora.org>
 <20180413215340.vhvlhlaapt5uuo7d@rob-hp-laptop>
Date: Mon, 16 Apr 2018 18:00:38 +0300
In-Reply-To: <20180413215340.vhvlhlaapt5uuo7d@rob-hp-laptop> (Rob Herring's
 message of "Fri, 13 Apr 2018 16:53:40 -0500")
Message-ID: <878t9np561.fsf@kamboji.qca.qualcomm.com>
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
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rob Herring <robh@kernel.org> writes:

> On Tue, Apr 10, 2018 at 10:19:46PM +0530, Govind Singh wrote:
>> Add device tree binding documentation details for wcn3990
>> wifi block present in Qualcomm SDM845/APQ8098 SoC into
>> "qcom,ath10k.txt".
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> ---
>>  .../bindings/net/wireless/qcom,ath10k.txt          | 31 ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>
> One nit, otherwise:
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>

[...]

>> @@ -119,3 +126,27 @@ wifi0: wifi@a000000 {
>>  	qcom,msi_base = <0x40>;
>>  	qcom,ath10k-pre-calibration-data = [ 01 02 03 ... ];
>>  };
>> +
>> +Example (to supply wcn3990 SoC wifi block details):
>> +
>> +qcom,wifi@18000000 {
>
> wifi@...

I added this and Rob's Reviewed-by to the patch in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=20f4accbe76af8f137b4218ce4973bda6fc3d23e

Govind, please check that it's ok.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
