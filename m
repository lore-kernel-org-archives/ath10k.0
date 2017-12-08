Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNG2r-0002Ty-0I
 for ath10k@lists.infradead.org; Fri, 08 Dec 2017 10:38:19 +0000
Received: by mail-qt0-x242.google.com with SMTP id i40so24861776qti.8
 for <ath10k@lists.infradead.org>; Fri, 08 Dec 2017 02:37:56 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: [PATCH v2 0/2] ath10k: DT support for ath10k calibration variant
Date: Fri,  8 Dec 2017 11:37:40 +0100
Message-Id: <20171208103742.3181-1-sven.eckelmann@openmesh.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, robh+dt@kernel.org, Sven Eckelmann <sven@narfation.org>, ext.waldemar.rymarkiewicz@tieto.com, kvalo@codeaurora.org

From: Sven Eckelmann <sven@narfation.org>

Hi,

here is the second version of the qcom,ath10k-calibration-variant support
patchset. I think the ath10k patch describes these changes the best:

Board Data File (BDF) is loaded upon driver boot-up procedure. The right
board data file is identified on QCA4019 using bus, bmi-chip-id and
bmi-board-id.

The problem, however, can occur when the (default) board data file cannot
fulfill with the vendor requirements and it is necessary to use a different
board data file.

This problem was solved for SMBIOS by adding a special SMBIOS type 0xF8.
Something similar has to be provided for systems without SMBIOS but with
device trees. No solution was specified by QCA and therefore a new one has
to be found for ath10k.

The device tree requires addition strings to define the variant name

    wifi@a000000 {
    	status = "okay";
    	qcom,ath10k-calibration-variant = "RT-AC58U";
    };

    wifi@a800000 {
    	status = "okay";
    	qcom,ath10k-calibration-variant = "RT-AC58U";
    };

This would create the boarddata identifiers for the board-2.bin search

 *  bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=RT-AC58U
 *  bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=RT-AC58U


The discussions to the old submissions can be found in:

RFC:
====

* https://patchwork.kernel.org/patch/9613615/

v1:
===

* https://patchwork.kernel.org/patch/9615183/
* https://patchwork.kernel.org/patch/9615185/

Changes since v1:
=================

* check the return value of strscpy and print debug message when buffer
  was not big enough (I would have preferred ath10k_warn but
  ath10k_core_check_bdfext disagreed)

Changes since RFC:
==================

* Split patch in DT doc and ath10k part (thanks Christian Lamparter)
* Remove the words "bmi-chip-id" and "bmi-board-id" and replace them with
  more generic "device specific ids"

Kind regards,
	Sven


Sven Eckelmann (2):
  dt: bindings: add new dt entry for ath10k calibration variant
  ath10k: search DT for qcom,ath10k-calibration-variant

 .../bindings/net/wireless/qcom,ath10k.txt          |  3 ++
 drivers/net/wireless/ath/ath10k/core.c             | 40 ++++++++++++++++++----
 2 files changed, 36 insertions(+), 7 deletions(-)

-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
