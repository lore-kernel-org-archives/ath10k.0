Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xy0KD-00082p-KU
 for ath10k@lists.infradead.org; Mon, 08 Dec 2014 15:34:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 0/2] ath10k: device tree support
References: <20141127120727.17546.61202.stgit@potku.adurom.net>
Date: Mon, 8 Dec 2014 17:33:40 +0200
In-Reply-To: <20141127120727.17546.61202.stgit@potku.adurom.net> (Kalle Valo's
 message of "Thu, 27 Nov 2014 14:08:47 +0200")
Message-ID: <878uii17hn.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, toshik@chromium.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> here's providing ath10k calibration data via device tree support which
> Toshi and me have been working on. Please review.
>
> Device tree maintainers: please review the bindings document
> carefully, this is the first time I have written one.
>
> v4:
>
> * use correct devicetree mailing list address
>
> v3:
>
> * add a debug message to ath10k
>
> * write bindings file
>
> * use ar->dev.of_node instead of pci_device_to_OF_node()
>
> v2:
>
> * fixed a bug that returns an uninitialized value if the node is not
>   found
>
> ---
>
> Kalle Valo (1):
>       dt: bindings: add ath10k wireless device
>
> Toshi Kikuchi (1):
>       ath10k: read calibration data from Device Tree

Both patches applied. Thanks Toshi.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
