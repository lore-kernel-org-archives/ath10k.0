Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agx6t-00059W-UK
 for ath10k@lists.infradead.org; Fri, 18 Mar 2016 16:18:48 +0000
Date: Fri, 18 Mar 2016 11:18:23 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt: bindings: add new dt entry for pre calibration in
 qcom,ath10k.txt
Message-ID: <20160318161823.GA5558@rob-hp-laptop>
References: <1457604724-14378-1-git-send-email-rmani@qti.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1457604724-14378-1-git-send-email-rmani@qti.qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: devicetree@vger.kernel.org, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

On Thu, Mar 10, 2016 at 03:42:04PM +0530, Raja Mani wrote:
> There two things done in this patch,
> 
> 1) Existing device tree entry 'qcom,ath10k-calibration-data' carries
>    not only calibration data, it carries board specific data too.
>    So, make appropriate update in doc.
> 
> 2) ipq4019 wifi needs new devie tree entry to carry calibration
>    data alone (called pre cal data, it doesn't include any other info).
>    Using 'qcom,ath10k-calibration-data' for ipq4019 would alter
>    the purpose of it. Hence, add new device tree entry called
>    'qcom,ath10k-pre-calibration-data' to carry only pre calibration data.
> 
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
> ---
> 
> Below patches covers the corresponding changes in the ath10k driver.
> It's posted separately to ath10k and linux-wireless mailing list.

Generally the series should be posted together. The rest should not be 
merged until this patch is accepted.

> 
>   1) ath10k: pass cal data location as an argument to ath10k_download_cal_{file|dt}
>   2) ath10k: move cal data len to hw_params
>   3) ath10k: incorporate qca4019 cal data download sequence
> 
>  .../bindings/net/wireless/qcom,ath10k.txt          | 23 +++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
