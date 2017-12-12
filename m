Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOrYf-0007Fm-1A
 for ath10k@lists.infradead.org; Tue, 12 Dec 2017 20:53:51 +0000
Received: by mail-oi0-f67.google.com with SMTP id r63so143626oia.6
 for <ath10k@lists.infradead.org>; Tue, 12 Dec 2017 12:53:24 -0800 (PST)
Date: Tue, 12 Dec 2017 14:53:22 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt: bindings: add new dt entry for ath10k
 calibration variant
Message-ID: <20171212205322.xwswit2myivd7o6h@rob-hp-laptop>
References: <20171208103742.3181-1-sven.eckelmann@openmesh.com>
 <20171208103742.3181-2-sven.eckelmann@openmesh.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20171208103742.3181-2-sven.eckelmann@openmesh.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, ext.waldemar.rymarkiewicz@tieto.com, kvalo@codeaurora.org

On Fri, Dec 08, 2017 at 11:37:41AM +0100, Sven Eckelmann wrote:
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
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>                  

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
