Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQB9f-00062g-Md
 for ath10k@lists.infradead.org; Tue, 05 Jun 2018 12:33:41 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v2 0/6]  *** Add support for wifi QMI client driver ***
Date: Tue,  5 Jun 2018 18:03:04 +0530
Message-Id: <20180605123304.31969-1-govinds@codeaurora.org>
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
To: andy.gross@linaro.org, bjorn.andersson@linaro.org, david.brown@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>

Add QMI client driver for Q6 integrated WLAN connectivity subsystem.
This module is responsible for communicating WLAN control messages to FW
over QMI interface.

QUALCOMM MSM Interface(QMI) provides the control interface between
components running b/w remote processors with underlying transport layer
based on integrated chipset(shared memory) or discrete chipset(PCI/USB/SDIO/UART).

QMI client driver implementation is based on qmi frmework https://lwn.net/Articles/729924/.

Below is the sequence of qmi handshake.

       QMI CLIENT(APPS)                                         QMI SERVER(FW in Q6)

                         <------wlan service discoverd----

                       -----connect to wlam qmi service----->

                       ------------wlan info request----->

                       <------------wlan info resp------------

                       ------------msa info req-------->

                     <------------msa info resp------------

                     ------------msa ready req-------->

                     <------------msa ready resp------------

                     <------------msa ready indication-------

                     ------------capability req------->

                    <------------capability resp------------

                    ------------qmi bdf req--------->

                     <------------qmi bdf resp------------

                      ------------qmi cal trigger------->

                  <------------ QMI FW ready indication-------

Changes in V2:
	Removed qmi client driver and integrated qmi client handshakes in snoc platform driver.
	Addressed comments v1 version.
	Switched to ath10k bdf download infra(board-2.bin)
	Added MSA fixed region support to support unload use-case.
	Unified logging.

Testing:
	Tested all qmi handshakes, driver load/unload and STA/SAP sanity testing.
	Tested HW: SDM845(WCN3990)
	Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1



Govind Singh (5):
  ath10k: Add qmi service helpers for wcn3990 qmi client
  dt: bindings: add bindings for msa memory region
  ath10k: Add debug mask for QMI layer
  firmware: qcom: scm: Add WLAN VMID for Qualcomm SCM interface
  ath10k: Add QMI message handshake for wcn3990 client

Rakesh Pillai (1):
  ath10k: Add support to create boardname for non-bmi target

 .../bindings/net/wireless/qcom,ath10k.txt     |    4 +
 drivers/net/wireless/ath/ath10k/Kconfig       |   13 +-
 drivers/net/wireless/ath/ath10k/Makefile      |    4 +-
 drivers/net/wireless/ath/ath10k/core.c        |   20 +-
 drivers/net/wireless/ath/ath10k/core.h        |    4 +
 drivers/net/wireless/ath/ath10k/debug.h       |    1 +
 drivers/net/wireless/ath/ath10k/qmi.c         | 1030 ++++++++
 drivers/net/wireless/ath/ath10k/qmi.h         |  136 ++
 .../net/wireless/ath/ath10k/qmi_wlfw_v01.c    | 2072 +++++++++++++++++
 .../net/wireless/ath/ath10k/qmi_wlfw_v01.h    |  677 ++++++
 drivers/net/wireless/ath/ath10k/snoc.c        |  209 +-
 drivers/net/wireless/ath/ath10k/snoc.h        |    3 +
 include/linux/qcom_scm.h                      |    4 +-
 13 files changed, 4160 insertions(+), 17 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath10k/qmi.c
 create mode 100644 drivers/net/wireless/ath/ath10k/qmi.h
 create mode 100644 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
 create mode 100644 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h

-- 
2.17.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
