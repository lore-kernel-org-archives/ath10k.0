Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtyCN-0004Cq-Ji
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 12:29:28 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 1/2] dt: bindings: add ath10k wireless device
Date: Thu, 27 Nov 2014 13:28:45 +0100
Message-ID: <3202372.2AaH3c4qv1@wuerfel>
In-Reply-To: <20141127120856.17546.32014.stgit@potku.adurom.net>
References: <20141127120727.17546.61202.stgit@potku.adurom.net>
 <20141127120856.17546.32014.stgit@potku.adurom.net>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, toshik@chromium.org, ath10k@lists.infradead.org

On Thursday 27 November 2014 14:08:56 Kalle Valo wrote:
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> new file mode 100644
> index 000000000000..edefc26c6204
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -0,0 +1,30 @@
> +* Qualcomm Atheros ath10k wireless devices
> +
> +For ath10k devices the calibration data can be provided through Device
> +Tree. The node is a child node of the PCI controller.
> +
> +Required properties:
> +-compatible : Should be "qcom,ath10k"
> +
> +Optional properties:
> +- qcom,ath10k-calibration-data : calibration data as an array, the
> +                                length can vary between hw versions
> +

Does the device always have a valid mac address in hardware? If not,
how about listing that as well using the mac-address property?

	Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
