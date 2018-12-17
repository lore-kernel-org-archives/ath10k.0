Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZ0hJ-0003Fn-78
 for ath10k@lists.infradead.org; Mon, 17 Dec 2018 21:45:10 +0000
Received: by mail-ot1-f68.google.com with SMTP id 32so13628898ota.12
 for <ath10k@lists.infradead.org>; Mon, 17 Dec 2018 13:44:59 -0800 (PST)
Date: Mon, 17 Dec 2018 15:44:57 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: net: ath10k: fix node name and
 device type in qcom ath10k example
Message-ID: <20181217214457.GA21038@bogus>
References: <1544544804-4039-1-git-send-email-bperumal@codeaurora.org>
 <1544544804-4039-2-git-send-email-bperumal@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1544544804-4039-2-git-send-email-bperumal@codeaurora.org>
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
To: Bhagavathi Perumal S <bperumal@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, 11 Dec 2018 21:43:22 +0530, Bhagavathi Perumal S wrote:
> In qcom,ath10k documentation, ath10k is used as node name in the example of
> pci based device. Normally, node name should be class of device and not the
> model name, so fix it to node name "wifi". And remove the property device_type
> pci since only pci bridges should have this property.
> 
> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
