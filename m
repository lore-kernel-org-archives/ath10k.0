Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2q3j-0007Er-Ew
 for ath10k@lists.infradead.org; Wed, 28 Aug 2019 04:59:53 +0000
Subject: RE: [PATCH] ath10k: add fw coredump for sdio when firmware assert
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Wed, 28 Aug 2019 04:59:40 +0000
Message-ID: <8f0f2930e12a4dcabb69c13affe89a31@aptaiexm02f.ap.qualcomm.com>
References: <1566371979-22730-1-git-send-email-wgong@codeaurora.org>
 <CANMq1KDGWh6Cc8akX_1g-n_fYe_2FHrpgnWf=sLxFnME7t5vBQ@mail.gmail.com>
In-Reply-To: <CANMq1KDGWh6Cc8akX_1g-n_fYe_2FHrpgnWf=sLxFnME7t5vBQ@mail.gmail.com>
Content-Language: en-US
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
To: Nicolas Boichat <drinkcat@chromium.org>, Wen Gong <wgong@codeaurora.org>
Cc: Brian Norris <briannorris@chromium.org>, "open list:NETWORKING DRIVERS
 (WIRELESS)" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Nicolas
> Boichat
> Sent: Tuesday, August 27, 2019 8:08 PM
> To: Wen Gong <wgong@codeaurora.org>
> Cc: Brian Norris <briannorris@chromium.org>; open list:NETWORKING
> DRIVERS (WIRELESS) <linux-wireless@vger.kernel.org>;
> ath10k@lists.infradead.org
> Subject: [EXT] Re: [PATCH] ath10k: add fw coredump for sdio when firmware
> assert
> 
> Just a few nits, this is a lot of code and I'll try to give it a second pass.
> 
> On Wed, Aug 21, 2019 at 3:20 PM Wen Gong <wgong@codeaurora.org>
> wrote:
> >
> > When firmware assert, it need coredump to analyze, this patch will
> > collect the register and memory info for sdio chip.
> >
> > The coredump configuration is different between PCIE and SDIO for
> > the same reversion, so this patch add bus type to distinguish PCIE
> > and SDIO chip for coredump.
> >
> > Tested with QCA6174 SDIO with firmware
> > WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> >
> > Signed-off-by: Wen Gong <wgong@codeaurora.org>
> > ---
> >  drivers/net/wireless/ath/ath10k/bmi.c       |   1 +
> >  drivers/net/wireless/ath/ath10k/core.c      |   7 +-
> >  drivers/net/wireless/ath/ath10k/core.h      |   4 +-
> >  drivers/net/wireless/ath/ath10k/coredump.c  | 338
> +++++++++++++++++++++++++++-
> >  drivers/net/wireless/ath/ath10k/coredump.h  |   1 +
> >  drivers/net/wireless/ath/ath10k/hw.h        |   1 +
> >  drivers/net/wireless/ath/ath10k/sdio.c      | 335
> ++++++++++++++++++++++++++-
> >  drivers/net/wireless/ath/ath10k/targaddrs.h |  10 +
> >  8 files changed, 692 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/bmi.c
> b/drivers/net/wireless/ath/ath10k/bmi.c
> > index 95dc4be..990fa4d 100644
> > --- a/drivers/net/wireless/ath/ath10k/bmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/bmi.c
> > @@ -197,6 +197,7 @@ int ath10k_bmi_read_memory(struct ath10k *ar,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL(ath10k_bmi_read_memory);
> >
> >  int ath10k_bmi_write_soc_reg(struct ath10k *ar, u32 address, u32 reg_val)
> >  {
> > diff --git a/drivers/net/wireless/ath/ath10k/core.c
> b/drivers/net/wireless/ath/ath10k/core.c
> > index dc45d16..0ea4c36 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -33,7 +33,6 @@
> >  static bool skip_otp;
> >  static bool rawmode;
> >  static bool fw_diag_log;
> > -
> 
> Don't do whitespace changes (unless you're changing code in the area
> anyway).
Will remove this
> 
> >  unsigned long ath10k_coredump_mask =
> >  static int ath10k_init_configure_target(struct ath10k *ar)
> > @@ -1953,6 +1956,8 @@ static void ath10k_core_get_fw_name(struct
> ath10k *ar, char *fw_name,
> >                 scnprintf(fw_name, fw_name_len, "%s-%d.bin",
> >                           ATH10K_FW_FILE_BASE, fw_api);
> >                 break;
> > +       default:
> > +               break;
> 
> Why?
It is a error for build, so add it.
core.c:1815:10: error: enumeration value 'ATH10K_BUS_UNDEF' not handled in switch [-Werror,-Wswitch]
        switch (ar->hif.bus) {

> 
> >         }
> >  }
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/core.h
> b/drivers/net/wireless/ath/ath10k/core.h
> > index 4d7db07..1b52a3c 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.h
> > +++ b/drivers/net/wireless/ath/ath10k/core.h
> > @@ -97,7 +97,9 @@ static inline const char *ath10k_bus_str(enum
> ath10k_bus bus)
> >                 return "usb";
> >         case ATH10K_BUS_SNOC:
> >                 return "snoc";
> > -       }
> > +       default:
> > +               return "unknown";
> > +}
> 
> This change does not look very useful? Also the indentation is broken.
It is a error for build, so add it. same with last one
Will change indentation.
> 
> 
> >
> >         return "unknown";
> >  }
> > diff --git a/drivers/net/wireless/ath/ath10k/coredump.c
> b/drivers/net/wireless/ath/ath10k/coredump.c
> > index b6d2932..b287509 100644
> > --- a/drivers/net/wireless/ath/ath10k/coredump.c
> > +++ b/drivers/net/wireless/ath/ath10k/coredump.c
> > @@ -270,6 +270,277 @@
> >         {0x80010, 0x80020},
> >  };
> >
> > +static const struct ath10k_mem_section
> qca6174_hw30_sdio_register_sections[] = {
> > +       {0x800, 0x810},
> > +       {0x820, 0x82C},
> > +
> > +       /* EFUSE0,1,2 is disabled here
> > +        * because it's state may be reset
> 
> its state
Will change it
> 
> >  static const struct ath10k_mem_section qca6174_hw30_register_sections[]
> = {
> >         {0x800, 0x810},
> >         {0x820, 0x82C},
> > @@ -602,6 +873,59 @@
> >         },
> >  };
> >
> > +static const struct ath10k_mem_region
> qca6174_hw30_sdio_mem_regions[] = {
> > +       {
> > +               .type = ATH10K_MEM_REGION_TYPE_DRAM,
> > +               .start = 0x400000,
> > +               .len = 0xa8000,
> > +               .name = "DRAM",
> > +               .section_table = {
> > +               .sections = NULL,
> > +               .size = 0,
> 
> Indentation.
Will change it.
> 
> > +               },
> > +       },
> > +       {
> > +               .type = ATH10K_MEM_REGION_TYPE_AXI,
> > +               .start = 0xa0000,
> > +               .len = 0x18000,
> > +               .name = "AXI",
> > +               .section_table = {
> > +                       .sections = NULL,
> > +                       .size = 0,
> > +               },
> > +       },
> > +       {
> > +               .type = ATH10K_MEM_REGION_TYPE_IRAM1,
> > +               .start = 0x00980000,
> > +               .len = 0x00080000,
> > +               .name = "IRAM1",
> > +               .section_table = {
> > +               .sections = NULL,
> > +               .size = 0,
> 
> Indentation
Will change it.
> 
> > +               },
> > +       },
> > +       {
> > +               .type = ATH10K_MEM_REGION_TYPE_IRAM2,
> > +               .start = 0x00a00000,
> > +               .len = 0x00040000,
> > +               .name = "IRAM2",
> > +               .section_table = {
> > +               .sections = NULL,
> > +               .size = 0,
> 
> Indentation
Will change it.
> 
> >
> >  enum ath10k_bus {
> > +       ATH10K_BUS_UNDEF,
> 
> Maybe call this "_ANY", given that you use it to match any bus?
Yes, seems ANY is more reasonable
> 
> >         ATH10K_BUS_PCI,
> >         ATH10K_BUS_AHB,
> >         ATH10K_BUS_SDIO,
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
