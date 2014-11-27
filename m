Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XttmY-0007L4-Mh
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 07:46:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH V2] ath10k: read calibration data from Device Tree
References: <1415823056-10876-1-git-send-email-toshik@chromium.org>
Date: Thu, 27 Nov 2014 09:46:00 +0200
In-Reply-To: <1415823056-10876-1-git-send-email-toshik@chromium.org> (Toshi
 Kikuchi's message of "Wed, 12 Nov 2014 12:10:56 -0800")
Message-ID: <87lhmxulvr.fsf@kamboji.qca.qualcomm.com>
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
To: Toshi Kikuchi <toshik@chromium.org>
Cc: ath10k@lists.infradead.org

Toshi Kikuchi <toshik@chromium.org> writes:

> V1->V2: fixed a bug that returns an uninitialized value if the node
> is not found.
>
> This patch adds support for reading calibration data from Device Tree.
> It looks for the calibration data in Device Tree if it can't find it
> in a file.
>
> The node for the calibration data should be defined like this:
>
> pci {
>         pcie@0 {
>                 reg = <0 0 0 0 0>;
>                 #interrupt-cells = <1>;
>                 #size-cells = <2>;
>                 #address-cells = <3>;
>                 device_type = "pci";
>
>                 ath10k@0,0 {
>                         reg = <0 0 0 0 0>;
>                         device_type = "pci";
>                         qcom,ath10k-calibration-data = [ 01 02 03 ... ];
>                 };
>         };
> };
>
> Change-Id: I6fe3c50fe2de9177d031a4c17bd95152372dd993
> Signed-off-by: Toshi Kikuchi <toshik@chromium.org>

Thanks! I'll fix some issues I found in the patch, write a bindings
document and send it for review to the devicetree folks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
