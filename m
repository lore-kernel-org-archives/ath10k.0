Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fV6DY-0000gM-QV
 for ath10k@lists.infradead.org; Tue, 19 Jun 2018 02:18:02 +0000
Received: by mail-pl0-x244.google.com with SMTP id c41-v6so10056680plj.10
 for <ath10k@lists.infradead.org>; Mon, 18 Jun 2018 19:17:48 -0700 (PDT)
Date: Mon, 18 Jun 2018 19:17:44 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 0/6]  *** Add support for wifi QMI client driver ***
Message-ID: <20180619021742.GA17220@rodete-desktop-imager.corp.google.com>
References: <20180605123304.31969-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180605123304.31969-1-govinds@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, david.brown@linaro.org, andy.gross@linaro.org

Hi Govind,

One more side note: this series is called v2, but I see an older v3.
What's up with that?

On Tue, Jun 05, 2018 at 06:03:04PM +0530, Govind Singh wrote:
> Add QMI client driver for Q6 integrated WLAN connectivity subsystem.
> This module is responsible for communicating WLAN control messages to FW
> over QMI interface.
> 
> QUALCOMM MSM Interface(QMI) provides the control interface between
> components running b/w remote processors with underlying transport layer
> based on integrated chipset(shared memory) or discrete chipset(PCI/USB/SDIO/UART).

So this seems to imply QMI would work with transports that are not
integrated. Except, your code is directly calling SNOC (one of your
integrated chipset interfaces) code from the QMI driver. Correct? I
suppose that's OK for now, but it's a little misleading. If you actually
intend this to support multiple transports, then you might instead want
a callback interface for this.

> QMI client driver implementation is based on qmi frmework https://lwn.net/Articles/729924/.
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

Let's see if I'm interpreting this right:

 * The above process is just initiating a handshake with the QMI
   service and doesn't actually do any loading of firmware on its own;
   it just hands things off to the SNOC client driver (and ath10k core)
   once the firmware is magically ready (??)
 * The ATH10K_FW_FEATURE_NON_BMI flag you added previously basically
   provides a way for a driver (and now we see which driver; it's this
   QMI / SNOC driver) to completely sidestep the typicaly in-kernel
   firmware load implementation; in fact, the kernel only reads the
   WLAN firmware just to parse some feature flags, not to actually
   program it to the device
 * Some yet-unmentioned proprietary app is involved to handle
   sideloading the actual firmware from user space

Is this correct? If not, please correct me. But if it is:

 * When does the user space app actually load the WLAN firmware? I'm not
   sure I can place it in the above diagram.
 * Is there any open source implementation of this? How am I supposed to
   actually use this driver, if it relies on proprietary components that
   I can't review and aren't really even mentioned?

I hope I'm sorely wrong on this. But if I'm not, I don't see why this
driver should be merged at all. Linux drivers should be self-sufficient
wherever possible, and I don't see a good reason why this driver can't
manage actually loading the WLAN firmware on its own, similar to how the
BMI component of the ath10k driver loads firmware for other ath10k
transports. But even more importantly: I believe this driver is hiding
the fact that it relies on undocumented proprietary components to run on
the CPU [1] just to make use of it at all.

Brian

[1] It's an unfortunate fact of life that Wifi (and in this case,
modem+Wifi) processors will run proprietary firmware, but it's not
accepted that Linux relies on proprietary user space.

> Changes in V2:
> 	Removed qmi client driver and integrated qmi client handshakes in snoc platform driver.
> 	Addressed comments v1 version.
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
> 
> Govind Singh (5):
>   ath10k: Add qmi service helpers for wcn3990 qmi client
>   dt: bindings: add bindings for msa memory region
>   ath10k: Add debug mask for QMI layer
>   firmware: qcom: scm: Add WLAN VMID for Qualcomm SCM interface
>   ath10k: Add QMI message handshake for wcn3990 client
> 
> Rakesh Pillai (1):
>   ath10k: Add support to create boardname for non-bmi target
> 
>  .../bindings/net/wireless/qcom,ath10k.txt     |    4 +
>  drivers/net/wireless/ath/ath10k/Kconfig       |   13 +-
>  drivers/net/wireless/ath/ath10k/Makefile      |    4 +-
>  drivers/net/wireless/ath/ath10k/core.c        |   20 +-
>  drivers/net/wireless/ath/ath10k/core.h        |    4 +
>  drivers/net/wireless/ath/ath10k/debug.h       |    1 +
>  drivers/net/wireless/ath/ath10k/qmi.c         | 1030 ++++++++
>  drivers/net/wireless/ath/ath10k/qmi.h         |  136 ++
>  .../net/wireless/ath/ath10k/qmi_wlfw_v01.c    | 2072 +++++++++++++++++
>  .../net/wireless/ath/ath10k/qmi_wlfw_v01.h    |  677 ++++++
>  drivers/net/wireless/ath/ath10k/snoc.c        |  209 +-
>  drivers/net/wireless/ath/ath10k/snoc.h        |    3 +
>  include/linux/qcom_scm.h                      |    4 +-
>  13 files changed, 4160 insertions(+), 17 deletions(-)
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
