Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fd3u9-0003n1-QK
 for ath10k@lists.infradead.org; Wed, 11 Jul 2018 01:26:55 +0000
Received: by mail-pl0-x244.google.com with SMTP id 30-v6so8387746pld.13
 for <ath10k@lists.infradead.org>; Tue, 10 Jul 2018 18:26:43 -0700 (PDT)
Date: Tue, 10 Jul 2018 18:26:39 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v3 0/6] *** Add support for wifi QMI client handshakes ***
Message-ID: <20180711012638.GA100410@ban.mtv.corp.google.com>
References: <20180706085622.27945-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180706085622.27945-1-govinds@codeaurora.org>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: niklas.cassel@linaro.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, andy.gross@linaro.org

Hi,

On Fri, Jul 06, 2018 at 02:26:17PM +0530, Govind Singh wrote:
> Add QMI client handshakes for Q6 integrated WLAN connectivity subsystem.
> This module is responsible for communicating WLAN control messages to FW
> over QMI interface. This patch series enables the qmi handshakes required for
> WCN3990 chipset.
> 
> QUALCOMM MSM Interface(QMI) provides the control interface between
> components running b/w remote processors with underlying transport layer
> based on integrated chipset(shared memory) or discrete chipset(PCI/USB/SDIO/UART).
> 
> QMI client driver implementation is based on qmi framework https://lwn.net/Articles/729924/.
> 
> Below is the sequence of qmi handshake.
> 
>        QMI CLIENT(APPS)                                         QMI SERVER(FW in Q6)
> 
>                          <------wlan service discoverd----
> 
>                        -----connect to wlam qmi service----->
> 
>                        ------------wlan info request----->
> 
>                        <------------wlan info resp------------
> 
>                        ------------msa info req-------->
> 
>                      <------------msa info resp------------
> 
>                      ------------msa ready req-------->
> 
>                      <------------msa ready resp------------
> 
>                      <------------msa ready indication-------
> 
>                      ------------capability req------->
> 
>                     <------------capability resp------------
> 
>                     ------------qmi bdf req--------->
> 
>                      <------------qmi bdf resp------------
> 
>                       ------------qmi cal trigger------->
> 
>                   <------------ QMI FW ready indication-------
> 
> WLAN fw is running in modem Q6 dsp as user PD(protection domain).
> Sequence of user PD loading is as following.
> 
> 1) Remote proc PIL driver loads the modem fw/ROOT PD.
> 2) As part of ROOT pd boot-up it queries to a daemon(pd_mapper) running in apps
> processor to determine how many usre pd's to be loaded by the remote processor(Q6).
> 3) Once user pd info is known to remote processor it loads the user pd via tftp
> protocol.
> 
> https://github.com/andersson/pd-mapper
> https://github.com/andersson/tqftpserv

FWIW, as of today, the tqftpserv implementation is missing a few headers
(so it doesn't even build), and once I hack things such that it can
build, it still doesn't work for me (whereas the closed source version
does). I see some BYE and DEL_CLIENT messages, but no read requests. I
don't think that qualifies as an open source implementation.

Brian

> Changes in V3:
> 	Addressed review comments from v2 version.
> 	Removed msa-size from dt binding and added reference to reserved-memory/reserved-memory.txt.
> 
> Changes in V2:
> 	Removed qmi client driver and integrated qmi client handshakes in snoc platform driver.
> 	Addressed comments on v1 version.
> 	Switched to ath10k bdf download infra(board-2.bin)
> 	Added MSA fixed region support to support unload use-case.
> 	Unified logging.
> 
> Testing:
> 	Tested all qmi handshakes, driver load/unload and STA/SAP sanity testing.
> 	Tested HW: SDM845(WCN3990)
> 	Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1
> 
> 
> Govind Singh (5):
>   ath10k: Add qmi service helpers for wcn3990 qmi client
>   dt: bindings: add bindings for msa memory region
>   firmware: qcom: scm: Add WLAN VMID for Qualcomm SCM interface
>   ath10k: Add debug mask for QMI layer
>   ath10k: Add QMI message handshake for wcn3990 client
> 
> Rakesh Pillai (1):
>   ath10k: Add support to create boardname for non-bmi target
> 
>  .../bindings/net/wireless/qcom,ath10k.txt     |   13 +
>  drivers/net/wireless/ath/ath10k/Kconfig       |    1 +
>  drivers/net/wireless/ath/ath10k/Makefile      |    4 +-
>  drivers/net/wireless/ath/ath10k/core.c        |   14 +-
>  drivers/net/wireless/ath/ath10k/core.h        |    4 +
>  drivers/net/wireless/ath/ath10k/debug.h       |    1 +
>  drivers/net/wireless/ath/ath10k/qmi.c         | 1021 ++++++++
>  drivers/net/wireless/ath/ath10k/qmi.h         |  129 +
>  .../net/wireless/ath/ath10k/qmi_wlfw_v01.c    | 2072 +++++++++++++++++
>  .../net/wireless/ath/ath10k/qmi_wlfw_v01.h    |  677 ++++++
>  drivers/net/wireless/ath/ath10k/snoc.c        |  215 +-
>  drivers/net/wireless/ath/ath10k/snoc.h        |    4 +
>  include/linux/qcom_scm.h                      |    4 +-
>  13 files changed, 4148 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath10k/qmi.c
>  create mode 100644 drivers/net/wireless/ath/ath10k/qmi.h
>  create mode 100644 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
>  create mode 100644 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
> 
> -- 
> 2.17.0
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
