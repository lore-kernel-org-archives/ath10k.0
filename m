Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZyIj-0006yp-SM
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 13:23:47 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: net: ath10k: add new dt entry to
 identify external FEM
References: <1544544804-4039-1-git-send-email-bperumal@codeaurora.org>
 <1544544804-4039-3-git-send-email-bperumal@codeaurora.org>
 <20181217203718.GA29320@bogus>
Date: Thu, 20 Dec 2018 15:23:31 +0200
In-Reply-To: <20181217203718.GA29320@bogus> (Rob Herring's message of "Mon, 17
 Dec 2018 14:37:18 -0600")
Message-ID: <87lg4ktjqk.fsf@kamboji.qca.qualcomm.com>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Bhagavathi Perumal S <bperumal@codeaurora.org>

Rob Herring <robh@kernel.org> writes:

> On Tue, Dec 11, 2018 at 09:43:23PM +0530, Bhagavathi Perumal S wrote:
>> This adds new dt entry ext-fem-name, it is used by ath10k driver
>> to select correct timing parameters and configure it in target wifi hardware.
>> The Front End Module(FEM) normally includes tx power amplifier(PA) and
>> rx low noise amplifier(LNA). The default timing parameters like tx end to
>> PA off timing values were fine tuned for internal FEM used in reference
>> design. And these timing values can not be same if ODM modifies hardware
>> design with different external FEM. This DT entry helps to choose correct
>> timing values in driver if different external FEM hardware used.
>> 
>> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> Please add acks/reviewed-bys when posting new versions.

I added your reviewed-by from v3 in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=2f4f5a81c87b9be68aa087c238e2f2b9debbfa1b

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
