Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKccR-0004oJ-Fp
 for ath10k@lists.infradead.org; Tue, 22 Sep 2020 07:21:44 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Use bdf calibration variant for snoc targets
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1600157948-2042-1-git-send-email-pillair@codeaurora.org>
References: <1600157948-2042-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20200922072142.20549C433FE@smtp.codeaurora.org>
Date: Tue, 22 Sep 2020 07:21:42 +0000 (UTC)
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> Board Data File (BDF) is loaded upon driver boot-up procedure.
> The right board data file is identified using bus and qmi-board-id.
> 
> The problem, however, can occur when the (default) board data
> file cannot fulfill with the vendor requirements and it is
> necessary to use a different board data file.
> 
> Also using the chip_id for identifying the board data helps
> in dealing with different variants of the board data file based
> on the RF card. If the chip_id is not programmed, a default value
> of 0xff will be used for parsing the board data file.
> 
> Add the support to get the variant field from DTSI and
> use this information along with the chip_id to load the vendor
> specific BDF.
> 
> The device tree requires addition strings to define the variant name
> 
>     wifi@a000000 {
>             status = "okay";
>             qcom,ath10k-calibration-variant = "xyz-v2";
>     };
> 
>     wifi@a800000 {
>             status = "okay";
>             qcom,ath10k-calibration-variant = "xyz-v1";
>     };
> 
> This would create the boarddata identifiers for the board-2.bin search
> 
>  *  bus=snoc,qmi-board-id=16,qmi-chip-id=0,variant=xyz-v1
>  *  bus=snoc,qmi-board-id=17,qmi-chip-id=0,variant=xyz-v2
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4e9381056547 ath10k: Use bdf calibration variant for snoc targets

-- 
https://patchwork.kernel.org/patch/11775827/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
