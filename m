Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePVRU-00018j-V7
 for ath10k@lists.infradead.org; Thu, 14 Dec 2017 15:29:03 +0000
MIME-Version: 1.0
Subject: Re: [v2,
 1/2] dt: bindings: add new dt entry for ath10k calibration variant
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20171208103742.3181-2-sven.eckelmann@openmesh.com>
References: <20171208103742.3181-2-sven.eckelmann@openmesh.com>
Message-ID: <c17f0a577bcd41569831c4eb556d376e@euamsexm01a.eu.qualcomm.com>
Date: Thu, 14 Dec 2017 16:28:24 +0100
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, robh+dt@kernel.org, ext.waldemar.rymarkiewicz@tieto.com, kvalo@codeaurora.org

Sven Eckelmann <sven.eckelmann@openmesh.com> wrote:

> The bus + bmi-chip-id + bmi-board-id is not enough to identify the correct
> board data file on QCA4019 based devices. Multiple different boards share
> the same values. Only the original reference designs can currently be
> identified and loaded from the board-2.bin. But these will not result in
> the correct calibration data when combined with the pre-calibration data
> from the device.
> 
> An additional "variant" information has to be provided (via SMBIOS or DT)
> to select the correct board data for a design which was modified by an ODM.
> 
> Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

2 patches applied to ath-next branch of ath.git, thanks.

40fb0eab30ba dt: bindings: add new dt entry for ath10k calibration variant
d06f26c5c8a4 ath10k: search DT for qcom,ath10k-calibration-variant

-- 
https://patchwork.kernel.org/patch/10102249/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
